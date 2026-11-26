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
            _CardSection(title: l10n.targetLabel, body: card.target(l10n)),
            if (card == AutomaCard.connectDolmens)
              _CardSection(
                title: l10n.chosenDolmens,
                body: dolmenSetup == null
                    ? l10n.waitingForDolmens
                    : l10n.dolmenProgress(
                        dolmenSetup!.pair,
                        placedDolmenDice,
                        dolmenSetup!.requiredDice,
                      ),
              ),
            _CardSection(title: l10n.movementLabel, body: card.movement(l10n)),
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
            _CardSection(title: l10n.actionLabel, body: card.action(l10n)),
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
