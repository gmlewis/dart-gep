// -*- compile-command: "cd .. && ./df.sh"; -*-

import 'package:gep/gep.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests for Shapers', () {
    test('DiscreteShaper clamps values', () {
      var ds = DiscreteShaper(5);
      expect(ds.shape(5.0), 4);
      expect(ds.shape(4.0), 4);
      expect(ds.shape(3.5), 4);
      expect(ds.shape(0.0), 0);
      expect(ds.shape(-1.0), 0);
      expect(ds.shape(double.nan), 0);
      expect(ds.shape(double.infinity), 4);
      expect(ds.shape(double.negativeInfinity), 0);
      expect(ds.shape(double.maxFinite), 4);
      expect(ds.shape(double.minPositive), 0);
    });
  });
}
