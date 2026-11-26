import 'dart:math';

enum KnowledgeProvisionChoice { knowledge, provisions }

enum AutomaCard {
  competition,
  connectDolmens,
  surroundFire,
  standingStone,
  sickleAmulet,
  tabletMistletoe,
  knowledgeProvision;

  bool get usesShrineAction => switch (this) {
    competition || connectDolmens || surroundFire => true,
    _ => false,
  };
}

enum AutomaForm {
  druid,
  bear;

  List<AutomaCard> get extraCards => switch (this) {
    druid => [
      AutomaCard.surroundFire,
      AutomaCard.sickleAmulet,
      AutomaCard.tabletMistletoe,
    ],
    bear => [
      AutomaCard.competition,
      AutomaCard.standingStone,
      AutomaCard.knowledgeProvision,
    ],
  };
}

class AutomaDeck {
  AutomaDeck(this.random, {required AutomaForm form})
    : _cards = [...AutomaCard.values, ...form.extraCards];

  final List<AutomaCard> _cards;

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
      _refill();
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

  void _refill() {
    final nextCycle = List<AutomaCard>.of(_cards);
    for (final deferred in _remaining) {
      nextCycle.remove(deferred);
    }
    nextCycle.shuffle(random);
    _remaining.insertAll(0, nextCycle);
  }
}
