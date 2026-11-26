import 'package:material_ui/material_ui.dart';

import '../../../l10n/app_localizations.dart';
import '../action_supply.dart';

class SupplyDialog extends StatefulWidget {
  const SupplyDialog({
    super.key,
    required this.action,
    required this.queue,
    this.stoneCount = 0,
  });

  final SupplyAction action;
  final List<int> queue;
  final int stoneCount;

  @override
  State<SupplyDialog> createState() => _SupplyDialogState();
}

class _SupplyDialogState extends State<SupplyDialog> {
  int? selectedIndex;

  bool willBeConsumed(int index) {
    final selected = selectedIndex;
    if (selected == null) return false;
    return widget.action == SupplyAction.potion
        ? index <= selected
        : index == selected;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final action = widget.action;
    if (action.isStone) {
      return AlertDialog(
        title: Text(supplyActionLabel(l10n, action)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(supplyAsset(action, 1), height: 64),
            const SizedBox(height: 12),
            Text(
              l10n.stonesPlaced(ActionSupply.stoneCapacity - widget.stoneCount),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          FilledButton(
            onPressed: widget.queue.isEmpty
                ? null
                : () => Navigator.pop(context, 0),
            child: Text(l10n.confirm),
          ),
        ],
      );
    }
    final tablets = action == SupplyAction.tablet;
    return AlertDialog(
      title: Text(tablets ? l10n.chooseTablet : l10n.choosePotion),
      content: SizedBox(
        width: 340,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.queue.isEmpty
                    ? l10n.noSupplyAvailable
                    : tablets
                    ? l10n.tabletQueueHelp
                    : l10n.potionQueueHelp,
              ),
              if (widget.queue.isNotEmpty) const SizedBox(height: 12),
              for (final (index, item) in widget.queue.indexed)
                ListTile(
                  selected: willBeConsumed(index),
                  leading: Text('${index + 1}.'),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Opacity(
                      opacity: willBeConsumed(index) ? 0.3 : 1,
                      child: Image.asset(
                        supplyAsset(widget.action, item),
                        height: 48,
                        semanticLabel: tablets
                            ? l10n.tabletOption(item)
                            : l10n.potionOption(item ~/ 10, item % 10),
                      ),
                    ),
                  ),
                  onTap: () => setState(() {
                    selectedIndex = selectedIndex == index ? null : index;
                  }),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
        if (widget.queue.isNotEmpty)
          FilledButton(
            onPressed: selectedIndex == null
                ? null
                : () => Navigator.pop(context, selectedIndex),
            child: Text(l10n.confirm),
          ),
      ],
    );
  }
}

String supplyActionLabel(AppLocalizations l10n, SupplyAction action) =>
    switch (action) {
      SupplyAction.tablet => l10n.chooseTablet,
      SupplyAction.potion => l10n.choosePotion,
      SupplyAction.standingStone => l10n.chooseStandingStone,
      SupplyAction.runestone => l10n.chooseRunestone,
    };
