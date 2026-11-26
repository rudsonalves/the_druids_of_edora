import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_druids_of_edora/features/cards/automa_card.dart';
import 'package:the_druids_of_edora/features/cards/die_selector.dart';

class IndexRandom implements Random {
  IndexRandom(this.index);

  final int index;

  @override
  int nextInt(int max) => index % max;

  @override
  bool nextBool() => true;

  @override
  double nextDouble() => 0.5;
}

void main() {
  test('chooses strongest and weakest values as instructed', () {
    const dice = [1, 2, 4, 6, 6];
    expect(DieSelector.select(AutomaCard.competition, dice, IndexRandom(0)), 6);
    expect(
      DieSelector.select(AutomaCard.standingStone, dice, IndexRandom(0)),
      6,
    );
    expect(
      DieSelector.select(AutomaCard.knowledgeProvision, dice, IndexRandom(0)),
      1,
    );
  });

  test('chooses most frequent value and randomly breaks a frequency tie', () {
    expect(
      DieSelector.select(AutomaCard.surroundFire, [1, 2, 2, 3], IndexRandom(0)),
      2,
    );
    const tied = [2, 2, 5, 5, 6];
    expect(
      DieSelector.select(AutomaCard.connectDolmens, tied, IndexRandom(0)),
      2,
    );
    expect(
      DieSelector.select(AutomaCard.connectDolmens, tied, IndexRandom(1)),
      5,
    );
  });
}
