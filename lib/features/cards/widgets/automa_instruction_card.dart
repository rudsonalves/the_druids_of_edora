import '../../../l10n/app_localizations.dart';

import 'package:material_ui/material_ui.dart';

import '../../setup/widgets/die_face.dart';
import '../action_supply.dart';
import '../automa_card.dart';
import '../automa_card_localization.dart';
import '../sickle_amulet.dart';
import 'dolmen_setup_dialog.dart';
import 'supply_dialog.dart';
import 'shrine_action_dialog.dart';

class AutomaInstructionCard extends StatelessWidget {
  const AutomaInstructionCard({
    super.key,
    required this.card,
    required this.selectedDice,
    required this.dieColor,
    required this.dolmenSetup,
    required this.placedDolmenDice,
    this.onSupplyAction,
    this.supplySelection,
    this.stoneCount,
    this.sickle = 0,
    this.usedSickle = false,
    this.placedGem,
    this.onSickle,
    this.onAmulet,
    this.knowledge = 0,
    this.onKnowledge,
    this.onProvisions,
    this.knowledgeChoice,
    this.onShrineAction,
    this.dieActions = const {},
  });

  final AutomaCard card;
  final List<int> selectedDice;
  final Color dieColor;
  final DolmenSetup? dolmenSetup;
  final int placedDolmenDice;
  final ValueChanged<SupplyAction>? onSupplyAction;
  final ({SupplyAction action, int item})? supplySelection;
  final int Function(SupplyAction)? stoneCount;
  final int sickle;
  final bool usedSickle;
  final int? placedGem;
  final VoidCallback? onSickle;
  final VoidCallback? onAmulet;
  static const maxKnowledge = 12;
  final int knowledge;
  final VoidCallback? onKnowledge;
  final VoidCallback? onProvisions;
  final KnowledgeProvisionChoice? knowledgeChoice;
  final VoidCallback? onShrineAction;
  final Map<int, ShrineActionOutcome> dieActions;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final distance = card.movementDistance;
    final supplyActions = switch (card) {
      AutomaCard.standingStone => [
        SupplyAction.standingStone,
        SupplyAction.runestone,
      ],
      AutomaCard.tabletMistletoe => [SupplyAction.tablet, SupplyAction.potion],
      _ => const <SupplyAction>[],
    };
    final actionIcons = switch (card) {
      AutomaCard.standingStone => ['erect-standing-stone', 'erect-runestone'],
      AutomaCard.tabletMistletoe => [
        'take-stone-tablet',
        'take-and-use-mistletoe',
      ],
      _ => const <String>[],
    };
    final theme = Theme.of(context);
    final actionSection = _CardSection(
      title: l10n.actionLabel,
      body: card.action(l10n),
      child: onShrineAction != null
          ? IconButton.outlined(
              tooltip: l10n.executeShrineAction,
              onPressed: onShrineAction,
              icon: Image.asset(
                'assets/actions/any-action.png',
                width: 48,
                height: 48,
                excludeFromSemantics: true,
              ),
            )
          : card == AutomaCard.sickleAmulet
          ? _buildSickleAmulet(l10n)
          : card == AutomaCard.knowledgeProvision
          ? _buildKnowledgeProvision(l10n)
          : supplyActions.isNotEmpty
          ? _buildSupplyActions(l10n, supplyActions, actionIcons)
          : actionIcons.isEmpty
          ? null
          : Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final icon in actionIcons)
                  Image.asset(
                    'assets/actions/$icon.png',
                    width: 48,
                    height: 48,
                    excludeFromSemantics: true,
                  ),
              ],
            ),
    );
    return Card(
      color: const Color(0xFF214537),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFF9B814C)),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8,
              children: [
                Icon(
                  Icons.auto_awesome,
                  color: theme.colorScheme.primary,
                  size: 30,
                ),
                Expanded(
                  child: Text(
                    card.title(l10n),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            if (card != AutomaCard.connectDolmens)
              _CardSection(title: l10n.targetLabel, body: card.target(l10n))
            else if (dolmenSetup == null)
              _CardSection(
                title: l10n.chosenDolmens,
                body: l10n.waitingForDolmens,
              )
            else ...[
              if (placedDolmenDice < dolmenSetup!.requiredDice)
                Text(
                  l10n.connectingDolmens,
                  style: theme.textTheme.titleMedium,
                ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  dolmenSetup!.pair.asset,
                  height: 64,
                  semanticLabel: dolmenSetup!.pair.label(l10n),
                ),
              ),
              const SizedBox(height: 8),
              Text(l10n.chosenDolmens, style: theme.textTheme.titleMedium),
              Text(
                l10n.dolmenProgress(
                  placedDolmenDice,
                  dolmenSetup!.requiredDice,
                ),
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: 16),
            ],
            _CardSection(
              title: l10n.movementLabel,
              body: card.movement(l10n),
              showBody: distance == null,
              child: distance == null
                  ? null
                  : Tooltip(
                      message: card.movement(l10n),
                      child: ExcludeSemantics(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 6,
                          children: [
                            if (l10n.localeName.startsWith('pt'))
                              Text(l10n.movementMaximum),
                            Stack(
                              alignment: const Alignment(0, 0.35),
                              children: [
                                Image.asset(
                                  'assets/icons/bag.png',
                                  width: 48,
                                  height: 48,
                                ),
                                Text(
                                  '$distance',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            if (!l10n.localeName.startsWith('pt'))
                              Text(l10n.movementMaximum),
                          ],
                        ),
                      ),
                    ),
            ),
            _CardSection(
              title: l10n.dieLabel,
              showBody: false,
              body: card.die(l10n),
              child: selectedDice.isEmpty
                  ? null
                  : Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (
                          var index = 0;
                          index < selectedDice.length;
                          index++
                        )
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 4,
                            children: [
                              DieFace(
                                key: Key('selected-die-$index'),
                                value: selectedDice[index],
                                color: dieColor,
                                index: index + 1,
                                size: 48,
                              ),
                              if (dieActions[index] case final outcome?)
                                _buildShrineOutcome(l10n, outcome),
                            ],
                          ),
                      ],
                    ),
            ),
            actionSection,
          ],
        ),
      ),
    );
  }

  Widget _buildShrineOutcome(
    AppLocalizations l10n,
    ShrineActionOutcome outcome,
  ) {
    final action = outcome.action;
    final value = outcome.value;
    final item = outcome.item;
    final detail = value == null
        ? null
        : switch (action) {
            ShrineAction.knowledge => l10n.knowledgeProgress(
              value,
              maxKnowledge,
            ),
            ShrineAction.sickle => l10n.sickleProgress(value),
            ShrineAction.amulet => SickleAmulet.slotName(value),
            ShrineAction.standingStone ||
            ShrineAction.runestone => l10n.stonesAvailable(value),
            _ => null,
          };
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 4,
          children: [
            Image.asset(
              'assets/actions/${action.icon}.png',
              width: 32,
              height: 32,
              semanticLabel: action.label(l10n),
            ),
            if (item != null &&
                (action == ShrineAction.tablet ||
                    action == ShrineAction.potion))
              Image.asset(
                supplyAsset(action.supply!, item),
                height: 32,
                semanticLabel: action == ShrineAction.tablet
                    ? l10n.tabletOption(item)
                    : l10n.potionOption(item ~/ 10, item % 10),
              ),
          ],
        ),
        if (detail != null) Text(detail),
      ],
    );
  }

  Widget _buildKnowledgeProvision(AppLocalizations l10n) {
    final choice = knowledgeChoice;
    final knowledgeIcon = Image.asset(
      'assets/actions/move-knowledge-marker-forward.png',
      width: 48,
      height: 48,
      excludeFromSemantics: true,
    );
    final provisionsIcon = Image.asset(
      'assets/actions/take-provision-or-die.png',
      width: 48,
      height: 48,
      excludeFromSemantics: true,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(l10n.knowledgeProgress(knowledge, maxKnowledge)),
        if (choice == null) ...[
          Text(l10n.chooseSupplyAction),
          Wrap(
            spacing: 8,
            children: [
              IconButton.outlined(
                tooltip: l10n.advanceKnowledge,
                onPressed: knowledge < maxKnowledge ? onKnowledge : null,
                icon: knowledgeIcon,
              ),
              IconButton.outlined(
                tooltip: l10n.chooseProvisions,
                onPressed: onProvisions,
                icon: provisionsIcon,
              ),
            ],
          ),
        ] else
          Semantics(
            label: choice == KnowledgeProvisionChoice.knowledge
                ? l10n.advanceKnowledge
                : l10n.chooseProvisions,
            child: choice == KnowledgeProvisionChoice.knowledge
                ? knowledgeIcon
                : provisionsIcon,
          ),
      ],
    );
  }

  Widget _buildSickleAmulet(AppLocalizations l10n) {
    final slot = placedGem;
    final sickleIcon = Image.asset(
      'assets/actions/move-sickle-forward.png',
      width: 48,
      height: 48,
      excludeFromSemantics: true,
    );
    final amuletIcon = Image.asset(
      'assets/actions/add-gem-to-amulet.png',
      width: 48,
      height: 48,
      excludeFromSemantics: true,
    );
    final sickleProgress = l10n.sickleProgress(sickle);
    if (usedSickle || slot != null) {
      return Wrap(
        spacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (usedSickle) sickleIcon else amuletIcon,
          Text(usedSickle ? sickleProgress : SickleAmulet.slotName(slot!)),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(sickleProgress),
        Text(onSickle == null ? l10n.sickleLimitHelp : l10n.chooseSupplyAction),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            IconButton.outlined(
              tooltip: l10n.advanceSickle,
              onPressed: onSickle,
              icon: sickleIcon,
            ),
            IconButton.outlined(
              tooltip: l10n.chooseAmulet,
              onPressed: onAmulet,
              icon: amuletIcon,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSupplyActions(
    AppLocalizations l10n,
    List<SupplyAction> actions,
    List<String> icons,
  ) {
    final selection = supplySelection;
    if (selection != null) {
      final isTablet = selection.action == SupplyAction.tablet;
      return Wrap(
        spacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Image.asset(
            'assets/actions/${icons[actions.indexOf(selection.action)]}.png',
            width: 48,
            height: 48,
            semanticLabel: supplyActionLabel(l10n, selection.action),
          ),
          if (selection.action.isStone)
            Text(l10n.stonesAvailable(stoneCount?.call(selection.action) ?? 0))
          else
            Image.asset(
              supplyAsset(selection.action, selection.item),
              height: 64,
              semanticLabel: isTablet
                  ? l10n.tabletOption(selection.item)
                  : l10n.potionOption(
                      selection.item ~/ 10,
                      selection.item % 10,
                    ),
            ),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.chooseSupplyAction),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final (index, action) in actions.indexed)
              IconButton.outlined(
                tooltip: supplyActionLabel(l10n, action),
                onPressed:
                    onSupplyAction == null ||
                        (action.isStone && (stoneCount?.call(action) ?? 0) == 0)
                    ? null
                    : () => onSupplyAction!(action),
                icon: Image.asset(
                  'assets/actions/${icons[index]}.png',
                  width: 48,
                  height: 48,
                  excludeFromSemantics: true,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _CardSection extends StatelessWidget {
  const _CardSection({
    required this.title,
    required this.body,
    this.child,
    this.showBody = true,
  });

  final String title;
  final String body;
  final Widget? child;
  final bool showBody;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium
                ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 4),
          if (showBody) Text(body),
          if (child != null) ...[const SizedBox(height: 10), child!],
        ],
      ),
    );
  }
}
