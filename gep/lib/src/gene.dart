// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'dart:mirrors';

import 'package:meta/meta.dart';

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
}

class DoubleGene extends Gene<double> {
  DoubleGene();

  @override
  double get zeroValue => 0.0;
}
