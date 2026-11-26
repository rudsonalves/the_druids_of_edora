import 'package:material_ui/material_ui.dart';

import '../../setup/widgets/die_face.dart';
import '../automa_card.dart';
import 'dolmen_setup_dialog.dart';

class AutomaInstructionCard extends StatelessWidget {
  const AutomaInstructionCard({
    super.key,
    required this.card,
    required this.selectedDice,
    required this.dieColor,
    required this.isPortuguese,
    required this.dolmenSetup,
    required this.placedDolmenDice,
  });

  final AutomaCard card;
  final List<int> selectedDice;
  final Color dieColor;
  final bool isPortuguese;
  final DolmenSetup? dolmenSetup;
  final int placedDolmenDice;

  @override
  Widget build(BuildContext context) {
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
                    card.title(isPortuguese),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
            _CardSection(
              title: isPortuguese ? 'Alvo' : 'Target',
              body: card.target(isPortuguese),
            ),
            if (card == AutomaCard.connectDolmens)
              _CardSection(
                title: isPortuguese ? 'Dolmens escolhidos' : 'Chosen dolmens',
                body: dolmenSetup == null
                    ? (isPortuguese
                          ? 'Aguardando a definição do par e da quantidade de dados.'
                          : 'Waiting for the pair and die count to be set.')
                    : '${dolmenSetup!.pair} • $placedDolmenDice/${dolmenSetup!.requiredDice}',
              ),
            _CardSection(
              title: isPortuguese ? 'Movimento' : 'Movement',
              body: card.movement(isPortuguese),
            ),
            _CardSection(
              title: isPortuguese ? 'Dado' : 'Die',
              body: card.die(isPortuguese),
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
                            isPortuguese: isPortuguese,
                            size: 48,
                          ),
                      ],
                    ),
            ),
            _CardSection(
              title: isPortuguese ? 'Ação' : 'Action',
              body: card.action(isPortuguese),
            ),
            if (card.tieBreak(isPortuguese) case final String tieBreak)
              _CardSection(
                title: isPortuguese ? 'Desempate' : 'Tie break',
                body: tieBreak,
              ),
          ],
        ),
      ),
    );
  }
}

class _CardSection extends StatelessWidget {
  const _CardSection({required this.title, required this.body, this.child});

  final String title;
  final String body;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final bool isDice = title == 'Dice' || title == 'Dado';

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
          if (!isDice) Text(body),
          if (child != null) ...[const SizedBox(height: 10), child!],
        ],
      ),
    );
  }
}
