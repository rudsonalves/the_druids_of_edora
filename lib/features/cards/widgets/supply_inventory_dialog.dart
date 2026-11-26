import 'package:material_ui/material_ui.dart';

import '../../../l10n/app_localizations.dart';
import '../action_supply.dart';
import 'supply_dialog.dart';

class SupplyInventoryDialog extends StatelessWidget {
  const SupplyInventoryDialog({
    super.key,
    required this.category,
    required this.supply,
    required this.onAdjust,
  });

  final SupplyAction category;
  final ActionSupply supply;
  final void Function(
    SupplyAction action,
    int item,
    int change, {
    int? tabletCopy,
  })
  onAdjust;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final title = switch (category) {
      SupplyAction.tablet => l10n.tabletInventory,
      SupplyAction.potion => l10n.potionInventory,
      _ => l10n.stoneInventory,
    };
    final columns = category == SupplyAction.potion ? 3 : 4;
    final copies = [
      for (final item in supply.itemIds(category))
        for (var copy = 0; copy < supply.capacity(category); copy++)
          (item: item, copy: copy),
    ];
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 360,
        child: StatefulBuilder(
          builder: (context, refresh) => ListView(
            shrinkWrap: true,
            children: [
              if (!category.isStone)
                for (var start = 0; start < copies.length; start += columns)
                  Row(
                    children: [
                      for (var column = 0; column < columns; column++)
                        Expanded(
                          child: start + column >= copies.length
                              ? const SizedBox.shrink()
                              : inventoryTile(
                                  l10n,
                                  copies[start + column],
                                  refresh,
                                ),
                        ),
                    ],
                  )
              else
                for (final action in [
                  SupplyAction.standingStone,
                  SupplyAction.runestone,
                ])
                  Row(
                    children: [
                      for (
                        var index = 0;
                        index < supply.capacity(action);
                        index++
                      )
                        Expanded(
                          child: IconButton(
                            tooltip: supplyActionLabel(l10n, action),
                            onPressed: null,
                            icon: Opacity(
                              opacity: index < supply.stoneCount(action)
                                  ? 1
                                  : 0.3,
                              child: Image.asset(
                                supplyAsset(action, 1),
                                height: 38,
                                excludeFromSemantics: true,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.closeInventory),
        ),
      ],
    );
  }

  Widget inventoryTile(
    AppLocalizations l10n,
    ({int item, int copy}) piece,
    StateSetter refresh,
  ) {
    final (item: item, copy: copy) = piece;
    final isTablet = category == SupplyAction.tablet;
    final available = isTablet
        ? supply.tabletCopyAvailable(item, copy)
        : supply.count(category, item) > 0;
    final label = isTablet
        ? l10n.tabletOption(item)
        : l10n.potionOption(item ~/ 10, item % 10);
    final action = available
        ? l10n.removeInventoryPiece
        : l10n.restoreInventoryPiece;
    return IconButton(
      tooltip: '$label · $action',
      onPressed: () => refresh(
        () => onAdjust(
          category,
          item,
          available ? -1 : 1,
          tabletCopy: isTablet ? copy : null,
        ),
      ),
      icon: Opacity(
        opacity: available ? 1 : 0.3,
        child: Image.asset(
          supplyAsset(category, item),
          height: 46,
          excludeFromSemantics: true,
        ),
      ),
    );
  }
}
