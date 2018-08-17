// -*- compile-command: "cd ../../.. && ./df.sh"; -*-

import '../functions.dart';
import '../vector.dart';

// allVectorDoubleNodes defines the vector of double functions available for
// class [VectorDoubleGene].
Map<Symbol, Func<VectorDouble>> allVectorDoubleNodes = {
  Symbol('+'):
      Func<VectorDouble>('+', 2, (List<VectorDouble> x) => x[0] + x[1]),
  Symbol('-'):
      Func<VectorDouble>('-', 2, (List<VectorDouble> x) => x[0] - x[1]),
  Symbol('*'):
      Func<VectorDouble>('*', 2, (List<VectorDouble> x) => x[0] * x[1]),
};
