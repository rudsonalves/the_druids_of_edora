import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../../l10n/app_localizations.dart';
import '../action_supply.dart';
import '../automa_card.dart';
import 'supply_dialog.dart';

enum ShrineAction {
  provisions('take-provision-or-die', AutomaCard.knowledgeProvision),
  knowledge('move-knowledge-marker-forward', AutomaCard.knowledgeProvision),
  sickle('move-sickle-forward', AutomaCard.sickleAmulet),
  tablet('take-stone-tablet', AutomaCard.tabletMistletoe, SupplyAction.tablet),
  potion(
    'take-and-use-mistletoe',
    AutomaCard.tabletMistletoe,
    SupplyAction.potion,
  ),
  amulet('add-gem-to-amulet', AutomaCard.sickleAmulet),
  standingStone(
    'erect-standing-stone',
    AutomaCard.standingStone,
    SupplyAction.standingStone,
  ),
  runestone(
    'erect-runestone',
    AutomaCard.standingStone,
    SupplyAction.runestone,
  );

  const ShrineAction(this.icon, this.card, [this.supply]);

  final String icon;
  final AutomaCard card;
  final SupplyAction? supply;

  String label(AppLocalizations l10n) => switch (this) {
    provisions => l10n.chooseProvisions,
    knowledge => l10n.advanceKnowledge,
    sickle => l10n.advanceSickle,
    amulet => l10n.chooseAmulet,
    _ => supplyActionLabel(l10n, supply!),
  };
}

class ShrineActionDialog extends StatefulWidget {
  const ShrineActionDialog({
    super.key,
    required this.limit,
    required this.random,
    required this.canExecute,
  });

  final int limit;
  final Random random;
  final bool Function(ShrineAction) canExecute;

  @override
  State<ShrineActionDialog> createState() => _ShrineActionDialogState();
}

class _ShrineActionDialogState extends State<ShrineActionDialog> {
  final selected = <ShrineAction>{};

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.shrineActionTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 12,
          children: [
            Text(l10n.shrineActionHelp(widget.limit)),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final action in ShrineAction.values)
                  FilterChip(
                    tooltip: action.label(l10n),
                    selected: selected.contains(action),
                    onSelected:
                        !widget.canExecute(action) ||
                            (selected.length >= widget.limit &&
                                !selected.contains(action))
                        ? null
                        : (enabled) => setState(() {
                            if (enabled) {
                              selected.add(action);
                            } else {
                              selected.remove(action);
                            }
                          }),
                    label: Opacity(
                      opacity: selected.contains(action) ? 1 : 0.35,
                      child: Image.asset(
                        'assets/actions/${action.icon}.png',
                        height: 40,
                        width: 40,
                        semanticLabel: action.label(l10n),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: selected.isEmpty
              ? () => Navigator.pop(context, const ShrineActionResult())
              : null,
          child: Text(l10n.noAuxiliaryAction),
        ),
        FilledButton(
          onPressed: selected.isEmpty
              ? null
              : () => Navigator.pop(
                  context,
                  ShrineActionResult(
                    selected.elementAt(widget.random.nextInt(selected.length)),
                  ),
                ),
          child: Text(l10n.drawShrineAction),
        ),
      ],
    );
  }
}

class ShrineActionResult {
  const ShrineActionResult([this.action]);

  final ShrineAction? action;
}

class ShrineActionOutcome {
  const ShrineActionOutcome({required this.action, this.item, this.value});

  final ShrineAction action;
  final int? item;
  final int? value;
}
