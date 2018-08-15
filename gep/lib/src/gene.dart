// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'dart:mirrors';

import 'package:meta/meta.dart';

import 'functions.dart';

/// Gene represents a single GEP gene.
/// It contains the symbols useds in the gene's expression.
class Gene<T> {
  Gene() {}

  /// Creates a new gene based on the Karva string representation.
  Gene.fromKarva(String karva)
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
  }

  List<Symbol> symbols;
  List<T> constants;
  Map<Symbol, Func> allFuncs;

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
}

class DoubleGene extends Gene<double> {
  DoubleGene() {
    allFuncs = DoubleFunctions().all;
  }

  DoubleGene.fromKarva(String karva) : super.fromKarva(karva) {
    allFuncs = DoubleFunctions().all;
  }

  @override
  double get zeroValue => 0.0;
}

class IntGene extends Gene<int> {
  IntGene() {
    allFuncs = IntFunctions().all;
  }

  IntGene.fromKarva(String karva) : super.fromKarva(karva) {
    allFuncs = IntFunctions().all;
  }

  @override
  int get zeroValue => 0;
}
