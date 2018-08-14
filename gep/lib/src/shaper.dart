// -*- compile-command: "cd ../.. && ./df.sh"; -*-

/// [Shaper] represents a function that shapes the output of the evaluation.
abstract class Shaper {
  Shaper();

  dynamic shape(double val);
}

/// [DiscreteShaper] shapes the output as an integer between
/// 0 (inclusive) and n (exclusive).
class DiscreteShaper extends Shaper {
  DiscreteShaper(this.n) : super();

  final int n;

  @override
  dynamic shape(double val) {
    if (val.isNaN) return 0;
    if (val.isInfinite) {
      if (val.isNegative) return 0;
      return n - 1;
    }
    return val.clamp(0, n - 1).round();
  }
}
