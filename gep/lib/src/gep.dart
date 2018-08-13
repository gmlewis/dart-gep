// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'package:gym/gym.dart'; // OpenAI Gym

import './genome.dart';
import './weighted_symbol.dart';

/// Gene Expression Programming (GEP) library in Dart.
class GEP {
  GEP({
    int numGenomes = 1,
  }) {}

  List<Genome> genomes;
  List<WeightedSymbol> weightedSymbols;

  factory GEP.fromOpenAI(ActionSpace actionSpace, Space observationSpace) {
    var numGenomes = 1;
    switch (actionSpace.name) {
      case "Tuple":
        numGenomes = actionSpace.spaces.length;
        break;
      default:
        throw ('$actionSpace not yet supported');
    }
    return GEP(numGenomes: numGenomes);
  }

  dynamic getAction(dynamic observation) {
    throw ('getAction not implemented yet');
  }

  evolve(double reward) {
    throw ('evolve not implemented yet');
  }
}
