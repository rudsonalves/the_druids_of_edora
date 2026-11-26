import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_druids_of_edora/features/cards/automa_card.dart';

void main() {
  for (final form in AutomaForm.values) {
    test('builds and reshuffles the 10-card ${form.name} deck', () {
      final deck = AutomaDeck(Random(7), form: form);
      final extra = form == AutomaForm.druid
          ? [
              AutomaCard.surroundFire,
              AutomaCard.sickleAmulet,
              AutomaCard.tabletMistletoe,
            ]
          : [
              AutomaCard.competition,
              AutomaCard.standingStone,
              AutomaCard.knowledgeProvision,
            ];
      final expected = [...AutomaCard.values, ...extra];
      expect(List.generate(10, (_) => deck.draw()), unorderedEquals(expected));
      expect(deck.remaining, 0);
      expect(List.generate(10, (_) => deck.draw()), unorderedEquals(expected));
    });
  }

  test('defers dolmens while no pair is available', () {
    final deck = AutomaDeck(Random(7), form: AutomaForm.druid);
    for (var i = 0; i < 12; i++) {
      expect(
        deck.draw(hasAvailablePairs: false),
        isNot(AutomaCard.connectDolmens),
      );
    }
    expect(deck.draw(), AutomaCard.connectDolmens);
  });
}
