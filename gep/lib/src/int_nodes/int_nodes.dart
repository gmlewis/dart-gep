// -*- compile-command: "cd ../../.. && ./df.sh"; -*-

import '../functions.dart';

// allIntNodes defines the integer functions available for class [IntGene].
final Map<Symbol, Func<int>> allIntNodes = {
  Symbol('+'): Func<int>('+', 2, (List<int> x) => x[0] + x[1]),
  Symbol('-'): Func<int>('-', 2, (List<int> x) => x[0] - x[1]),
  Symbol('*'): Func<int>('*', 2, (List<int> x) => x[0] * x[1]),
};
