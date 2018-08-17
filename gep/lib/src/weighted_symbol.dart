// -*- compile-command: "cd ../.. && ./df.sh"; -*-

/// WeightedSymbol represents GEP symbol with its weight.
class WeightedSymbol {
  WeightedSymbol(String symbolName, this.weight) : symbol = Symbol(symbolName);

  Symbol symbol;
  int weight;
}
