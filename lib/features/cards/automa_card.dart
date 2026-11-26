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
  int get drawnInCycle => AutomaCard.values.length - remaining;

  AutomaCard draw() {
    if (_remaining.isEmpty) {
      _remaining.addAll(AutomaCard.values);
      _remaining.shuffle(random);
    }
    return _remaining.removeLast();
  }
}
