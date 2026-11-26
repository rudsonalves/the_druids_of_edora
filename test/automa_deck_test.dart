import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_druids_of_edora/features/cards/automa_card.dart';

void main() {
  test('draws all seven cards before reshuffling', () {
    final deck = AutomaDeck(Random(7));

    final firstCycle = List.generate(7, (_) => deck.draw());
    expect(firstCycle.toSet(), AutomaCard.values.toSet());
    expect(deck.remaining, 0);
    expect(deck.draws, 7);

    final nextCard = deck.draw();
    expect(AutomaCard.values, contains(nextCard));
    expect(deck.remaining, 6);
    expect(deck.draws, 8);

    final secondCycle = [nextCard, ...List.generate(6, (_) => deck.draw())];
    expect(secondCycle.toSet(), AutomaCard.values.toSet());
  });

  test('restores dolmen eligibility at the tenth draw', () {
    final deck = List.generate(100, (seed) => AutomaDeck(Random(seed)))
        .firstWhere((deck) {
          final firstEight = List.generate(8, (_) => deck.draw());
          return firstEight
                  .where((card) => card == AutomaCard.connectDolmens)
                  .length ==
              2;
        });

    expect(deck.canDrawDolmens(hasAvailablePairs: true), isFalse);
    expect(deck.draw(), isNot(AutomaCard.connectDolmens));
    expect(deck.canDrawDolmens(hasAvailablePairs: true), isTrue);
  });

  test('defers dolmens while no pair is available', () {
    final deck = AutomaDeck(Random(7));
    for (var i = 0; i < 12; i++) {
      expect(
        deck.draw(hasAvailablePairs: false),
        isNot(AutomaCard.connectDolmens),
      );
    }
    expect(deck.draw(), AutomaCard.connectDolmens);
  });
}
