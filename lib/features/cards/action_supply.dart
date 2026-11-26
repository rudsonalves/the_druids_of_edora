import 'dart:math';

enum SupplyAction {
  tablet,
  potion,
  standingStone,
  runestone;

  bool get isStone => this == standingStone || this == runestone;
}

class ActionSupply {
  static const stoneCapacity = 6;
  final _tablets = List.generate(15, (_) => [true, true]);
  final _usedPotions = <int>{};
  final _stones = {
    SupplyAction.standingStone: stoneCapacity,
    SupplyAction.runestone: stoneCapacity,
  };

  int stoneCount(SupplyAction action) => _stones[action] ?? 0;

  Iterable<int> itemIds(SupplyAction action) => switch (action) {
    SupplyAction.tablet => List.generate(_tablets.length, (index) => index + 1),
    SupplyAction.potion => [
      for (var cost = 1; cost <= 6; cost++)
        for (var variant = 1; variant <= 3; variant++) cost * 10 + variant,
    ],
    SupplyAction.standingStone || SupplyAction.runestone => const [1],
  };

  int capacity(SupplyAction action) => switch (action) {
    SupplyAction.tablet => 2,
    SupplyAction.potion => 1,
    SupplyAction.standingStone || SupplyAction.runestone => stoneCapacity,
  };

  int count(SupplyAction action, int item) => switch (action) {
    SupplyAction.tablet => _tablets[item - 1].where((copy) => copy).length,
    SupplyAction.potion => _usedPotions.contains(item) ? 0 : 1,
    SupplyAction.standingStone || SupplyAction.runestone => stoneCount(action),
  };

  int unavailableCount(SupplyAction action) => itemIds(action)
      .fold(0, (total, item) => total + capacity(action) - count(action, item));

  bool tabletCopyAvailable(int item, int copy) => _tablets[item - 1][copy];

  void toggleTabletCopy(int item, int copy) {
    final copies = _tablets[item - 1];
    copies[copy] = !copies[copy];
  }

  void adjust(SupplyAction action, int item, int change) {
    final updated = (count(action, item) + change).clamp(0, capacity(action));
    switch (action) {
      case SupplyAction.tablet:
        final copies = _tablets[item - 1];
        final count = this.count(action, item);
        final restore = updated > count;
        var remaining = (updated - count).abs();
        for (var index = 0; index < copies.length && remaining > 0; index++) {
          if (copies[index] != restore) {
            copies[index] = restore;
            remaining--;
          }
        }
      case SupplyAction.potion:
        if (updated == 0) {
          _usedPotions.add(item);
        } else {
          _usedPotions.remove(item);
        }
      case SupplyAction.standingStone:
      case SupplyAction.runestone:
        _stones[action] = updated;
    }
  }

  List<int> availableItems(SupplyAction action, int turn) {
    final available = itemIds(action)
        .where((item) => count(action, item) > 0)
        .toList();
    if (action != SupplyAction.potion) return available;

    final firstCost = ((turn.clamp(1, 13) - 1) ~/ 4).clamp(0, 2) * 2 + 1;
    for (var cost = firstCost; cost <= 5; cost += 2) {
      final tier = available
          .where((item) => item ~/ 10 >= cost && item ~/ 10 <= cost + 1)
          .toList();
      if (tier.isNotEmpty) return tier;
    }
    return available;
  }

  List<int> draw(SupplyAction action, int turn, Random random) =>
      availableItems(action, turn)..shuffle(random);

  void consumeSelection(
    SupplyAction action,
    List<int> queue,
    int selectedIndex,
  ) {
    if (action != SupplyAction.potion) {
      adjust(action, queue[selectedIndex], -1);
      return;
    }
    for (final item in queue.take(selectedIndex + 1)) {
      adjust(action, item, -1);
    }
  }
}

String supplyAsset(SupplyAction action, int item) => switch (action) {
  SupplyAction.tablet =>
    "assets/tablets/tablet-${item.toString().padLeft(2, '0')}.png",
  SupplyAction.potion => 'assets/potions/postion-$item.png',
  SupplyAction.standingStone => 'assets/actions/erect-standing-stone.png',
  SupplyAction.runestone => 'assets/actions/erect-runestone.png',
};
