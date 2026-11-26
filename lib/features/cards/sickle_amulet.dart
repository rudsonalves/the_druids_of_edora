class SickleAmulet {
  static const maxSickle = 13;
  static const positions = ['I', 'II', 'III'];
  final _occupied = <int>{};

  int sickle = 0;
  bool get atLimit => sickle >= maxSickle;
  bool occupied(int slot) => _occupied.contains(slot);
  bool get secondPositionFull => occupied(2) && occupied(3);

  void advanceSickle() {
    if (!atLimit) sickle++;
  }

  void addGem(int slot) {
    assert(slot >= 0 && slot < 6 && !occupied(slot));
    _occupied.add(slot);
  }

  static String slotName(int slot) =>
      '${positions[slot ~/ 2]} · ${slot % 2 + 1}';
}
