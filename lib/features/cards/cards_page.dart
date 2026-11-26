import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../setup/automata_color.dart';
import '../setup/widgets/die_face.dart';
import 'automa_card.dart';
import 'die_selector.dart';
import 'widgets/automa_instruction_card.dart';
import 'widgets/dolmen_setup_dialog.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({
    super.key,
    required this.color,
    required this.dice,
    required this.random,
  });

  final AutomataColor color;
  final List<int> dice;
  final Random random;

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  late final AutomaDeck deck = AutomaDeck(widget.random);
  final ScrollController scrollController = ScrollController();
  late final List<int> availableDice = List.of(widget.dice)..sort();
  AutomaCard? currentCard;
  final List<int> selectedDice = [];
  DolmenSetup? dolmenSetup;
  int placedDolmenDice = 0;

  bool get isPortuguese => Localizations.localeOf(context).languageCode == 'pt';

  String label(String pt, String en) => isPortuguese ? pt : en;

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = currentCard;
    return Scaffold(
      appBar: AppBar(
        title: Text(label('Cartas do Malfurion', 'Malfurion cards')),
      ),
      body: SafeArea(
        child: ListView(
          controller: scrollController,
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            if (card == null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 56),
                child: Icon(
                  Icons.style_outlined,
                  size: 94,
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            else
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                child: AutomaInstructionCard(
                  key: ValueKey('${card.name}-${deck.drawnInCycle}'),
                  card: card,
                  selectedDice: List.unmodifiable(selectedDice),
                  dieColor: widget.color.value,
                  isPortuguese: isPortuguese,
                  dolmenSetup: dolmenSetup,
                  placedDolmenDice: placedDolmenDice,
                ),
              ),
            if (card != null &&
                deck.remaining == 0 &&
                (card != AutomaCard.connectDolmens ||
                    placedDolmenDice == dolmenSetup?.requiredDice)) ...[
              const SizedBox(height: 10),
              Text(
                label(
                  'Na próxima solicitação, o baralho será embaralhado novamente.',
                  'The deck will be shuffled again on the next draw.',
                ),
              ),
            ],
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: availableDice.isEmpty ? null : drawCard,
                icon: const Icon(Icons.style),
                label: Text(
                  card == null
                      ? label('Sortear carta', 'Draw card')
                      : card == AutomaCard.connectDolmens && dolmenSetup == null
                      ? label('Definir dolmens', 'Set dolmens')
                      : card == AutomaCard.connectDolmens &&
                            placedDolmenDice < dolmenSetup!.requiredDice
                      ? label('Colocar próximo dado', 'Place next die')
                      : label('Próxima carta', 'Next card'),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label(
                'Dados disponíveis: ${availableDice.length}',
                'Available dice: ${availableDice.length}',
              ),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            if (availableDice.isEmpty)
              Text(
                label(
                  'Todos os dados foram usados.',
                  'All dice have been used.',
                ),
              ),
            const SizedBox(height: 6),
            SizedBox(
              height: 40,
              child: ListView.separated(
                key: const Key('dice-strip'),
                scrollDirection: Axis.horizontal,
                itemCount: availableDice.length,
                separatorBuilder: (_, _) => const SizedBox(width: 5),
                itemBuilder: (context, index) => DieFace(
                  value: availableDice[index],
                  color: widget.color.value,
                  index: index + 1,
                  isPortuguese: isPortuguese,
                  size: 36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> drawCard() async {
    if (availableDice.isEmpty) return;
    if (scrollController.hasClients) scrollController.jumpTo(0);

    if (currentCard == AutomaCard.connectDolmens) {
      if (dolmenSetup == null) {
        await configureDolmens();
        return;
      }
      if (placedDolmenDice < dolmenSetup!.requiredDice) {
        consumeDie(AutomaCard.connectDolmens);
        return;
      }
    }

    final nextCard = deck.draw();
    setState(() {
      currentCard = nextCard;
      selectedDice.clear();
      dolmenSetup = null;
      placedDolmenDice = 0;
    });

    if (nextCard == AutomaCard.connectDolmens) {
      await configureDolmens();
    } else {
      consumeDie(nextCard);
    }
  }

  Future<void> configureDolmens() async {
    final setup = await showDialog<DolmenSetup>(
      context: context,
      builder: (context) => DolmenSetupDialog(
        isPortuguese: isPortuguese,
        maxDice: availableDice.length.clamp(1, 4),
      ),
    );
    if (!mounted || setup == null) return;

    setState(() => dolmenSetup = setup);
    consumeDie(AutomaCard.connectDolmens);
  }

  void consumeDie(AutomaCard card) {
    setState(() {
      final selectedDie = DieSelector.select(
        card,
        availableDice,
        widget.random,
      );
      availableDice.remove(selectedDie);
      selectedDice.add(selectedDie);
      if (card == AutomaCard.connectDolmens) placedDolmenDice++;
    });
  }
}
