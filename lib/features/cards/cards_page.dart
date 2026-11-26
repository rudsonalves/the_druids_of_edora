import '../../l10n/app_localizations.dart';

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
    required this.form,
    required this.dice,
    required this.random,
  });

  final AutomataColor color;
  final AutomaForm form;
  final List<int> dice;
  final Random random;

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  late final AutomaDeck deck = AutomaDeck(widget.random, form: widget.form);
  final ScrollController scrollController = ScrollController();
  late final List<int> availableDice = List.of(widget.dice)..sort();
  AutomaCard? currentCard;
  final List<int> selectedDice = [];
  DolmenSetup? dolmenSetup;
  int placedDolmenDice = 0;
  final Set<DolmenPair> connectedPairs = {};

  List<DolmenPair> get availablePairs => DolmenPair.values
      .where((pair) => !connectedPairs.contains(pair))
      .toList();

  bool get connectionActive {
    final setup = dolmenSetup;
    return setup != null && !connectedPairs.contains(setup.pair);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final card = currentCard;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.malfurionCards)),
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
                  key: ValueKey('${card.name}-${deck.draws}'),
                  card: card,
                  selectedDice: List.unmodifiable(selectedDice),
                  dieColor: widget.color.value,
                  dolmenSetup: dolmenSetup,
                  placedDolmenDice: placedDolmenDice,
                ),
              ),
            if (card != null &&
                deck.needsShuffle(
                  hasAvailablePairs: availablePairs.isNotEmpty,
                ) &&
                (card != AutomaCard.connectDolmens ||
                    dolmenSetup != null && !connectionActive)) ...[
              const SizedBox(height: 10),
              Text(l10n.reshuffleDeck),
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
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: availableDice.isEmpty ? null : drawCard,
                    child: Text(
                      card == null
                          ? l10n.drawCard
                          : card == AutomaCard.connectDolmens &&
                                dolmenSetup == null
                          ? l10n.setDolmens
                          : connectionActive
                          ? l10n.placeNextDie
                          : l10n.nextCard,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (connectionActive) ...[
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: finishPlayerConnection,
                      child: Text(
                        l10n.playerConnectedDolmens,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 8),
            Text(
              l10n.availableDice(availableDice.length),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            if (availableDice.isEmpty) Text(l10n.allDiceUsed),
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
      if (connectionActive) {
        consumeDie(AutomaCard.connectDolmens);
        return;
      }
    }

    final nextCard = deck.draw(hasAvailablePairs: availablePairs.isNotEmpty);
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
        maxDice: availableDice.length.clamp(1, 4),
        pairs: availablePairs,
      ),
    );
    if (!mounted || setup == null) return;

    setState(() => dolmenSetup = setup);
    consumeDie(AutomaCard.connectDolmens);
  }

  Future<void> finishPlayerConnection() async {
    if (!connectionActive) return;
    setState(() => connectedPairs.add(dolmenSetup!.pair));
    await drawCard();
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
      if (card == AutomaCard.connectDolmens) {
        final setup = dolmenSetup!;
        placedDolmenDice++;
        if (placedDolmenDice == setup.requiredDice) {
          connectedPairs.add(setup.pair);
        }
      }
    });
  }
}
