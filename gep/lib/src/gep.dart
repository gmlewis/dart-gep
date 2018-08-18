// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'package:gym/gym.dart'; // OpenAI Gym

import 'genome.dart';
import 'weighted_symbol.dart';

typedef dynamic LinkFunction(dynamic observation, List<dynamic> x);

/// Gene Expression Programming (GEP) library in Dart.
class GEP {
  GEP({
    this.genomes,
    this.weightedSymbols,
  }) {}

  List<Genome> genomes;
  List<WeightedSymbol> weightedSymbols;

  GEP.fromOpenAI(ActionSpace actionSpace, Space observationSpace) {
    switch (actionSpace.name) {
      case "Tuple":
        var numGenomes = actionSpace.spaces.length;
        genomes = List.generate(numGenomes,
            (i) => Genome.fromOpenAI(actionSpace.spaces[i], observationSpace));
        break;
      default:
        throw '$actionSpace not yet supported';
    }
  }

  dynamic evaluate(dynamic observation) {
    List<dynamic> results =
        List.generate(genomes.length, (i) => genomes[i].model(observation));
    print('GEP results=$results');
    return results;
  }

  evolve(double reward) {
    throw 'evolve not implemented yet';
  }
}
