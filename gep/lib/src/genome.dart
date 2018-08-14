// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'package:gym/gym.dart'; // OpenAI Gym

import 'gene.dart';
import 'shaper.dart';

/// [Genome] represents a single GEP genome.
///
/// It contains the [Gene]s that make up the genome
/// and the final [Shaper] that shapes
/// the final [Genome] result.
abstract class Genome {
  Genome({
    int numGenes,
    Space singleActionSpace,
  })  : assert(numGenes != null),
        assert(singleActionSpace != null) {
    switch (singleActionSpace.name) {
      case 'Discrete':
        shaper = DiscreteShaper(singleActionSpace.n);
        break;
      default:
        throw 'Unsupported singleActionSpace: ${singleActionSpace.name}';
    }
  }

  factory Genome.fromOpenAI(Space singleActionSpace, Space observationSpace) {
    switch (observationSpace.name) {
      case 'Discrete':
        return DiscreteGenome(
            numGenes: observationSpace.n, singleActionSpace: singleActionSpace);
      default:
        throw 'Unsupported Genome observationSpace: ${observationSpace.name}';
    }
  }

  List<Gene> genes;
  Shaper shaper;
}

/// DiscreteGenome accepts a single integer observation input during evaluation.
class DiscreteGenome extends Genome {
  DiscreteGenome({
    int numGenes,
    Space singleActionSpace,
  }) : super(numGenes: numGenes, singleActionSpace: singleActionSpace);
}
