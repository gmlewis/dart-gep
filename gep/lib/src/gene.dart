// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'dart:mirrors';

import 'package:meta/meta.dart';

import 'functions.dart';
import 'vector.dart';

/// Gene represents a single GEP gene.
/// It contains the symbols useds in the gene's expression.
class Gene<T> {
  Gene(this.allFuncs) {}

  /// Creates a new gene based on the Karva string representation.
  Gene.fromKarva(String karva, this.allFuncs)
      : symbols = [],
        constants = [],
        headSize = 0,
        numTerminals = 0,
        numConstants = 0,
        symbolMap = {} {
    var numInputs = 0;
    final parts = karva.split('.');
    parts.forEach((part) {
      var sym = Symbol(part);
      symbols.add(sym);
      symbolMap[sym] ??= 0;
      if (part.startsWith('d')) {
        final index = num.parse(part.substring(1));
        if (index >= numInputs) numInputs = index + 1;
      } else if (part.startsWith('c')) {
        final index = num.parse(part.substring(1));
        if (index >= numConstants) numConstants = index + 1;
      }
    });
    constants = List<T>.filled(numConstants, zeroValue);
    numTerminals = numInputs + numConstants;

    var ao = argOrder();
    model = buildModel(0, ao);
  }

  final Map<Symbol, Func<T>> allFuncs;
  List<Symbol> symbols;
  List<T> constants;
  FuncImpl<T> model;

  @visibleForTesting
  int headSize;
  @visibleForTesting
  int numTerminals;
  @visibleForTesting
  int numConstants;

  // Note that symbolMap does not represent the total number
  // of times each symbol appears in the list, but the total
  // number of times each symbol appears in the a actual
  // evaluation expression.
  @visibleForTesting
  Map<Symbol, int> symbolMap;

  T get zeroValue => null;

  // toString returns the Karva representation of the Gene.
  String toString() {
    var syms =
        List.generate(symbols.length, (i) => MirrorSystem.getName(symbols[i]));
    return syms.join('.');
  }

  // argOrder generates a slice of argument indices (1-based) for every function
  // within the list of symbols. It takes into account the arity of each function.
  //
  // argOrder is used to build up the actual evaluatable expression tree.
  //
  // For example:
  //   '+.*.-./' => [[1, 2], [3, 4], [5, 6], [7, 8]]
  //   '+.d0.c0./' => [[1, 2], nil, nil, [3, 4]]
  @visibleForTesting
  List<List<int>> argOrder() {
    List<List<int>> result = [];
    var argCount = 0;
    symbols.forEach((sym) {
      if (!allFuncs.containsKey(sym)) {
        result.add(null);
        return;
      }
      final f = allFuncs[sym];
      final n = f.terminals;
      if (n <= 0) {
        return;
      }
      result.add(List.generate(n, (i) => ++argCount));
    });
    return result;
  }

  // buildModel recursively builds a function that implements the Karva
  // expression. While it build, it also builds up the actual symbol
  // usage within [symbolMap].
  @visibleForTesting
  buildModel(int symbolIndex, List<List<int>> argOrder) {
    if (symbolIndex >= symbols.length) {
      throw 'bad symbolIndex $symbolIndex for symbols $symbols';
    }
    var sym = symbols[symbolIndex];
    symbolMap[sym]++;
    if (allFuncs.containsKey(sym)) {
      var f = allFuncs[sym];
      var args = argOrder[symbolIndex];
      var funcs = List.generate(
          args.length, (index) => buildModel(args[index], argOrder));
      return (List<T> input) {
        var values =
            List.generate<T>(funcs.length, (index) => funcs[index](input));
        return f.func(values);
      };
    } else {
      var symName = MirrorSystem.getName(sym);
      if (symName.startsWith('d')) {
        // No named symbol found - look for inputs and constants
        var index = int.tryParse(symName.substring(1));
        if (index == null) {
          throw 'unable to parse input index: sym=$symName';
        }
        return (List<T> input) {
          if (index >= input.length) {
            print(
                'error evaluating gene $sym: index $index >= d length (${input.length})');
            return 0.0;
          }
          return input[index];
        };
      } else if (symName.startsWith('c')) {
        var index = int.tryParse(symName.substring(1));
        if (index == null) {
          throw 'unable to parse constant index: sym=$symName';
        }
        return (List<T> input) {
          if (index >= constants.length) {
            print(
                'error evaluating gene $sym: index $index >= c length (${input.length})');
            return 0.0;
          }
          return constants[index];
        };
      }
    }
    throw 'unable to return function: unknown gene symbol $sym';
  }
}

class DoubleGene extends Gene<double> {
  DoubleGene() : super(DoubleFunctions().all);

  DoubleGene.fromKarva(String karva)
      : super.fromKarva(karva, DoubleFunctions().all);

  @override
  double get zeroValue => 0.0;
}

class IntGene extends Gene<int> {
  IntGene() : super(IntFunctions().all);

  IntGene.fromKarva(String karva) : super.fromKarva(karva, IntFunctions().all);

  @override
  int get zeroValue => 0;
}

class VectorDoubleGene extends Gene<VectorDouble> {
  VectorDoubleGene() : super(VectorDoubleFunctions().all);

  VectorDoubleGene.fromKarva(String karva)
      : super.fromKarva(karva, VectorDoubleFunctions().all);

  @override
  VectorDouble get zeroValue => VectorDouble([]);
}

class VectorIntGene extends Gene<VectorInt> {
  VectorIntGene() : super(VectorIntFunctions().all);

  VectorIntGene.fromKarva(String karva)
      : super.fromKarva(karva, VectorIntFunctions().all);

  @override
  VectorInt get zeroValue => VectorInt([]);
}
