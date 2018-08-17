// -*- compile-command: "cd .. && ./df.sh"; -*-

import 'package:gep/gep.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests for Genes', () {
    test('BoolGene builds from simple Karva expression', () {
      var karva = 'And.d0.d1';
      var gene = BoolGene.fromKarva(karva, boolNandNodes);
      expect(gene.symbols, [
        Symbol('And'),
        Symbol('d0'),
        Symbol('d1'),
      ]);
      expect(gene.constants, []);
      expect(gene.headSize, 0);
      expect(gene.numTerminals, 2);
      expect(gene.numConstants, 0);
      expect(gene.zeroValue, false);
      expect(gene.toString(), karva);
      expect(gene.argOrder(), [
        [1, 2],
        null,
        null
      ]);
      expect(gene.model([false, false]), false);
      expect(gene.model([false, true]), false);
      expect(gene.model([true, false]), false);
      expect(gene.model([true, true]), true);
      expect(gene.symbolMap, {
        Symbol('And'): 1,
        Symbol('d0'): 1,
        Symbol('d1'): 1,
      });
    });

    test('IntGene builds from simple Karva expression', () {
      var karva = '+.d0.d1';
      var gene = IntGene.fromKarva(karva, allIntNodes);
      expect(gene.symbols, [
        Symbol('+'),
        Symbol('d0'),
        Symbol('d1'),
      ]);
      expect(gene.constants, []);
      expect(gene.headSize, 0);
      expect(gene.numTerminals, 2);
      expect(gene.numConstants, 0);
      expect(gene.zeroValue, 0);
      expect(gene.toString(), karva);
      expect(gene.argOrder(), [
        [1, 2],
        null,
        null
      ]);
      expect(gene.model([1, 2]), 3);
      expect(gene.symbolMap, {
        Symbol('+'): 1,
        Symbol('d0'): 1,
        Symbol('d1'): 1,
      });
    });

    test('DoubleGene builds from simple Karva expression', () {
      var karva = '+.d0.d1';
      var gene = DoubleGene.fromKarva(karva, allDoubleNodes);
      expect(gene.symbols, [
        Symbol('+'),
        Symbol('d0'),
        Symbol('d1'),
      ]);
      expect(gene.constants, []);
      expect(gene.headSize, 0);
      expect(gene.numTerminals, 2);
      expect(gene.numConstants, 0);
      expect(gene.zeroValue, 0);
      expect(gene.toString(), karva);
      expect(gene.argOrder(), [
        [1, 2],
        null,
        null
      ]);
      expect(gene.model([1.0, 2.0]), 3.0);
      expect(gene.symbolMap, {
        Symbol('+'): 1,
        Symbol('d0'): 1,
        Symbol('d1'): 1,
      });
    });

    test('VectorIntGene builds from simple Karva expression', () {
      var karva = '+.d0.d1';
      var gene = VectorIntGene.fromKarva(karva, allVectorIntNodes);
      expect(gene.symbols, [
        Symbol('+'),
        Symbol('d0'),
        Symbol('d1'),
      ]);
      expect(gene.constants, []);
      expect(gene.headSize, 0);
      expect(gene.numTerminals, 2);
      expect(gene.numConstants, 0);
      expect(gene.zeroValue, VectorInt([]));
      expect(gene.toString(), karva);
      expect(gene.argOrder(), [
        [1, 2],
        null,
        null
      ]);
      expect(
          gene.model([
            VectorInt([1, 2, 3, 4, 5, 6, 7, 8, 9]),
            VectorInt([10, 20, 30, 40, 50, 60, 70, 80, 90]),
          ]),
          VectorInt([11, 22, 33, 44, 55, 66, 77, 88, 99]));
      expect(gene.symbolMap, {
        Symbol('+'): 1,
        Symbol('d0'): 1,
        Symbol('d1'): 1,
      });
    });

    test('VectorDoubleGene builds from simple Karva expression', () {
      var karva = '+.d0.d1';
      var gene = VectorDoubleGene.fromKarva(karva, allVectorDoubleNodes);
      expect(gene.symbols, [
        Symbol('+'),
        Symbol('d0'),
        Symbol('d1'),
      ]);
      expect(gene.constants, []);
      expect(gene.headSize, 0);
      expect(gene.numTerminals, 2);
      expect(gene.numConstants, 0);
      expect(gene.zeroValue, VectorDouble([]));
      expect(gene.toString(), karva);
      expect(gene.argOrder(), [
        [1, 2],
        null,
        null
      ]);
      expect(
          gene.model([
            VectorDouble([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0]),
            VectorDouble(
                [10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0, 90.0]),
          ]),
          VectorDouble([11.0, 22.0, 33.0, 44.0, 55.0, 66.0, 77.0, 88.0, 99.0]));
      expect(gene.symbolMap, {
        Symbol('+'): 1,
        Symbol('d0'): 1,
        Symbol('d1'): 1,
      });
    });

    test('Gene builds from Karva expression with two inputs', () {
      var karva = '+.d0.d1.+.+.+.+.d0.d1.d1.d1.d0.d1.d1.d0';
      var gene = DoubleGene.fromKarva(karva, allDoubleNodes);
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
      expect(gene.model([1.0, 2.0]), 3.0);
      expect(gene.symbolMap, {
        Symbol('+'): 1,
        Symbol('d0'): 1,
        Symbol('d1'): 1,
      });
    });

    test('IntGene.random does something reasonable', () {
      List<WeightedSymbol> functions = [
        WeightedSymbol('+', 3),
        WeightedSymbol('-', 2),
        WeightedSymbol('*', 1),
      ];
      var gene = IntGene.random(
        headSize: 5,
        tailSize: 8,
        numTerminals: 4,
        numConstants: 7,
        functions: functions,
      );
      // TODO: No symbols show up, only terminals and constants.
      expect(gene.symbols.length, 13);
      expect(gene.constants.length, 7);
      expect(gene.headSize, 5);
      expect(gene.numTerminals, 4);
      expect(gene.numConstants, 7);
      expect(gene.zeroValue, 0);
      expect(gene.toString(), isNot(''));
      expect(gene.symbolMap, isNotNull);
      // expect(gene.symbolMap.length, isNot(0));
    });
  });
}
