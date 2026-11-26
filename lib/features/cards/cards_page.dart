import '../../l10n/app_localizations.dart';

import 'dart:math';

import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform, kIsWeb;
import 'package:flutter/services.dart' show SystemNavigator;
import 'package:material_ui/material_ui.dart';

import '../setup/automata_color.dart';
import '../setup/widgets/die_face.dart';
import 'action_supply.dart';
import 'automa_card.dart';
import 'die_selector.dart';
import 'sickle_amulet.dart';
import 'widgets/amulet_dialog.dart';
import 'widgets/automa_instruction_card.dart';
import 'widgets/dolmen_setup_dialog.dart';
import 'widgets/supply_dialog.dart';
import 'widgets/shrine_action_dialog.dart';
import 'widgets/supply_inventory_dialog.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({
    super.key,
    required this.color,
    required this.form,
    required this.playerCount,
    required this.dice,
    required this.random,
  });

  final AutomataColor color;
  final AutomaForm form;
  final int playerCount;
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
  AutomaCard? executingShrineCard;
  ShrineAction? shrineAction;
  bool actionUnavailable = false;
  bool gameFinished = false;
  final dieActions = <int, ShrineActionOutcome>{};
  bool pendingShrineAction = false;
  AutomaCard? get actionCard => executingShrineCard ?? currentCard;
  final supply = ActionSupply();
  final sickleAmulet = SickleAmulet();
  bool usedSickle = false;
  int knowledge = 0;
  KnowledgeProvisionChoice? knowledgeChoice;
  int? placedGem;
  final supplyQueues = <SupplyAction, List<int>>{};
  ({SupplyAction action, int item})? supplySelection;
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

  bool get awaitingCardAction {
    if (executingShrineCard != null) return true;
    if (actionUnavailable) return false;
    return switch (currentCard) {
      AutomaCard.competition ||
      AutomaCard.connectDolmens ||
      AutomaCard.surroundFire => pendingShrineAction,
      AutomaCard.tabletMistletoe ||
      AutomaCard.standingStone => supplySelection == null,
      AutomaCard.sickleAmulet => !usedSickle && placedGem == null,
      AutomaCard.knowledgeProvision => knowledgeChoice == null,
      _ => false,
    };
  }

  bool get hasAvailableCardAction {
    final turn = widget.dice.length - availableDice.length;
    return switch (currentCard) {
      AutomaCard.tabletMistletoe =>
        supply.availableItems(SupplyAction.tablet, turn).isNotEmpty ||
            supply.availableItems(SupplyAction.potion, turn).isNotEmpty,
      AutomaCard.standingStone =>
        supply.stoneCount(SupplyAction.standingStone) > 0 ||
            supply.stoneCount(SupplyAction.runestone) > 0,
      _ => true,
    };
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
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(l10n.automataName),
          actions: [
            inventoryButton(
              SupplyAction.tablet,
              l10n.tabletInventory,
              'take-stone-tablet',
            ),
            inventoryButton(
              SupplyAction.potion,
              l10n.potionInventory,
              'take-and-use-mistletoe',
            ),
            inventoryButton(
              SupplyAction.standingStone,
              l10n.stoneInventory,
              'erect-standing-stone',
            ),
          ],
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
                    key: ValueKey('${card.name}-${deck.draws}'),
                    card: card,
                    actionResolved: !awaitingCardAction,
                    onShrineAction: pendingShrineAction
                        ? resolveShrineAction
                        : null,
                    dieActions: Map.unmodifiable(dieActions),
                    onSupplyAction: chooseSupply,
                    sickle: sickleAmulet.sickle,
                    usedSickle: usedSickle,
                    placedGem: placedGem,
                    onSickle: sickleAmulet.atLimit ? null : advanceSickle,
                    onAmulet: chooseAmulet,
                    knowledge: knowledge,
                    knowledgeChoice: knowledgeChoice,
                    onKnowledge: () => chooseKnowledgeProvision(
                      KnowledgeProvisionChoice.knowledge,
                    ),
                    onProvisions: () => chooseKnowledgeProvision(
                      KnowledgeProvisionChoice.provisions,
                    ),
                    supplySelection: supplySelection,
                    stoneCount: supply.stoneCount,
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
                      onPressed: awaitingCardAction
                          ? null
                          : availableDice.isEmpty
                          ? showGameSummary
                          : drawCard,
                      child: Text(
                        availableDice.isEmpty
                            ? (gameFinished
                                  ? l10n.viewGameSummary
                                  : l10n.finishGame)
                            : card == null
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
                        onPressed: awaitingCardAction
                            ? null
                            : finishPlayerConnection,
                        child: Text(
                          l10n.playerConnectedDolmens,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (awaitingCardAction && !hasAvailableCardAction)
                TextButton(
                  onPressed: () => setState(() => actionUnavailable = true),
                  child: Text(l10n.noAuxiliaryAction),
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
      ),
    );
  }

  Future<void> showGameSummary() async {
    if (awaitingCardAction || availableDice.isNotEmpty) return;
    if (!gameFinished) setState(() => gameFinished = true);

    final canExitApp =
        !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
    final restart = await showDialog<bool>(
      context: context,
      builder: (context) {
        final strings = AppLocalizations.of(context)!;
        final rows = [
          (
            strings.summaryDiceUsed,
            '${widget.dice.length - availableDice.length}/${widget.dice.length}',
          ),
          (strings.summaryDolmenPairs, '${connectedPairs.length}'),
          (
            strings.summaryTabletsRemoved,
            '${supply.unavailableCount(SupplyAction.tablet)}',
          ),
          (
            strings.summaryPotionsRemoved,
            '${supply.unavailableCount(SupplyAction.potion)}',
          ),
          (
            strings.summaryStandingStones,
            strings.stonesPlaced(
              supply.unavailableCount(SupplyAction.standingStone),
            ),
          ),
          (
            strings.summaryRunestones,
            strings.stonesPlaced(
              supply.unavailableCount(SupplyAction.runestone),
            ),
          ),
          (
            strings.summarySickle,
            '${sickleAmulet.sickle}/${SickleAmulet.maxSickle}',
          ),
          (
            strings.summaryKnowledge,
            '$knowledge/${AutomaInstructionCard.maxKnowledge}',
          ),
          (strings.summaryAmulet, '${sickleAmulet.gemsPlaced}/6'),
        ];
        return AlertDialog(
          title: Text(strings.gameSummaryTitle),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                for (final (label, value) in rows)
                  Row(
                    spacing: 12,
                    children: [
                      Expanded(child: Text(label)),
                      Text(
                        value,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                canExitApp ? strings.exitApp : strings.closeGameSummary,
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(strings.restartSetup),
            ),
          ],
        );
      },
    );
    if (!mounted) return;
    if (restart == true) {
      Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
    } else if (restart == false && canExitApp) {
      await SystemNavigator.pop();
    }
  }

  Widget inventoryButton(SupplyAction category, String label, String icon) {
    return IconButton(
      tooltip: label,
      icon: Image.asset('assets/actions/$icon.png', width: 28, height: 28),
      onPressed: gameFinished
          ? null
          : () => showDialog<void>(
              context: context,
              builder: (_) => SupplyInventoryDialog(
                category: category,
                supply: supply,
                onAdjust: (action, item, change, {tabletCopy}) {
                  setState(() {
                    if (tabletCopy == null) {
                      supply.adjust(action, item, change);
                    } else {
                      supply.toggleTabletCopy(item, tabletCopy);
                    }
                    final queue = supplyQueues[action];
                    if (queue == null) return;
                    final turn = widget.dice.length - availableDice.length;
                    final eligible = supply
                        .availableItems(action, turn)
                        .toSet();
                    queue.removeWhere((item) => !eligible.remove(item));
                    if (eligible.isNotEmpty) {
                      queue.addAll(eligible.toList()..shuffle(widget.random));
                    }
                  });
                },
              ),
            ),
    );
  }

  Future<void> drawCard() async {
    if (availableDice.isEmpty || awaitingCardAction) return;
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
      actionUnavailable = false;
      shrineAction = null;
      supplyQueues.clear();
      supplySelection = null;
      usedSickle = false;
      knowledgeChoice = null;
      placedGem = null;
      selectedDice.clear();
      dieActions.clear();
      dolmenSetup = null;
      placedDolmenDice = 0;
    });

    if (nextCard == AutomaCard.connectDolmens) {
      await configureDolmens();
    } else {
      consumeDie(nextCard);
    }
  }

  void chooseKnowledgeProvision(KnowledgeProvisionChoice choice) {
    if (actionCard != AutomaCard.knowledgeProvision ||
        knowledgeChoice != null ||
        (choice == KnowledgeProvisionChoice.knowledge &&
            knowledge >= AutomaInstructionCard.maxKnowledge)) {
      return;
    }
    setState(() {
      if (choice == KnowledgeProvisionChoice.knowledge) knowledge++;
      knowledgeChoice = choice;
    });
  }

  void advanceSickle() {
    if (usedSickle || placedGem != null) return;
    setState(() {
      sickleAmulet.advanceSickle();
      usedSickle = true;
    });
  }

  Future<void> chooseAmulet() async {
    if (usedSickle || placedGem != null) return;
    final slot = await showDialog<int>(
      context: context,
      builder: (_) => AmuletDialog(progress: sickleAmulet),
    );
    if (!mounted || actionCard != AutomaCard.sickleAmulet || slot == null) {
      return;
    }
    if (slot == -1) {
      advanceSickle();
    } else {
      setState(() {
        sickleAmulet.addGem(slot);
        placedGem = slot;
      });
    }
  }

  Future<void> chooseSupply(SupplyAction action) async {
    final expectedCard = action.isStone
        ? AutomaCard.standingStone
        : AutomaCard.tabletMistletoe;
    if (actionCard != expectedCard || supplySelection != null) {
      return;
    }
    final turn = widget.dice.length - availableDice.length;
    final queue = supplyQueues.putIfAbsent(
      action,
      () => supply.draw(action, turn, widget.random),
    );
    final selected = await showDialog<int>(
      context: context,
      builder: (_) => SupplyDialog(
        action: action,
        queue: queue,
        stoneCount: supply.stoneCount(action),
      ),
    );
    if (!mounted || selected == null) return;

    setState(() {
      supply.consumeSelection(action, queue, selected);
      supplySelection = (action: action, item: queue[selected]);
    });
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
    if (!connectionActive || awaitingCardAction) return;
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
      pendingShrineAction = card.usesShrineAction;
      if (pendingShrineAction) {
        shrineAction = null;
        supplyQueues.clear();
        supplySelection = null;
        usedSickle = false;
        knowledgeChoice = null;
        placedGem = null;
      }
      if (card == AutomaCard.connectDolmens) {
        final setup = dolmenSetup!;
        placedDolmenDice++;
        if (placedDolmenDice == setup.requiredDice) {
          connectedPairs.add(setup.pair);
        }
      }
    });
  }

  bool canExecuteShrineAction(ShrineAction action) {
    final resource = action.supply;
    if (resource != null) {
      final turn = widget.dice.length - availableDice.length;
      return supply.availableItems(resource, turn).isNotEmpty;
    }
    return switch (action) {
      ShrineAction.knowledge => knowledge < AutomaInstructionCard.maxKnowledge,
      ShrineAction.sickle => !sickleAmulet.atLimit,
      _ => true,
    };
  }

  Future<void> resolveShrineAction() async {
    if (!pendingShrineAction || executingShrineCard != null) return;
    final dieIndex = selectedDice.length - 1;

    if (shrineAction == null) {
      final result = await showDialog<ShrineActionResult>(
        context: context,
        builder: (_) => ShrineActionDialog(
          limit: widget.playerCount,
          random: widget.random,
          canExecute: canExecuteShrineAction,
        ),
      );
      if (!mounted || result == null) return;
      setState(() {
        shrineAction = result.action;
        if (result.action == null) pendingShrineAction = false;
      });
    }

    final action = shrineAction;
    if (action == null) return;
    setState(() => executingShrineCard = action.card);
    try {
      switch (action) {
        case ShrineAction.provisions:
          chooseKnowledgeProvision(KnowledgeProvisionChoice.provisions);
        case ShrineAction.knowledge:
          chooseKnowledgeProvision(KnowledgeProvisionChoice.knowledge);
        case ShrineAction.sickle:
          advanceSickle();
        case ShrineAction.amulet:
          await chooseAmulet();
          if (!mounted || (!usedSickle && placedGem == null)) return;
        default:
          await chooseSupply(action.supply!);
          if (!mounted || supplySelection == null) return;
      }
      setState(() {
        final resolved = usedSickle ? ShrineAction.sickle : action;
        final selection = supplySelection;
        dieActions[dieIndex] = ShrineActionOutcome(
          action: resolved,
          item: selection?.item,
          value: switch (resolved) {
            ShrineAction.knowledge => knowledge,
            ShrineAction.sickle => sickleAmulet.sickle,
            ShrineAction.amulet => placedGem,
            ShrineAction.standingStone || ShrineAction.runestone =>
              ActionSupply.stoneCapacity - supply.stoneCount(resolved.supply!),
            _ => null,
          },
        );
        pendingShrineAction = false;
        shrineAction = null;
      });
    } finally {
      if (mounted) setState(() => executingShrineCard = null);
    }
  }
}
