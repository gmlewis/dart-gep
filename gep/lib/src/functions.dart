// -*- compile-command: "cd ../.. && ./df.sh"; -*-

/// Func represents a single function represented by
/// a [Symbol] in Karva.
class Func<T> {
  Func(String name, this.terminals, this.func) : symbol = Symbol(name) {}

  final Symbol symbol;
  final int terminals;
  final dynamic func;
}

/// Functions represents all functions that can be used
/// in Karva expressions.
abstract class Functions<T> {
  Functions() {}

  Map<Symbol, Func> all;
}

class DoubleFunctions extends Functions<double> {
  DoubleFunctions() {}

  @override
  Map<Symbol, Func> all = {
    Symbol('+'): Func<double>('+', 2, (double a, double b) => a + b),
  };
}

class IntFunctions extends Functions<int> {
  IntFunctions() {}

  @override
  Map<Symbol, Func> all = {
    Symbol('+'): Func<int>('+', 2, (int a, int b) => a + b),
  };
}
