// -*- compile-command: "cd ../../.. && ./df.sh"; -*-

import '../functions.dart';

// allDoubleNodes defines the double functions available for class [DoubleGene].
final Map<Symbol, Func<double>> allDoubleNodes = {
  Symbol('+'): Func<double>('+', 2, (List<double> x) => x[0] + x[1]),
  Symbol('-'): Func<double>('-', 2, (List<double> x) => x[0] - x[1]),
  Symbol('*'): Func<double>('*', 2, (List<double> x) => x[0] * x[1]),
};
