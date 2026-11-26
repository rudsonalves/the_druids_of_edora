import '../../../l10n/app_localizations.dart';

import 'package:material_ui/material_ui.dart';

import '../../setup/widgets/die_face.dart';
import '../automa_card.dart';
import '../automa_card_localization.dart';
import 'dolmen_setup_dialog.dart';

class AutomaInstructionCard extends StatelessWidget {
  const AutomaInstructionCard({
    super.key,
    required this.card,
    required this.selectedDice,
    required this.dieColor,
    required this.dolmenSetup,
    required this.placedDolmenDice,
  });

  final AutomaCard card;
  final List<int> selectedDice;
  final Color dieColor;
  final DolmenSetup? dolmenSetup;
  final int placedDolmenDice;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final distance = card.movementDistance;
    final actionIcons = switch (card) {
      AutomaCard.standingStone => ['erect-standing-stone', 'erect-runestone'],
      AutomaCard.tabletMistletoe => [
        'take-stone-tablet',
        'take-and-use-mistletoe',
      ],
      AutomaCard.knowledgeProvision => [
        'move-knowledge-marker-forward',
        'take-provision-or-die',
      ],
      AutomaCard.sickleAmulet => ['move-sickle-forward', 'add-gem-to-amulet'],
      _ => const <String>[],
    };
    final theme = Theme.of(context);
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
                          DieFace(
                            key: Key('selected-die-$index'),
                            value: selectedDice[index],
                            color: dieColor,
                            index: index + 1,
                            size: 48,
                          ),
                      ],
                    ),
            ),
            _CardSection(
              title: l10n.actionLabel,
              body: card.action(l10n),
              child: actionIcons.isEmpty
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
            ),
            if (card.tieBreak(l10n) case final String tieBreak)
              _CardSection(title: l10n.tieBreakLabel, body: tieBreak),
          ],
        ),
      ),
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
