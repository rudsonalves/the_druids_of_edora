import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_druids_of_edora/features/cards/automa_card.dart';

void main() {
  test('draws all seven cards before reshuffling', () {
    final deck = AutomaDeck(Random(7));

    final firstCycle = List.generate(7, (_) => deck.draw());
    expect(firstCycle.toSet(), AutomaCard.values.toSet());
    expect(deck.remaining, 0);
    expect(deck.drawnInCycle, 7);

    final nextCard = deck.draw();
    expect(AutomaCard.values, contains(nextCard));
    expect(deck.remaining, 6);
    expect(deck.drawnInCycle, 1);

    final secondCycle = [nextCard, ...List.generate(6, (_) => deck.draw())];
    expect(secondCycle.toSet(), AutomaCard.values.toSet());
  });
}
