import 'dart:math';

import 'automa_card.dart';

class DieSelector {
  const DieSelector._();

  static int select(AutomaCard card, List<int> availableDice, Random random) {
    if (availableDice.isEmpty) {
      throw StateError('No dice available');
    }

    switch (card) {
      case AutomaCard.competition:
      case AutomaCard.standingStone:
        return availableDice.reduce(max);
      case AutomaCard.knowledgeProvision:
        return availableDice.reduce(min);
      default:
        final counts = <int, int>{};
        for (final die in availableDice) {
          counts.update(die, (count) => count + 1, ifAbsent: () => 1);
        }

        final highestCount = counts.values.reduce(max);
        final tiedValues =
            counts.keys.where((value) => counts[value] == highestCount).toList()
              ..sort();
        return tiedValues[random.nextInt(tiedValues.length)];
    }
  }
}
