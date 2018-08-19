// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'package:gym/gym.dart'; // OpenAI Gym

import 'genome.dart';

/// A single generation to evaluate and evolve.
class Generation {
  Generation({
    this.genomes,
  });

  List<Genome> genomes;
  double
      reward; // How well this Generation performed (positive is good, negative is poor).

  Generation.fromOpenAI(ActionSpace actionSpace, Space observationSpace) {
    switch (actionSpace.name) {
      case "Tuple":
        var numGenomes = actionSpace.spaces.length;
        genomes = List.generate(numGenomes,
            (i) => Genome.fromOpenAI(actionSpace.spaces[i], observationSpace));
        break;
      default:
        throw 'Generation: $actionSpace not yet supported';
    }
  }

  dynamic evaluate(dynamic observation) {
    List<dynamic> results =
        List.generate(genomes.length, (i) => genomes[i].model(observation));
    print('Generation results=$results');
    return results;
  }
}
