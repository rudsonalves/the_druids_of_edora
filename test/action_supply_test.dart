import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_druids_of_edora/features/cards/action_supply.dart';

void main() {
  test('toggling a tablet copy preserves the other copy', () {
    final supply = ActionSupply();
    supply.toggleTabletCopy(1, 0);
    expect(supply.tabletCopyAvailable(1, 0), isFalse);
    expect(supply.tabletCopyAvailable(1, 1), isTrue);
    expect(supply.count(SupplyAction.tablet, 1), 1);
    supply.toggleTabletCopy(1, 0);
    expect(supply.count(SupplyAction.tablet, 1), 2);
  });

  test('tablet types leave the queue only after both copies are used', () {
    final supply = ActionSupply();
    const action = SupplyAction.tablet;
    final queue = supply.draw(action, 1, Random(7));
    expect(queue, hasLength(15));

    supply.consumeSelection(action, queue, 2);
    expect(supply.draw(action, 2, Random(7)), unorderedEquals(queue));
    expect(supply.count(action, queue[2]), 1);
    expect(supply.count(action, queue[0]), 2);
    expect(supply.count(action, queue[1]), 2);

    supply.consumeSelection(action, queue, 2);
    expect(
      supply.draw(action, 3, Random(7)),
      unorderedEquals(queue.where((item) => item != queue[2])),
    );
  });

  test('potion queues follow turn ranges and remove the selected prefix', () {
    final supply = ActionSupply();
    const action = SupplyAction.potion;
    final queue = supply.draw(action, 1, Random(7));
    expect(queue, unorderedEquals([11, 12, 13, 21, 22, 23]));

    supply.consumeSelection(action, queue, 1);
    expect(supply.draw(action, 4, Random(7)), unorderedEquals(queue.skip(2)));
    for (final turn in [5, 8]) {
      expect(
        supply.draw(action, turn, Random(7)),
        unorderedEquals([31, 32, 33, 41, 42, 43]),
      );
    }
    for (final turn in [9, 13]) {
      expect(
        supply.draw(action, turn, Random(7)),
        unorderedEquals([51, 52, 53, 61, 62, 63]),
      );
    }
  });

  test('empty potion tiers advance and then fall back to all remaining', () {
    final supply = ActionSupply();
    const potion = SupplyAction.potion;

    for (final item in supply.availableItems(potion, 2)) {
      supply.adjust(potion, item, -1);
    }
    final middle = supply.availableItems(potion, 2);
    expect(middle, [31, 32, 33, 41, 42, 43]);

    for (final item in middle) {
      supply.adjust(potion, item, -1);
    }
    final last = supply.availableItems(potion, 2);
    expect(last, [51, 52, 53, 61, 62, 63]);

    for (final item in last) {
      supply.adjust(potion, item, -1);
    }
    expect(supply.availableItems(potion, 13), isEmpty);
    supply.adjust(potion, 11, 1);
    supply.adjust(potion, 43, 1);
    expect(supply.availableItems(potion, 13), [11, 43]);
  });

  test('standing stones and runestones have independent stocks of six', () {
    final supply = ActionSupply();
    const standing = SupplyAction.standingStone;
    const rune = SupplyAction.runestone;
    expect(supply.stoneCount(standing), 6);
    expect(supply.stoneCount(rune), 6);
    for (var i = 0; i < 6; i++) {
      final queue = supply.draw(standing, 1, Random(7));
      expect(queue, hasLength(1));
      supply.consumeSelection(standing, queue, 0);
    }
    expect(supply.draw(standing, 1, Random(7)), isEmpty);
    expect(supply.stoneCount(rune), 6);
  });
}
