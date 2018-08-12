// -*- compile-command: "cd .. && ./df.sh"; -*-

import 'package:gep/gep.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    GEP gep;

    setUp(() {
      gep = GEP();
    });

    test('First Test', () {
      print('gep=$gep');
    });
  });
}
