import 'dart:math';

enum AmuletGem {
  red,
  orange,
  amber,
  green,
  turquoise,
  blue;

  String get asset => 'assets/gems/gem-$name.png';
}

class SickleAmulet {
  static const maxSickle = 13;
  static const positions = ['I', 'II', 'III'];
  final _gems = <int, AmuletGem>{};

  int sickle = 0;
  bool get atLimit => sickle >= maxSickle;
  int get gemsPlaced => _gems.length;
  bool get amuletComplete => gemsPlaced == AmuletGem.values.length;
  AmuletGem? gemAt(int slot) => _gems[slot];

  int? firstFreeSlot(int row) {
    if (row < 0 || row >= positions.length) return null;
    for (var slot = row * 2; slot < row * 2 + 2; slot++) {
      if (!_gems.containsKey(slot)) return slot;
    }
    return null;
  }

  bool get secondPositionFull => firstFreeSlot(1) == null;

  void advanceSickle() {
    if (!atLimit) sickle++;
  }

  int? drawGemForRow(int row, Random random) {
    final slot = firstFreeSlot(row);
    if (slot == null) return null;
    final unused = AmuletGem.values
        .where((gem) => !_gems.containsValue(gem))
        .toList();
    _gems[slot] = unused[random.nextInt(unused.length)];
    return slot;
  }

  static String slotName(int slot) =>
      '${positions[slot ~/ 2]} · ${slot % 2 + 1}';
}
