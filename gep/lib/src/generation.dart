// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'dart:math';

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

  Generation copy() => Generation(
      genomes: List.generate(genomes.length, (i) => genomes[i].copy()));

  mutation() {
    // Determine the total number of genomes to mutate
    var numGenomes = 1 + Random().nextInt(genomes.length - 1);
    for (var i = 0; i < numGenomes; i++) {
      // Pick a random genome
      var genomeNum = Random().nextInt(genomes.length);
      var genome = genomes[genomeNum];
      // Determine the total number of mutations to perform within the genome
      var numMutations = 1 + Random().nextInt(2);
      genome.mutate(numMutations);
    }
  }

  rebuildModel() {
    genomes.forEach((genome) {
      genome.rebuildModel();
    });
  }
}
