// -*- compile-command: "cd ../.. && ./df.sh"; -*-

/// [Shaper] represents a function that shapes the output of the evaluation.
abstract class Shaper<T> {
  Shaper();

  dynamic shape(T val);
}

/// [DiscreteShaper] shapes the output as an integer between
/// 0 (inclusive) and n (exclusive).
class DiscreteShaper extends Shaper<int> {
  DiscreteShaper(this.n) : super();

  final int n;

  @override
  int shape(int val) {
    return val.clamp(0, n - 1);
  }
}
