// -*- compile-command: "cd ../../.. && ./df.sh"; -*-

import '../functions.dart';
import '../vector.dart';

// allVectorIntNodes defines the vector of integer functions available for
// class [VectorIntGene].
final Map<Symbol, Func<VectorInt>> allVectorIntNodes = {
  Symbol('+'): Func<VectorInt>('+', 2, (List<VectorInt> x) => x[0] + x[1]),
  Symbol('-'): Func<VectorInt>('-', 2, (List<VectorInt> x) => x[0] - x[1]),
  Symbol('*'): Func<VectorInt>('*', 2, (List<VectorInt> x) => x[0] * x[1]),
};
