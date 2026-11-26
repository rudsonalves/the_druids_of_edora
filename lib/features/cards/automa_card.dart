import 'dart:math';

enum AutomaCard {
  competition,
  connectDolmens,
  surroundFire,
  standingStone,
  sickleAmulet,
  tabletMistletoe,
  knowledgeProvision,
}

class AutomaDeck {
  AutomaDeck(this.random);

  final Random random;
  final List<AutomaCard> _remaining = [];

  int get remaining => _remaining.length;
  int draws = 0;
  int _dolmenDraws = 0;

  bool canDrawDolmens({required bool hasAvailablePairs}) =>
      hasAvailablePairs && (draws >= 9 || _dolmenDraws < 2);

  bool needsShuffle({bool hasAvailablePairs = true}) => !_remaining.any(
    (card) =>
        card != AutomaCard.connectDolmens ||
        canDrawDolmens(hasAvailablePairs: hasAvailablePairs),
  );

  AutomaCard draw({bool hasAvailablePairs = true}) {
    if (needsShuffle(hasAvailablePairs: hasAvailablePairs)) {
      final nextCycle =
          AutomaCard.values.where((card) => !_remaining.contains(card)).toList()
            ..shuffle(random);
      _remaining.insertAll(0, nextCycle);
    }
    final index = _remaining.lastIndexWhere(
      (card) =>
          card != AutomaCard.connectDolmens ||
          canDrawDolmens(hasAvailablePairs: hasAvailablePairs),
    );
    final card = _remaining.removeAt(index);
    draws++;
    if (card == AutomaCard.connectDolmens) _dolmenDraws++;
    return card;
  }
}
