// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import 'dart:math';

import 'package:gym/gym.dart'; // OpenAI Gym

import 'gene.dart';
import 'shaper.dart';

/// [Genome] represents a single GEP genome.
///
/// It contains the [Gene]s that make up the genome
/// and the final [Shaper] that shapes
/// the final [Genome] result.
abstract class Genome {
  Genome(this.genes, this.shaper);

  Genome.withSingleActionSpace({
    int numGenes,
    int numTerminals,
    Space singleActionSpace,
  })  : assert(numGenes != null),
        assert(singleActionSpace != null) {
    switch (singleActionSpace.name) {
      case 'Discrete':
        shaper = DiscreteShaper(singleActionSpace.n);
        genes = List.generate<IntGene>(
            numGenes,
            (i) => IntGene.random(
                  numTerminals: numTerminals,
                ));
        break;
      default:
        throw 'Unsupported singleActionSpace: ${singleActionSpace.name}';
    }
  }

  factory Genome.fromOpenAI(Space singleActionSpace, Space observationSpace) {
    switch (observationSpace.name) {
      case 'Discrete':
        return DiscreteGenome.withSingleActionSpace(
            numGenes: observationSpace.n, singleActionSpace: singleActionSpace);
      default:
        throw 'Unsupported Genome observationSpace: ${observationSpace.name}';
    }
  }

  Genome copy();

  List<Gene> genes;
  Shaper shaper;

  dynamic model(dynamic observation);

  mutate(int numMutations) {
    for (var i = 0; i < numMutations; i++) {
      var n = Random().nextInt(genes.length);
      genes[n].mutate();
    }
  }

  rebuildModel() {
    genes.forEach((gene) {
      gene.rebuildModel();
    });
  }
}

/// DiscreteGenome accepts a single integer observation input during evaluation.
class DiscreteGenome extends Genome {
  DiscreteGenome(List<Gene> genes, Shaper shaper) : super(genes, shaper);

  DiscreteGenome.withSingleActionSpace({
    int numGenes,
    Space singleActionSpace,
  }) : super.withSingleActionSpace(
            numGenes: numGenes,
            numTerminals: 1,
            singleActionSpace: singleActionSpace);

  @override
  DiscreteGenome copy() => DiscreteGenome(
      List.generate(genes.length, (i) => genes[i].copy()), shaper);

  @override
  dynamic model(dynamic observation) {
    List<dynamic> x = [observation];
    var out = shaper.shape(genes[observation as int].model(x));
    return out as dynamic;
  }
}
