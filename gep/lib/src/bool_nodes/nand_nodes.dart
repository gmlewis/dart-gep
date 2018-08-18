// -*- compile-command: "cd ../../.. && ./df.sh"; -*-

import '../functions.dart';
import 'primitives.dart';

// boolNandNodes defines the boolean functions based on nand
// available for class [BoolGene].
final Map<Symbol, Func<bool>> boolNandNodes = {
  Symbol('Not'): Func<bool>('Not', 1, (List<bool> x) => gepNand(x[0], x[0])),
  Symbol('And'): Func<bool>('And', 2,
      (List<bool> x) => gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[1]))),
  Symbol('Or'): Func<bool>('Or', 2,
      (List<bool> x) => gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1]))),
  Symbol('Nand'): Func<bool>('Nand', 2, (List<bool> x) => gepNand(x[0], x[1])),
  Symbol('Nor'): Func<bool>(
      'Nor',
      2,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])), (true))),
  Symbol('Xor'): Func<bool>(
      'Xor',
      2,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[1])),
          gepNand(gepNand(x[0], x[1]), x[1]))),
  Symbol('Nxor'): Func<bool>(
      'Nxor',
      2,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
          gepNand(x[0], x[1]))),
  Symbol('And3'): Func<bool>(
      'And3',
      3,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(gepNand(x[0], x[2]), x[1]), x[1]), (true))),
  Symbol('Or3'): Func<bool>(
      'Or3',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
              gepNand(x[1], x[1])),
          gepNand(x[1], x[1]))),
  Symbol('Nand3'): Func<bool>('Nand3', 3,
      (List<bool> x) => gepNand(x[0], gepNand(x[0], gepNand(x[1], x[2])))),
  Symbol('Nor3'): Func<bool>(
      'Nor3',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(x[0], x[0]),
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])))),
          (true))),
  Symbol('Odd3'): Func<bool>(
      'Odd3',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], gepNand(x[0], x[2])),
                  gepNand(x[1], gepNand(x[1], x[2])))),
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1]))),
              x[2]))),
  Symbol('Even3'): Func<bool>(
      'Even3',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])),
              gepNand(x[0], x[2])),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
                  gepNand(x[0], x[2])),
              gepNand(x[1], x[1])))),
  Symbol('And4'): Func<bool>(
      'And4',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), x[3]),
              gepNand(gepNand(x[2], x[3]), gepNand(x[2], x[3]))),
          (true))),
  Symbol('Or4'): Func<bool>(
      'Or4',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(
                  gepNand(gepNand(x[0], x[2]), x[3]),
                  gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
                      gepNand(gepNand(x[1], x[2]), x[3]))),
              (true)),
          gepNand(x[2], x[2]))),
  Symbol('Nand4'): Func<bool>(
      'Nand4',
      4,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[2]), x[1]),
          gepNand(gepNand(x[1], x[3]), gepNand(x[1], x[3])))),
  Symbol('Nor4'): Func<bool>(
      'Nor4',
      4,
      (List<bool> x) => gepNand(
          (true),
          gepNand(
              gepNand(
                  gepNand(gepNand(x[0], x[0]), gepNand(x[3], x[3])), (true)),
              gepNand(
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])), (true))))),
  Symbol('Odd4'): Func<bool>(
      'Odd4',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(
                  gepNand(gepNand(gepNand(x[2], x[3]), x[2]), x[2]),
                  gepNand(
                      gepNand(gepNand(x[0], x[1]), x[1]),
                      gepNand(
                          gepNand(
                              gepNand(x[0], gepNand(x[1], x[1])),
                              gepNand(
                                  gepNand(x[2], x[2]), gepNand(x[3], x[1]))),
                          gepNand(gepNand(x[0], x[3]), x[3])))),
              gepNand(x[2], x[3])),
          gepNand(
              gepNand(x[0], x[1]),
              gepNand(
                  gepNand(
                      gepNand(gepNand(gepNand(gepNand(x[1], x[2]), x[1]), x[3]),
                          gepNand(gepNand(x[1], x[3]), gepNand(x[2], x[2]))),
                      x[1]),
                  gepNand(
                      x[0],
                      gepNand(
                          gepNand(gepNand(x[3], x[3]), gepNand(x[0], x[2])),
                          gepNand(
                              gepNand(gepNand(x[3], x[3]), x[2]), x[2]))))))),
  Symbol('Even4'): Func<bool>(
      'Even4',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(
                  gepNand(
                      gepNand(
                          gepNand(
                              gepNand(x[0], x[1]),
                              gepNand(
                                  gepNand(x[0], x[0]), gepNand(x[2], x[1]))),
                          x[2]),
                      gepNand(x[3], x[3])),
                  gepNand(x[3], x[2])),
              gepNand(
                  gepNand(x[2], gepNand(x[3], gepNand(x[0], x[1]))),
                  gepNand(gepNand(gepNand(x[1], gepNand(x[2], x[2])), x[0]),
                      gepNand(gepNand(x[1], x[0]), x[1])))),
          gepNand(
              gepNand(
                  gepNand(
                      gepNand(gepNand(gepNand(x[1], x[3]), x[0]),
                          gepNand(x[1], gepNand(x[1], x[0]))),
                      gepNand(x[3], x[2])),
                  x[3]),
              x[3]))),
  Symbol('Id'): Func<bool>('Id', 1, (List<bool> x) => (x[0])),
  Symbol('Zero'): Func<bool>('Zero', 1, (List<bool> x) => (false)),
  Symbol('One'): Func<bool>('One', 1, (List<bool> x) => (true)),
  Symbol('LT'): Func<bool>('LT', 2,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[1]), x[1]), (true))),
  Symbol('GT'): Func<bool>(
      'GT',
      2,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[1])),
          gepNand(x[0], gepNand(x[0], x[1])))),
  Symbol('LOE'): Func<bool>(
      'LOE', 2, (List<bool> x) => gepNand(x[0], gepNand(x[0], x[1]))),
  Symbol('GOE'): Func<bool>(
      'GOE', 2, (List<bool> x) => gepNand(gepNand(x[0], x[0]), x[1])),
  Symbol('NotA'): Func<bool>('NotA', 2, (List<bool> x) => gepNand(x[0], x[0])),
  Symbol('NotB'): Func<bool>('NotB', 2, (List<bool> x) => gepNand(x[1], x[1])),
  Symbol('IdA'): Func<bool>('IdA', 2, (List<bool> x) => (x[0])),
  Symbol('IdB'): Func<bool>('IdB', 2, (List<bool> x) => (x[1])),
  Symbol('Zero2'): Func<bool>('Zero2', 2, (List<bool> x) => (false)),
  Symbol('One2'): Func<bool>('One2', 2, (List<bool> x) => (true)),
  Symbol('LT3'): Func<bool>(
      'LT3',
      3,
      (List<bool> x) =>
          gepNand(gepNand(x[0], x[2]), gepNand(gepNand(x[1], x[1]), x[2]))),
  Symbol('GT3'): Func<bool>(
      'GT3',
      3,
      (List<bool> x) => gepNand(
          gepNand(x[0],
              gepNand(x[0], gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])))),
          (true))),
  Symbol('LOE3'): Func<bool>(
      'LOE3',
      3,
      (List<bool> x) =>
          gepNand(gepNand(x[0], gepNand(x[1], x[1])), gepNand(x[2], x[2]))),
  Symbol('GOE3'): Func<bool>(
      'GOE3',
      3,
      (List<bool> x) => gepNand(gepNand(x[0], x[2]),
          gepNand(gepNand(x[1], x[2]), gepNand(x[1], x[2])))),
  Symbol('Mux'): Func<bool>(
      'Mux',
      3,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(x[0], x[1]), x[1]), gepNand(x[0], x[2]))),
  Symbol('If'): Func<bool>(
      'If',
      3,
      (List<bool> x) =>
          gepNand(gepNand(x[0], x[1]), gepNand(gepNand(x[0], x[2]), x[2]))),
  Symbol('Maj'): Func<bool>(
      'Maj',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])), x[1]),
          gepNand(x[0], x[2]))),
  Symbol('Min'): Func<bool>(
      'Min',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
          gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1])))),
  Symbol('2Off'): Func<bool>(
      '2Off',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])), x[1]),
              x[1]),
          gepNand(
              gepNand(gepNand(x[0], gepNand(x[1], x[1])),
                  gepNand(gepNand(x[1], x[2]), x[2])),
              gepNand(x[0], x[2])))),
  Symbol('2On'): Func<bool>(
      '2On',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])),
              gepNand(x[1], x[2])),
          gepNand(gepNand(x[0], x[0]),
              gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2]))))),
  Symbol('LM3A1'): Func<bool>(
      'LM3A1',
      3,
      (List<bool> x) =>
          gepNand(gepNand(x[0], gepNand(x[0], x[2])), gepNand(x[1], x[2]))),
  Symbol('LM3A2'): Func<bool>(
      'LM3A2',
      3,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[2], x[2])),
          gepNand(gepNand(x[1], x[2]), x[2]))),
  Symbol('LM3A3'): Func<bool>(
      'LM3A3',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
          gepNand(x[1], x[2]))),
  Symbol('LM3A4'): Func<bool>(
      'LM3A4',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])),
          gepNand(gepNand(x[1], x[1]), x[2]))),
  Symbol('LM3B1'): Func<bool>(
      'LM3B1',
      3,
      (List<bool> x) =>
          gepNand(gepNand(x[0], x[2]), gepNand(x[1], gepNand(x[2], x[2])))),
  Symbol('LM3B2'): Func<bool>(
      'LM3B2',
      3,
      (List<bool> x) => gepNand(gepNand(x[0], x[2]),
          gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])))),
  Symbol('LM3B3'): Func<bool>(
      'LM3B3',
      3,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[2]), x[2]),
          gepNand(gepNand(x[0], x[2]), x[1]))),
  Symbol('LM3B4'): Func<bool>(
      'LM3B4',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1])),
          gepNand(gepNand(x[0], x[2]), x[2]))),
  Symbol('LM3C1'): Func<bool>(
      'LM3C1',
      3,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(x[0], x[1]), x[0]), gepNand(x[1], x[2]))),
  Symbol('LM3C2'): Func<bool>(
      'LM3C2',
      3,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[1], x[1])),
          gepNand(gepNand(x[1], x[2]), x[1]))),
  Symbol('LM3C3'): Func<bool>(
      'LM3C3',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
          gepNand(x[1], x[2]))),
  Symbol('LM3C4'): Func<bool>(
      'LM3C4',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
          gepNand(x[1], gepNand(x[2], x[2])))),
  Symbol('LM3D1'): Func<bool>(
      'LM3D1',
      3,
      (List<bool> x) =>
          gepNand(gepNand(x[0], x[1]), gepNand(gepNand(x[1], x[2]), x[2]))),
  Symbol('LM3D2'): Func<bool>(
      'LM3D2',
      3,
      (List<bool> x) => gepNand(gepNand(x[0], x[1]),
          gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])))),
  Symbol('LM3D3'): Func<bool>(
      'LM3D3',
      3,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(gepNand(x[1], x[1]), x[2]))),
  Symbol('LM3D4'): Func<bool>(
      'LM3D4',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])),
          gepNand(gepNand(x[0], x[1]), x[1]))),
  Symbol('LM3E1'): Func<bool>(
      'LM3E1',
      3,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[1]), x[0]),
          gepNand(gepNand(x[0], x[1]), x[2]))),
  Symbol('LM3E2'): Func<bool>(
      'LM3E2',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
          gepNand(x[0], x[1]))),
  Symbol('LM3E3'): Func<bool>(
      'LM3E3',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])),
          gepNand(gepNand(x[0], x[1]), x[0]))),
  Symbol('LM3F1'): Func<bool>(
      'LM3F1',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
          gepNand(x[0], x[2]))),
  Symbol('LM3F2'): Func<bool>(
      'LM3F2',
      3,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[2]), x[1]),
          gepNand(x[0], gepNand(x[2], x[2])))),
  Symbol('LM3F3'): Func<bool>(
      'LM3F3',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1])),
          gepNand(gepNand(x[0], x[2]), x[0]))),
  Symbol('LM3G1'): Func<bool>(
      'LM3G1',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])), x[1]),
              x[1]),
          gepNand(x[0], gepNand(x[0], gepNand(gepNand(x[1], x[2]), x[2]))))),
  Symbol('LM3G2'): Func<bool>(
      'LM3G2',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(x[0], gepNand(x[1], x[2])),
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])))),
          gepNand(gepNand(gepNand(x[0], x[1]), x[2]), x[2]))),
  Symbol('LM3G3'): Func<bool>(
      'LM3G3',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])), x[2]),
              x[2]),
          gepNand(gepNand(gepNand(x[0], gepNand(x[1], x[2])), x[1]), x[1]))),
  Symbol('LM3G4'): Func<bool>(
      'LM3G4',
      3,
      (List<bool> x) => gepNand(
          gepNand(x[0],
              gepNand(x[0], gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])))),
          gepNand(gepNand(gepNand(gepNand(x[0], x[0]), x[2]), x[1]), x[1]))),
  Symbol('LM3H1'): Func<bool>(
      'LM3H1', 3, (List<bool> x) => gepNand(gepNand(x[0], x[1]), x[2])),
  Symbol('LM3H2'): Func<bool>(
      'LM3H2', 3, (List<bool> x) => gepNand(x[0], gepNand(x[1], x[2]))),
  Symbol('LM3H3'): Func<bool>(
      'LM3H3',
      3,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[2])),
          gepNand(x[1], gepNand(x[1], x[2])))),
  Symbol('LM3H4'): Func<bool>(
      'LM3H4',
      3,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(gepNand(x[0], x[2]), x[2]))),
  Symbol('LT3A'): Func<bool>('LT3A', 3,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[2], x[2])), x[1])),
  Symbol('GT3A'): Func<bool>(
      'GT3A',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[1])), gepNand(x[2], x[2])),
          gepNand(gepNand(x[1], x[1]), x[2]))),
  Symbol('LOE3A'): Func<bool>(
      'LOE3A',
      3,
      (List<bool> x) =>
          gepNand(gepNand(x[0], gepNand(x[0], x[1])), gepNand(x[0], x[2]))),
  Symbol('GOE3A'): Func<bool>(
      'GOE3A',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])), x[1]),
              x[1]),
          gepNand(x[0], x[2]))),
  Symbol('ET3A'): Func<bool>(
      'ET3A',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[0]), gepNand(x[1], gepNand(x[2], x[2])))),
          gepNand(x[0], x[2]))),
  Symbol('NET3A'): Func<bool>(
      'NET3A',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[2])), gepNand(x[1], x[1])),
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])),
              gepNand(x[2], x[2])))),
  Symbol('LT3B'): Func<bool>(
      'LT3B',
      3,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(x[0], x[1]), x[1]), gepNand(x[1], x[2]))),
  Symbol('GT3B'): Func<bool>(
      'GT3B',
      3,
      (List<bool> x) => gepNand(
          gepNand(x[0],
              gepNand(x[0], gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])))),
          gepNand(x[1], x[2]))),
  Symbol('LOE3B'): Func<bool>('LOE3B', 3,
      (List<bool> x) => gepNand(x[0], gepNand(x[1], gepNand(x[2], x[2])))),
  Symbol('GOE3B'): Func<bool>(
      'GOE3B',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), x[1]), gepNand(x[0], x[2])),
          gepNand(x[2], gepNand(x[0], x[2])))),
  Symbol('ET3B'): Func<bool>(
      'ET3B',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])),
              gepNand(x[0], x[2])),
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], gepNand(x[2], x[2]))))),
  Symbol('NET3B'): Func<bool>(
      'NET3B',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], gepNand(x[2], x[2])), gepNand(x[1], x[1]))),
          gepNand(x[1], x[2]))),
  Symbol('LT3C'): Func<bool>(
      'LT3C',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[2]), x[1]), x[2]),
          gepNand(x[1], gepNand(x[1], x[2])))),
  Symbol('GT3C'): Func<bool>(
      'GT3C',
      3,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(x[0], x[0]), x[2]), gepNand(x[1], x[1]))),
  Symbol('LOE3C'): Func<bool>(
      'LOE3C',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[2]), gepNand(x[0], x[1]))),
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])))),
  Symbol('GOE3C'): Func<bool>(
      'GOE3C',
      3,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])))),
  Symbol('ET3C'): Func<bool>(
      'ET3C',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[1], x[2])), gepNand(x[2], x[2])),
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[2]))))),
  Symbol('NET3C'): Func<bool>(
      'NET3C',
      3,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[1]),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), x[2]), gepNand(x[1], x[1])),
              gepNand(x[1], x[2])))),
  Symbol('T004'): Func<bool>(
      'T004',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])), x[1]),
              x[1]),
          (true))),
  Symbol('T008'): Func<bool>(
      'T008',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])),
              gepNand(x[0], x[0])),
          (true))),
  Symbol('T009'): Func<bool>(
      'T009',
      3,
      (List<bool> x) => gepNand(
          (true),
          gepNand(
              gepNand(x[0], x[0]),
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])),
                  gepNand(x[1], x[2]))))),
  Symbol('T032'): Func<bool>(
      'T032',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(gepNand(x[1], x[2]), x[2])), x[0]),
          (true))),
  Symbol('T033'): Func<bool>(
      'T033',
      3,
      (List<bool> x) => gepNand(
          (true),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
                  gepNand(x[0], x[2])),
              gepNand(x[1], x[1])))),
  Symbol('T041'): Func<bool>(
      'T041',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(gepNand(x[1], x[1]), x[2])), x[0]),
          gepNand(
              gepNand(x[0], x[0]),
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])),
                  gepNand(x[1], x[2]))))),
  Symbol('T055'): Func<bool>(
      'T055',
      3,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])), x[1])),
  Symbol('T057'): Func<bool>(
      'T057',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[2])),
              gepNand(x[0], x[1])),
          gepNand(gepNand(x[2], x[2]), gepNand(x[1], x[1])))),
  Symbol('T064'): Func<bool>(
      'T064',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])),
              gepNand(x[1], x[2])),
          (true))),
  Symbol('T065'): Func<bool>(
      'T065',
      3,
      (List<bool> x) => gepNand(
          (true),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
                  gepNand(x[0], x[1])),
              gepNand(x[2], x[2])))),
  Symbol('T069'): Func<bool>(
      'T069',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
          gepNand(x[1], gepNand(x[1], x[2])))),
  Symbol('T073'): Func<bool>(
      'T073',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(x[0], x[0]),
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])))),
          gepNand(gepNand(x[0], x[2]),
              gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2]))))),
  Symbol('T081'): Func<bool>(
      'T081',
      3,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[2])),
          gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])))),
  Symbol('T089'): Func<bool>(
      'T089',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]),
              gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2]))),
          gepNand(gepNand(gepNand(x[0], x[2]), x[1]), gepNand(x[2], x[2])))),
  Symbol('T093'): Func<bool>('T093', 3,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[2]), x[1]), x[2])),
  Symbol('T096'): Func<bool>(
      'T096',
      3,
      (List<bool> x) => gepNand(
          gepNand(
              x[0],
              gepNand(gepNand(gepNand(x[1], x[1]), x[2]),
                  gepNand(gepNand(x[0], x[2]), x[1]))),
          (true))),
  Symbol('T101'): Func<bool>(
      'T101',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])),
              gepNand(x[1], x[2])),
          gepNand(gepNand(gepNand(x[0], x[1]), x[0]), gepNand(x[2], x[2])))),
  Symbol('T109'): Func<bool>(
      'T109',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[2]))),
          gepNand(gepNand(gepNand(x[0], x[1]), x[0]), gepNand(x[2], x[2])))),
  Symbol('T111'): Func<bool>(
      'T111',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1])),
              gepNand(x[1], x[2])),
          x[0])),
  Symbol('T121'): Func<bool>(
      'T121',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]),
              gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2]))),
          gepNand(gepNand(gepNand(x[0], x[0]), x[2]), gepNand(x[1], x[1])))),
  Symbol('T123'): Func<bool>(
      'T123',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])),
              gepNand(x[0], x[2])),
          x[1])),
  Symbol('T125'): Func<bool>(
      'T125',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])),
              gepNand(x[0], x[1])),
          x[2])),
  Symbol('T154'): Func<bool>(
      'T154',
      3,
      (List<bool> x) => gepNand(
          gepNand(x[0],
              gepNand(x[0], gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])))),
          gepNand(gepNand(x[0], gepNand(x[0], x[1])), x[2]))),
  Symbol('T223'): Func<bool>(
      'T223',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]), gepNand(x[0], x[2])),
          gepNand(x[1], x[2]))),
  Symbol('T239'): Func<bool>(
      'T239',
      3,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2]))),
          x[0])),
  Symbol('T249'): Func<bool>(
      'T249',
      3,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[0]),
          gepNand(gepNand(x[1], gepNand(x[1], x[2])),
              gepNand(gepNand(x[1], x[1]), x[2])))),
  Symbol('T251'): Func<bool>(
      'T251',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])), x[1]),
          x[1])),
  Symbol('T253'): Func<bool>(
      'T253',
      3,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[2])), x[2]),
          x[2])),
  Symbol('LT4'): Func<bool>(
      'LT4',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[3]))),
          gepNand(gepNand(x[2], x[2]), x[3]))),
  Symbol('GT4'): Func<bool>(
      'GT4',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              x[0],
              gepNand(
                  x[0],
                  gepNand(
                      gepNand(x[0], x[1]),
                      gepNand(
                          x[0],
                          gepNand(gepNand(gepNand(x[0], x[1]), x[2]),
                              gepNand(gepNand(x[1], x[1]), x[3])))))),
          (true))),
  Symbol('LOE4'): Func<bool>(
      'LOE4',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[1])), gepNand(x[2], x[2])),
          gepNand(x[3], x[3]))),
  Symbol('GOE4'): Func<bool>(
      'GOE4',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[2])),
          gepNand(gepNand(gepNand(x[0], x[3]), x[3]), x[2]))),
  Symbol('Tie'): Func<bool>(
      'Tie',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), x[1]),
                  gepNand(x[0], gepNand(x[1], x[1]))),
              gepNand(gepNand(gepNand(x[2], x[2]), x[3]),
                  gepNand(x[2], gepNand(x[2], x[3])))),
          gepNand(
              gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[3])),
              gepNand(
                  gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2])), (true))))),
  Symbol('Ntie'): Func<bool>(
      'Ntie',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], gepNand(x[0], x[3])),
                  gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2]))),
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[3], x[3])),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])))),
          gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[3])),
              gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2]))))),
  Symbol('3Off'): Func<bool>(
      '3Off',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[3], x[3])), x[0]),
              gepNand(gepNand(gepNand(x[1], x[1]), x[0]), gepNand(x[0], x[2]))),
          gepNand(
              gepNand(gepNand(x[3], x[1]),
                  gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2]))),
              gepNand(gepNand(gepNand(x[1], x[3]), x[3]),
                  gepNand(x[1], gepNand(x[3], x[3])))))),
  Symbol('3On'): Func<bool>(
      '3On',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])),
              gepNand(gepNand(gepNand(x[0], x[2]), x[3]), x[1])),
          gepNand(gepNand(gepNand(x[0], gepNand(x[1], x[3])), x[2]),
              gepNand(gepNand(x[1], x[2]), gepNand(x[2], x[3]))))),
  Symbol('LM4A1'): Func<bool>(
      'LM4A1',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[3])),
          gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[3])), x[3]))),
  Symbol('LM4A2'): Func<bool>(
      'LM4A2',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[3])),
          gepNand(gepNand(x[1], gepNand(x[2], x[3])), x[3]))),
  Symbol('LM4A3'): Func<bool>(
      'LM4A3',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[3])),
          gepNand(gepNand(gepNand(x[1], x[1]), x[2]), x[3]))),
  Symbol('LM4A4'): Func<bool>(
      'LM4A4',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[2], x[3])),
          gepNand(gepNand(x[1], x[2]), x[3]))),
  Symbol('LM4A5'): Func<bool>(
      'LM4A5',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[3], x[3])),
          gepNand(gepNand(gepNand(x[1], x[3]), gepNand(x[2], x[2])), x[3]))),
  Symbol('LM4A6'): Func<bool>(
      'LM4A6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[3], x[3])),
          gepNand(gepNand(x[1], gepNand(x[2], x[2])), x[3]))),
  Symbol('LM4A7'): Func<bool>(
      'LM4A7',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[3], x[3])), gepNand(x[2], x[3])),
          gepNand(x[1], x[3]))),
  Symbol('LM4A8'): Func<bool>(
      'LM4A8',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[3])),
          gepNand(gepNand(x[1], x[2]), x[3]))),
  Symbol('LM4B1'): Func<bool>(
      'LM4B1',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[3]),
          gepNand(gepNand(gepNand(x[1], x[2]), gepNand(x[2], x[3])),
              gepNand(x[2], x[3])))),
  Symbol('LM4B2'): Func<bool>(
      'LM4B2',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[3]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[2]), gepNand(x[3], x[3])), x[2]),
              x[2]))),
  Symbol('LM4B3'): Func<bool>(
      'LM4B3',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[3]),
          gepNand(
              x[1],
              gepNand(
                  x[1], gepNand(gepNand(x[1], x[3]), gepNand(x[2], x[2])))))),
  Symbol('LM4B4'): Func<bool>(
      'LM4B4',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[3]),
          gepNand(
              gepNand(gepNand(x[1], x[2]),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[3], x[3]))),
              gepNand(x[2], x[2])))),
  Symbol('LM4B5'): Func<bool>(
      'LM4B5',
      4,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[3]), x[3]),
          gepNand(gepNand(gepNand(x[1], gepNand(x[2], x[3])), x[2]), x[2]))),
  Symbol('LM4B6'): Func<bool>(
      'LM4B6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[3]), x[3]),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2])), x[2]),
              x[2]))),
  Symbol('LM4B7'): Func<bool>(
      'LM4B7',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[3]), x[3]),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2])), x[1]),
              x[1]))),
  Symbol('LM4B8'): Func<bool>(
      'LM4B8',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[3]), x[3]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[3], x[3])),
                  gepNand(x[2], x[3])),
              gepNand(x[2], x[2])))),
  Symbol('LM4C1'): Func<bool>(
      'LM4C1',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[1])),
          gepNand(x[1], gepNand(gepNand(x[1], x[2]), gepNand(x[1], x[3]))))),
  Symbol('LM4C2'): Func<bool>(
      'LM4C2',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[1])),
          gepNand(x[1], gepNand(gepNand(x[2], x[3]), x[2])))),
  Symbol('LM4C3'): Func<bool>(
      'LM4C3',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[1], x[1])),
          gepNand(x[1], gepNand(gepNand(x[1], x[2]), x[3])))),
  Symbol('LM4C4'): Func<bool>(
      'LM4C4',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[1], x[3])),
          gepNand(x[1], gepNand(x[2], x[3])))),
  Symbol('LM4C5'): Func<bool>(
      'LM4C5',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
          gepNand(x[1], gepNand(gepNand(x[1], x[2]), gepNand(x[3], x[3]))))),
  Symbol('LM4C6'): Func<bool>(
      'LM4C6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[1])), gepNand(x[1], x[2])),
          gepNand(x[1], x[3]))),
  Symbol('LM4C7'): Func<bool>(
      'LM4C7',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[1])), gepNand(x[1], x[3])),
          gepNand(x[1], x[2]))),
  Symbol('LM4C8'): Func<bool>(
      'LM4C8',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[3])),
          gepNand(x[1], gepNand(x[2], x[3])))),
  Symbol('LM4D1'): Func<bool>(
      'LM4D1',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[1]),
          gepNand(gepNand(x[1], x[2]),
              gepNand(gepNand(x[2], x[3]), gepNand(x[2], x[3]))))),
  Symbol('LM4D2'): Func<bool>(
      'LM4D2',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[1]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])), x[3]),
              x[3]))),
  Symbol('LM4D3'): Func<bool>(
      'LM4D3',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[1]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[2]), gepNand(x[3], x[3])), x[2]),
              x[2]))),
  Symbol('LM4D4'): Func<bool>(
      'LM4D4',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[1]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2])),
                  gepNand(x[2], x[3])),
              gepNand(x[3], x[3])))),
  Symbol('LM4D5'): Func<bool>(
      'LM4D5',
      4,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(gepNand(gepNand(gepNand(x[0], x[1]), x[2]), x[3]), x[3]))),
  Symbol('LM4D6'): Func<bool>(
      'LM4D6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[3]), gepNand(x[2], x[3])), x[3]),
              x[3]))),
  Symbol('LM4D7'): Func<bool>(
      'LM4D7',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[3])), x[2]),
              x[2]))),
  Symbol('LM4D8'): Func<bool>(
      'LM4D8',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])),
                  gepNand(x[2], x[3])),
              gepNand(x[3], x[3])))),
  Symbol('LM4E1'): Func<bool>(
      'LM4E1',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[2])),
          gepNand(gepNand(gepNand(x[1], x[2]), gepNand(x[2], x[3])), x[2]))),
  Symbol('LM4E2'): Func<bool>(
      'LM4E2',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[1], x[2])),
          gepNand(gepNand(x[1], gepNand(x[1], x[3])), x[2]))),
  Symbol('LM4E3'): Func<bool>(
      'LM4E3',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[0], x[2])),
          gepNand(gepNand(gepNand(x[1], x[1]), x[3]), x[2]))),
  Symbol('LM4E4'): Func<bool>(
      'LM4E4',
      4,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[2]), x[0]),
          gepNand(gepNand(x[1], x[3]), x[2]))),
  Symbol('LM4E5'): Func<bool>(
      'LM4E5',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
          gepNand(gepNand(gepNand(x[1], x[2]), gepNand(x[3], x[3])), x[2]))),
  Symbol('LM4E6'): Func<bool>(
      'LM4E6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[2], x[2])), gepNand(x[1], x[2])),
          gepNand(x[2], x[3]))),
  Symbol('LM4E7'): Func<bool>(
      'LM4E7',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[2], x[2])), gepNand(x[2], x[3])),
          gepNand(x[1], x[2]))),
  Symbol('LM4E8'): Func<bool>(
      'LM4E8',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[3])),
          gepNand(gepNand(x[1], x[3]), x[2]))),
  Symbol('LM4F1'): Func<bool>(
      'LM4F1',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[2]),
          gepNand(gepNand(gepNand(x[1], x[3]), gepNand(x[2], x[3])),
              gepNand(x[2], x[2])))),
  Symbol('LM4F2'): Func<bool>(
      'LM4F2',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[2]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[3]), gepNand(x[2], x[3])), x[3]),
              x[3]))),
  Symbol('LM4F3'): Func<bool>(
      'LM4F3',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[2]),
          gepNand(
              x[1],
              gepNand(
                  x[1], gepNand(gepNand(x[1], x[2]), gepNand(x[1], x[3])))))),
  Symbol('LM4F4'): Func<bool>(
      'LM4F4',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[2]),
          gepNand(
              gepNand(gepNand(x[0], x[2]),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2]))),
              gepNand(x[3], x[3])))),
  Symbol('LM4F5'): Func<bool>(
      'LM4F5',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]),
              gepNand(gepNand(x[2], x[2]), gepNand(x[1], x[3]))),
          (true))),
  Symbol('LM4F6'): Func<bool>(
      'LM4F6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), x[2]),
          gepNand(
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[3])), x[3]),
              x[3]))),
  Symbol('LM4F7'): Func<bool>(
      'LM4F7',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]), x[2]),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[3], x[3])), x[1]),
              x[1]))),
  Symbol('LM4F8'): Func<bool>(
      'LM4F8',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]), x[2]),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[3], x[3])),
                  gepNand(x[1], x[2])),
              gepNand(x[1], x[1])))),
  Symbol('LM4G1'): Func<bool>(
      'LM4G1',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1]))),
          gepNand(gepNand(x[0], x[3]), x[3]))),
  Symbol('LM4G2'): Func<bool>(
      'LM4G2',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(x[0], x[2]), x[1])),
          gepNand(gepNand(x[0], x[1]), x[3]))),
  Symbol('LM4G3'): Func<bool>(
      'LM4G3',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(x[1], x[2]), x[2])),
          gepNand(gepNand(x[0], x[0]), x[3]))),
  Symbol('LM4G4'): Func<bool>(
      'LM4G4',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[1], x[2])),
          gepNand(gepNand(x[0], x[1]), x[3]))),
  Symbol('LM4G5'): Func<bool>(
      'LM4G5',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1]))),
          gepNand(gepNand(x[0], x[0]), gepNand(x[3], x[3])))),
  Symbol('LM4G6'): Func<bool>(
      'LM4G6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), gepNand(gepNand(x[0], x[3]), x[3])),
          gepNand(x[0], x[2]))),
  Symbol('LM4G7'): Func<bool>(
      'LM4G7',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], x[1]),
          gepNand(gepNand(x[0], x[2]), gepNand(gepNand(x[0], x[0]), x[3])))),
  Symbol('LM4G8'): Func<bool>(
      'LM4G8',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[1], x[2])),
          gepNand(gepNand(x[0], x[2]), gepNand(x[3], x[3])))),
  Symbol('LM4H1'): Func<bool>(
      'LM4H1',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]),
              gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2]))),
          gepNand(x[0], x[3]))),
  Symbol('LM4H2'): Func<bool>(
      'LM4H2',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])), x[2]),
              x[2]),
          gepNand(x[0], x[3]))),
  Symbol('LM4H3'): Func<bool>(
      'LM4H3',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])), x[1]),
              x[1]),
          gepNand(x[0], x[3]))),
  Symbol('LM4H4'): Func<bool>(
      'LM4H4',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], x[3]),
          gepNand(
              gepNand(gepNand(x[0], x[3]),
                  gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2]))),
              gepNand(x[1], x[1])))),
  Symbol('LM4H5'): Func<bool>(
      'LM4H5',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[3]),
              gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2]))),
          (true))),
  Symbol('LM4H6'): Func<bool>(
      'LM4H6',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1])), x[2]),
              x[2]),
          gepNand(x[0], gepNand(x[0], x[3])))),
  Symbol('LM4H7'): Func<bool>(
      'LM4H7',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2])), x[1]),
              x[1]),
          gepNand(x[0], gepNand(x[3], x[3])))),
  Symbol('LM4H8'): Func<bool>(
      'LM4H8',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(x[0], x[3])),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
                  gepNand(x[1], x[2])),
              gepNand(x[2], x[2])))),
  Symbol('LM4I1'): Func<bool>('LM4I1', 4,
      (List<bool> x) => gepNand(gepNand(gepNand(x[0], x[1]), x[2]), x[3])),
  Symbol('LM4I2'): Func<bool>('LM4I2', 4,
      (List<bool> x) => gepNand(x[0], gepNand(x[1], gepNand(x[2], x[3])))),
  Symbol('LM4I3'): Func<bool>('LM4I3', 4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[1], x[2])), x[3])),
  Symbol('LM4I4'): Func<bool>('LM4I4', 4,
      (List<bool> x) => gepNand(x[0], gepNand(gepNand(x[1], x[2]), x[3]))),
  Symbol('LM4I5'): Func<bool>(
      'LM4I5',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[3], x[3])),
                  gepNand(x[1], x[3])),
              gepNand(x[1], x[1])),
          gepNand(x[2], gepNand(x[2], x[3])))),
  Symbol('LM4I6'): Func<bool>(
      'LM4I6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), x[1]),
          gepNand(
              gepNand(x[0], x[0]),
              gepNand(gepNand(x[1], x[3]),
                  gepNand(gepNand(x[2], x[2]), gepNand(x[3], x[3])))))),
  Symbol('LM4I7'): Func<bool>(
      'LM4I7',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2]))),
              gepNand(x[3], x[3])),
          gepNand(x[0], gepNand(x[0], x[3])))),
  Symbol('LM4I8'): Func<bool>(
      'LM4I8',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
                  gepNand(x[1], x[2])),
              gepNand(x[1], x[1])),
          gepNand(gepNand(x[0], x[0]), x[3]))),
  Symbol('LT4A'): Func<bool>(
      'LT4A',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[1], x[3])),
              gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2]))),
          gepNand(gepNand(x[1], x[3]), x[3]))),
  Symbol('GT4A'): Func<bool>(
      'GT4A',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])),
              gepNand(gepNand(x[0], x[3]), x[1])),
          gepNand(gepNand(x[0], x[0]), x[3]))),
  Symbol('LOE4A'): Func<bool>(
      'LOE4A',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[2]), x[1]),
              gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2]))),
          gepNand(gepNand(x[0], x[2]), x[2]))),
  Symbol('GOE4A'): Func<bool>(
      'GOE4A',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[2])),
              gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[3]))),
          gepNand(gepNand(x[1], x[2]), x[2]))),
  Symbol('ET4A'): Func<bool>(
      'ET4A',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1]))),
              x[2]),
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[3]))))),
  Symbol('NET4A'): Func<bool>(
      'NET4A',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[2]))),
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[1]))),
              x[3]))),
  Symbol('LT4B'): Func<bool>(
      'LT4B',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(gepNand(x[0], x[1]), x[1]), x[3]),
              gepNand(x[1], gepNand(x[2], x[3]))),
          gepNand(x[0], gepNand(x[0], x[3])))),
  Symbol('GT4B'): Func<bool>(
      'GT4B',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], gepNand(x[1], x[3])), x[3]),
              gepNand(x[0], gepNand(x[2], x[3]))),
          gepNand(x[1], gepNand(x[1], x[3])))),
  Symbol('LOE4B'): Func<bool>(
      'LOE4B',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0],
              gepNand(x[0], gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[3])))),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), x[3]), gepNand(x[1], x[3])),
              x[2]))),
  Symbol('GOE4B'): Func<bool>(
      'GOE4B',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), x[1]), gepNand(x[2], x[3])),
              gepNand(x[1], x[3])),
          gepNand(x[0], gepNand(gepNand(x[2], x[3]), gepNand(x[2], x[3]))))),
  Symbol('ET4B'): Func<bool>(
      'ET4B',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2]))),
              gepNand(gepNand(x[0], gepNand(x[1], x[1])), gepNand(x[2], x[3]))),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[3])), x[1]),
              x[1]))),
  Symbol('NET4B'): Func<bool>(
      'NET4B',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1]))),
              gepNand(x[3], x[3])),
          gepNand(
              gepNand(
                  gepNand(gepNand(x[0], x[1]),
                      gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[2]))),
                  x[3]),
              x[3]))),
  Symbol('LT4C'): Func<bool>(
      'LT4C',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(gepNand(x[0], x[3]), x[2]), x[1]),
              gepNand(x[3], x[3])),
          gepNand(gepNand(x[0], x[3]),
              gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[3]))))),
  Symbol('GT4C'): Func<bool>(
      'GT4C',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(
                  gepNand(gepNand(x[0], gepNand(x[2], x[2])),
                      gepNand(gepNand(x[1], x[3]), x[3])),
                  gepNand(x[0], x[3])),
              gepNand(x[1], x[1])),
          gepNand(x[1], gepNand(x[1], x[3])))),
  Symbol('LOE4C'): Func<bool>(
      'LOE4C',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[1], x[1])), x[3]),
          gepNand(
              gepNand(gepNand(x[0], gepNand(x[1], x[1])),
                  gepNand(gepNand(x[0], x[3]), x[2])),
              gepNand(x[0], x[3])))),
  Symbol('GOE4C'): Func<bool>(
      'GOE4C',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), x[1]), gepNand(x[2], x[2])),
              gepNand(x[3], x[3])),
          gepNand(gepNand(gepNand(x[0], x[0]), x[1]), x[3]))),
  Symbol('ET4C'): Func<bool>(
      'ET4C',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              x[0],
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[3], x[3])),
                  gepNand(x[1], x[3]))),
          gepNand(
              gepNand(
                  gepNand(gepNand(x[0], x[0]),
                      gepNand(gepNand(x[1], x[1]), gepNand(x[3], x[3]))),
                  gepNand(x[2], gepNand(x[2], x[3]))),
              gepNand(x[1], x[3])))),
  Symbol('NET4C'): Func<bool>(
      'NET4C',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1]))),
              gepNand(x[3], x[3])),
          gepNand(
              gepNand(gepNand(x[0], gepNand(x[1], x[1])),
                  gepNand(gepNand(x[0], x[0]), x[1])),
              gepNand(gepNand(x[2], x[2]), gepNand(x[3], x[3]))))),
  Symbol('LT4D'): Func<bool>(
      'LT4D',
      4,
      (List<bool> x) => gepNand(gepNand(x[0], gepNand(x[2], x[3])),
          gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[3])))),
  Symbol('GT4D'): Func<bool>(
      'GT4D',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[1])), gepNand(x[2], x[3])),
          gepNand(gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[1])),
              gepNand(x[1], x[2])))),
  Symbol('LOE4D'): Func<bool>(
      'LOE4D',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              x[0],
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[3])),
                  gepNand(x[1], x[3]))),
          gepNand(x[0], gepNand(x[0], gepNand(x[1], x[3]))))),
  Symbol('GOE4D'): Func<bool>(
      'GOE4D',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[3])), x[1]),
              x[1]),
          gepNand(x[0], x[3]))),
  Symbol('ET4D'): Func<bool>(
      'ET4D',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[3])), x[1]),
              x[1]),
          gepNand(
              x[0],
              gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[3])),
                  gepNand(x[1], x[3]))))),
  Symbol('NET4D'): Func<bool>(
      'NET4D',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(x[0], gepNand(x[1], gepNand(x[2], x[3])))),
          gepNand(
              gepNand(gepNand(x[0], x[3]),
                  gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[3]))),
              gepNand(x[1], x[1])))),
  Symbol('LT4E'): Func<bool>(
      'LT4E',
      4,
      (List<bool> x) =>
          gepNand(gepNand(gepNand(x[0], x[1]), x[1]), gepNand(x[0], x[2]))),
  Symbol('GT4E'): Func<bool>(
      'GT4E',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(x[0], gepNand(x[1], x[2]))),
          gepNand(
              x[0],
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[3])),
                  gepNand(x[1], x[2]))))),
  Symbol('LOE4E'): Func<bool>(
      'LOE4E',
      4,
      (List<bool> x) => gepNand(
          x[0],
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])),
              gepNand(x[1], x[3])))),
  Symbol('GOE4E'): Func<bool>(
      'GOE4E',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
          gepNand(x[0], gepNand(x[0], x[3])))),
  Symbol('ET4E'): Func<bool>(
      'ET4E',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])),
              gepNand(x[1], x[3])),
          gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])))),
  Symbol('NET4E'): Func<bool>(
      'NET4E',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], gepNand(x[3], x[3])), gepNand(x[1], x[1]))),
          gepNand(x[1], x[2]))),
  Symbol('Q0002'): Func<bool>(
      'Q0002',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[3]), x[3]), gepNand(x[1], x[3])),
              gepNand(gepNand(gepNand(x[1], x[3]), gepNand(x[2], x[3])), x[3])),
          (true))),
  Symbol('Q001C'): Func<bool>(
      'Q001C',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[2])), x[2]),
              x[2]),
          gepNand(
              gepNand(x[1], gepNand(gepNand(x[1], x[2]), gepNand(x[1], x[3]))),
              gepNand(
                  gepNand(gepNand(x[0], x[1]), x[1]), gepNand(x[1], x[2]))))),
  Symbol('Q0048'): Func<bool>(
      'Q0048',
      4,
      (List<bool> x) => gepNand(
          (true),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[3])), x[2]),
              gepNand(gepNand(x[1], x[2]), gepNand(x[2], x[3]))))),
  Symbol('Q0800'): Func<bool>(
      'Q0800',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              x[0],
              gepNand(
                  x[0],
                  gepNand(gepNand(x[0], gepNand(x[2], x[3])),
                      gepNand(x[1], x[3])))),
          (true))),
  Symbol('Q3378'): Func<bool>(
      'Q3378',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(x[2], x[2])),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[3])), x[2]),
              gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[3]))))),
  Symbol('Q3475'): Func<bool>(
      'Q3475',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(gepNand(x[0], x[1]), x[2])),
              gepNand(x[3], x[3])),
          gepNand(x[1], gepNand(x[1], x[2])))),
  Symbol('Q3CB0'): Func<bool>(
      'Q3CB0',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[3]))),
          gepNand(x[1], gepNand(x[2], x[2])))),
  Symbol('Q3DEF'): Func<bool>(
      'Q3DEF',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(gepNand(x[0], x[1]), x[2]), x[2]),
              gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2]))),
          gepNand(gepNand(x[0], x[3]), gepNand(x[1], gepNand(x[3], (true)))))),
  Symbol('Q3DFF'): Func<bool>(
      'Q3DFF',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[0], x[2])),
              gepNand(x[1], x[2])),
          gepNand(gepNand(x[0], x[2]), gepNand(x[0], x[3])))),
  Symbol('Q4200'): Func<bool>(
      'Q4200',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], gepNand(x[3], x[3])),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[2]))),
              gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2]))),
          (true))),
  Symbol('Q4C11'): Func<bool>(
      'Q4C11',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
                  gepNand(x[0], x[2])),
              gepNand(x[3], x[3])),
          gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[0], x[2])),
              gepNand(x[1], x[3])))),
  Symbol('Q5100'): Func<bool>(
      'Q5100',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              x[0],
              gepNand(
                  x[0],
                  gepNand(gepNand(gepNand(x[0], x[1]), x[2]),
                      gepNand(x[0], x[3])))),
          (true))),
  Symbol('Q5EEF'): Func<bool>(
      'Q5EEF',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), x[1]),
              gepNand(x[0], gepNand(gepNand(x[0], x[3]), x[1]))),
          gepNand(gepNand(x[0], x[1]),
              gepNand(gepNand(x[2], x[2]), gepNand(x[3], x[3]))))),
  Symbol('Q5EFF'): Func<bool>(
      'Q5EFF',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], gepNand(x[0], x[2])), gepNand(x[0], x[3])),
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[3], x[3])),
              gepNand(x[1], x[3])))),
  Symbol('Q6A6D'): Func<bool>(
      'Q6A6D',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(x[0], gepNand(x[0], x[1])),
                  gepNand(x[1], gepNand(x[2], x[3]))),
              x[3]),
          gepNand(
              gepNand(gepNand(x[0], x[1]),
                  gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[3]))),
              gepNand(gepNand(gepNand(x[1], x[3]), x[2]),
                  gepNand(gepNand(x[1], x[1]), gepNand(x[3], x[3])))))),
  Symbol('Q6F75'): Func<bool>(
      'Q6F75',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), gepNand(gepNand(x[0], x[0]), x[3])),
          gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[3])),
              gepNand(x[2], x[3])))),
  Symbol('Q74C4'): Func<bool>(
      'Q74C4',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[2])),
              gepNand(x[0], x[2])),
          gepNand(x[2], gepNand(x[2], x[3])))),
  Symbol('Q7DA3'): Func<bool>(
      'Q7DA3',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(gepNand(x[0], x[1]), x[2]), x[3])),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[2]), x[1]),
                  gepNand(gepNand(x[0], x[3]), gepNand(x[2], x[2]))),
              gepNand(x[1], gepNand(x[1], x[3]))))),
  Symbol('Q8304'): Func<bool>(
      'Q8304',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0],
              gepNand(x[0], gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])))),
          gepNand(
              gepNand(
                  gepNand(gepNand(gepNand(x[0], x[1]), x[3]),
                      gepNand(x[0], gepNand(x[0], x[3]))),
                  x[2]),
              gepNand(
                  gepNand(gepNand(x[1], x[1]), x[2]), gepNand(x[2], x[3]))))),
  Symbol('Q8430'): Func<bool>(
      'Q8430',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[1]), gepNand(x[2], x[2])),
                  gepNand(gepNand(x[1], x[1]), x[2])),
              x[1]),
          gepNand(
              gepNand(gepNand(x[0], x[2]), gepNand(x[0], x[2])),
              gepNand(gepNand(gepNand(x[1], x[2]), gepNand(x[3], x[3])),
                  gepNand(x[1], x[3]))))),
  Symbol('Q8543'): Func<bool>(
      'Q8543',
      4,
      (List<bool> x) => gepNand(
          gepNand(
              gepNand(gepNand(gepNand(x[0], gepNand(x[2], x[3])), x[2]), x[1]),
              gepNand(
                  gepNand(gepNand(gepNand(x[0], x[2]), x[3]), x[1]),
                  gepNand(gepNand(x[0], x[3]),
                      gepNand(gepNand(x[0], x[0]), x[2])))),
          (true))),
  Symbol('Q9D80'): Func<bool>(
      'Q9D80',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0],
              gepNand(x[0], gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2])))),
          gepNand(gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[3])), x[2]))),
  Symbol('QA092'): Func<bool>(
      'QA092',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[3]), x[1]), x[1]),
          gepNand(
              gepNand(gepNand(x[1], gepNand(gepNand(x[2], x[3]), x[3])),
                  gepNand(gepNand(x[1], gepNand(x[2], x[3])), x[3])),
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[2], x[2])),
                  gepNand(x[1], x[3]))))),
  Symbol('QB36A'): Func<bool>(
      'QB36A',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(x[1], x[3]), x[2])),
          gepNand(
              gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[3])), x[2]),
              gepNand(gepNand(x[1], x[2]), gepNand(x[3], x[3]))))),
  Symbol('QCBCF'): Func<bool>(
      'QCBCF',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1])),
          gepNand(gepNand(gepNand(x[0], x[3]), gepNand(x[1], x[2])), x[2]))),
  Symbol('QEEB1'): Func<bool>(
      'QEEB1',
      4,
      (List<bool> x) => gepNand(
          gepNand(x[0], gepNand(gepNand(x[2], x[2]), gepNand(x[3], x[3]))),
          gepNand(
              gepNand(x[0], x[0]),
              gepNand(gepNand(x[1], x[3]),
                  gepNand(gepNand(x[2], x[2]), gepNand(x[3], x[3])))))),
  Symbol('QEFFF'): Func<bool>(
      'QEFFF',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(x[0], x[1]), gepNand(x[1], x[3])),
          gepNand(gepNand(gepNand(x[0], x[2]), gepNand(x[3], x[3])), x[1]))),
  Symbol('QFF7B'): Func<bool>(
      'QFF7B',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[1]), x[3]),
              gepNand(gepNand(x[0], x[2]), gepNand(x[1], x[1]))),
          gepNand(gepNand(x[2], gepNand(x[2], x[3])), gepNand(x[1], x[2])))),
  Symbol('QFFF6'): Func<bool>(
      'QFFF6',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[0]), gepNand(x[1], x[1])),
              gepNand(gepNand(x[2], x[2]), x[3])),
          gepNand(gepNand(gepNand(x[2], x[2]), gepNand(x[3], x[3])),
              gepNand(x[2], x[3])))),
  Symbol('QFFFB'): Func<bool>(
      'QFFFB',
      4,
      (List<bool> x) => gepNand(
          gepNand(gepNand(gepNand(x[0], x[2]), x[2]), gepNand(x[2], x[3])),
          gepNand(gepNand(gepNand(x[1], x[1]), gepNand(x[2], x[3])), x[2]))),
};
