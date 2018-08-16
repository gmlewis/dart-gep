// -*- compile-command: "cd ../.. && ./df.sh"; -*-

typedef T FuncImpl<T>(List<T> input);

/// Func represents a single function represented by
/// a [Symbol] in Karva.
class Func<T> {
  Func(String name, this.terminals, this.func) : symbol = Symbol(name) {}

  final Symbol symbol;
  final int terminals;
  final FuncImpl<T> func;
}

/// Functions represents all functions that can be used
/// in Karva expressions.
abstract class Functions<T> {
  Functions() {}

  Map<Symbol, Func<T>> all;
}

class DoubleFunctions extends Functions<double> {
  DoubleFunctions() {}

  @override
  Map<Symbol, Func<double>> all = {
    Symbol('+'):
        Func<double>('+', 2, (List<double> input) => input[0] + input[1]),
    Symbol('-'):
        Func<double>('-', 2, (List<double> input) => input[0] - input[1]),
    Symbol('*'):
        Func<double>('*', 2, (List<double> input) => input[0] * input[1]),
  };
}

class IntFunctions extends Functions<int> {
  IntFunctions() {}

  @override
  Map<Symbol, Func<int>> all = {
    Symbol('+'): Func<int>('+', 2, (List<int> input) => input[0] + input[1]),
    Symbol('-'): Func<int>('-', 2, (List<int> input) => input[0] - input[1]),
    Symbol('*'): Func<int>('*', 2, (List<int> input) => input[0] * input[1]),
  };
}
