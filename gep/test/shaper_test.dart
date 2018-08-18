// -*- compile-command: "cd .. && ./df.sh"; -*-

import 'package:gep/gep.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests for Shapers', () {
    test('DiscreteShaper clamps values', () {
      var ds = DiscreteShaper(5);
      expect(ds.shape(5), 4);
      expect(ds.shape(4), 4);
      expect(ds.shape(0), 0);
      expect(ds.shape(-1), 0);
    });
  });
}
