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
        return DiscreteGenome(
            numGenes: observationSpace.n, singleActionSpace: singleActionSpace);
      default:
        throw 'Unsupported Genome observationSpace: ${observationSpace.name}';
    }
  }

  List<Gene> genes;
  Shaper shaper;

  dynamic model(dynamic observation) {
    var results =
        List.generate(genes.length, (i) => genes[i].model(observation));
    dynamic out = shaper.shape(results);
    return out;
  }
}

/// DiscreteGenome accepts a single integer observation input during evaluation.
class DiscreteGenome extends Genome {
  DiscreteGenome({
    int numGenes,
    Space singleActionSpace,
  }) : super(
            numGenes: numGenes,
            numTerminals: 1,
            singleActionSpace: singleActionSpace);

  @override
  dynamic model(dynamic observation) {
    print('genes.length=${genes.length}');
    print('genes.runtimeType=${genes.runtimeType}');
    print('genes[0].runtimeType=${genes[0].runtimeType}');
    print(
        'genes[0].model.runtimeType=${genes[0].model.runtimeType}'); // CRASHES!!!
    // type '(List<int>) => int' is not a subtype of type '(List<dynamic>) => dynamic'
    List<int> x = [observation as int];
    print('x=$x');
    var val = genes[0].model(x); // Just for debugging
    print('genes[0].model($x)=${val}');
    var results = List.generate<int>(genes.length, (i) => genes[i].model(x));
    print('Genome results=$results');
    dynamic out = shaper.shape(results);
    print('Genome shaped out=$out');
    return out;
  }
}
