// -*- compile-command: "cd ../.. && ./df.sh"; -*-

import './gene.dart';

/// Genome represents a single GEP genome.
/// It contains the genes that make up the genome
/// and the linking function symbol used to generate
/// the final genome result.
class Genome {
  Genome({
    int numGenes = 1,
  }) {}

  List<Gene> genes;
  String linkFunctionSymbol;
}
