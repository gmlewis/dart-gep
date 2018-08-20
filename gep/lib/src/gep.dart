// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'package:gym/gym.dart'; // OpenAI Gym

import 'generation.dart';

const _defaultNumGenerations = 10;

/// Gene Expression Programming (GEP) library in Dart.
class GEP {
  GEP({this.numGenerations = _defaultNumGenerations});

  ActionSpace actionSpace;
  Space observationSpace;

  Generation current; // The current generation being evaluated.

  int numGenerations; // The number of generations to keep for evolution.
  List<Generation> generations = [];

  GEP.fromOpenAI(this.actionSpace, this.observationSpace,
      {this.numGenerations = _defaultNumGenerations}) {
    current = Generation.fromOpenAI(actionSpace, observationSpace);
  }

  dynamic evaluate(dynamic observation) => current.evaluate(observation);

  evolve(double reward) {
    current.reward = reward;
    if (generations.length < numGenerations) {
      generations.add(current);
      current = Generation.fromOpenAI(actionSpace, observationSpace);
      return;
    }

    // Sort the generations (descending) by reward, then replace the
    // lowest score (the last one).
    generations.sort((a, b) => (1000.0 * (a.reward - b.reward)).round());
    generations[generations.length - 1] = current;

    // Sort again, and evolve the fittest (the first one) with the
    // genetic material from the others.
    generations.sort((a, b) => (1000.0 * (a.reward - b.reward)).round());

    current = generations[0].copy();

    // current.replication(); // Section 3.3.1, book page 75
    current.mutation(); // Section 3.3.2, book page 77
    // current.isTransposition()
    // current.risTransposition()
    // current.geneTransposition()
    // current.onePointRecombination()
    // current.twoPointRecombination()
    // current.geneRecombination()

    current.rebuildModel();
  }
}
