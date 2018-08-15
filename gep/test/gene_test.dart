// -*- compile-command: "cd .. && ./df.sh"; -*-

import 'package:gep/gep.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests for Genes', () {
    test('Gene builds from "+" Karva expression', () {
      var karva = '+';
      var gene = IntGene.fromKarva(karva);
      expect(gene.symbols, [Symbol('+')]);
      expect(gene.constants, []);
      expect(gene.headSize, 0);
      expect(gene.numTerminals, 0);
      expect(gene.numConstants, 0);
      expect(gene.zeroValue, 0);
      expect(gene.toString(), karva);
      expect(gene.argOrder(), [
        [1, 2]
      ]);
      // expect(gene.symbolMap, {
      //   Symbol('+'): 1,
      // });
    });

    test('Gene builds from Karva expression with two inputs', () {
      var karva = '+.d0.d1.+.+.+.+.d0.d1.d1.d1.d0.d1.d1.d0';
      var gene = DoubleGene.fromKarva(karva);
      expect(gene.symbols, [
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
      expect(gene.constants, []);
      expect(gene.headSize, 0);
      expect(gene.numTerminals, 2);
      expect(gene.numConstants, 0);
      expect(gene.zeroValue, 0.0);
      expect(gene.toString(), karva);
      expect(gene.argOrder(), [
        [1, 2],
        null,
        null,
        [3, 4],
        [5, 6],
        [7, 8],
        [9, 10],
        null,
        null,
        null,
        null,
        null,
        null,
        null,
        null
      ]);
      // expect(gene.symbolMap, {
      //   Symbol('+'): 1,
      //   Symbol('d0'): 1,
      //   Symbol('d1'): 1,
      // });
    });
  });
}
