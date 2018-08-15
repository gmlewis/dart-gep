// -*- compile-command: "cd .. && ./df.sh"; -*-

import 'package:gep/gep.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests for Genes', () {
    test('Gene builds from "+" Karva expression', () {
      var karva = '+';
      var ds = Gene.fromKarva(karva);
      expect(ds.symbols, [Symbol('+')]);
      expect(ds.constants, []);
      expect(ds.headSize, 0);
      expect(ds.numTerminals, 0);
      expect(ds.numConstants, 0);
      expect(ds.zeroValue, isNull);
      expect(ds.toString(), karva);
      // expect(ds.symbolMap, {
      //   Symbol('+'): 1,
      // });
    });

    test('Gene builds from Karva expression with two inputs', () {
      var karva = '+.d0.d1.+.+.+.+.d0.d1.d1.d1.d0.d1.d1.d0';
      var ds = Gene.fromKarva(karva);
      expect(ds.symbols, [
        Symbol('+'),
        Symbol('d0'),
        Symbol('d1'),
        Symbol('+'),
        Symbol('+'),
        Symbol('+'),
        Symbol('+'),
        Symbol('d0'),
        Symbol('d1'),
        Symbol('d1'),
        Symbol('d1'),
        Symbol('d0'),
        Symbol('d1'),
        Symbol('d1'),
        Symbol('d0')
      ]);
      expect(ds.constants, []);
      expect(ds.headSize, 0);
      expect(ds.numTerminals, 2);
      expect(ds.numConstants, 0);
      expect(ds.zeroValue, isNull);
      expect(ds.toString(), karva);
      // expect(ds.symbolMap, {
      //   Symbol('+'): 1,
      //   Symbol('d0'): 1,
      //   Symbol('d1'): 1,
      // });
    });
  });
}
