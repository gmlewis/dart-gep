// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'vector.dart';

typedef T FuncImpl<T>(List<T> input);

/// Func represents a single function represented by
/// a [Symbol] in Karva.
class Func<T> {
  Func(String name, this.terminals, this.func) : symbol = Symbol(name) {}

  final Symbol symbol;
  final int terminals;
  final FuncImpl<T> func;
}

/// Functions represents all functions that can be used in Karva expressions.
abstract class Functions<T> {
  Functions(this.all);

  Map<Symbol, Func<T>> all;
}

class BoolFunctions extends Functions<bool> {
  BoolFunctions(Map<Symbol, Func<bool>> all) : super(all);
}

class DoubleFunctions extends Functions<double> {
  DoubleFunctions(Map<Symbol, Func<double>> all) : super(all);
}

class IntFunctions extends Functions<int> {
  IntFunctions(Map<Symbol, Func<int>> all) : super(all);
}

class VectorBoolFunctions extends Functions<VectorBool> {
  VectorBoolFunctions(Map<Symbol, Func<VectorBool>> all) : super(all);
}

class VectorDoubleFunctions extends Functions<VectorDouble> {
  VectorDoubleFunctions(Map<Symbol, Func<VectorDouble>> all) : super(all);
}

class VectorIntFunctions extends Functions<VectorInt> {
  VectorIntFunctions(Map<Symbol, Func<VectorInt>> all) : super(all);
}
