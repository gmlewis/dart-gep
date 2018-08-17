// -*- compile-command: "cd ../../.. && ./df.sh"; -*-

import 'dart:mirrors';

import '../bool_nodes/nand_nodes.dart';
import '../functions.dart';
import '../vector.dart';

/// vectorBoolNandNodes defines the vector of bool nand functions
/// available for class [VectorBoolGene].
///
/// For the complete list of nodes, take a look at [boolNandNodes].
Map<Symbol, Func<VectorBool>> vectorBoolNandNodes = Map.fromIterable(
  boolNandNodes.entries,
  key: (e) => e.key,
  value: (e) => Func<VectorBool>(MirrorSystem.getName(e.key), e.value.terminals,
          (List<VectorBool> x) {
        if (x.length == 0) return VectorBool([]);
        if (x.length < e.value.terminals) {
          print('fewer vectors than required number of terminals!');
          return VectorBool([]);
        }
        final resultLength = x[0].length;
        for (var i = 1; i < e.value.terminals; i++) {
          if (x[i].length != x[0].length) {
            return VectorBool([]); // Vectors must be same length.
          }
        }
        List<bool> result = [];
        for (var i = 0; i < resultLength; i++) {
          List<bool> args =
              List.generate<bool>(e.value.terminals, (j) => x[j].data[i]);
          result.add(e.value.func(args));
        }
        return VectorBool(result);
      }),
);
