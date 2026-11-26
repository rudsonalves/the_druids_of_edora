// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get automataName => 'Automata';

  @override
  String get automataCards => 'Automata’s cards';

  @override
  String get reshuffleDeck =>
      'The deck will be shuffled again on the next draw.';

  @override
  String get drawCard => 'Draw card';

  @override
  String get setDolmens => 'Set dolmens';

  @override
  String get placeNextDie => 'Place die';

  @override
  String get nextCard => 'Next card';

  @override
  String availableDice(int count) {
    return 'Available dice: $count';
  }

  @override
  String get allDiceUsed => 'All dice have been used.';

  @override
  String get connectDolmensTitle => 'Connect 2 dolmens';

  @override
  String get dolmenInstructions =>
      'Choose the dolmen pair and how many dice still need to be placed.';

  @override
  String get dolmenPair => 'Dolmen pair';

  @override
  String get requiredDice => 'Dice needed';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get targetLabel => 'Target';

  @override
  String get chosenDolmens => 'Dolmens';

  @override
  String get connectingDolmens => 'Connecting the two dolmens';

  @override
  String get waitingForDolmens =>
      'Waiting for the pair and die count to be set.';

  @override
  String get movementMaximum => 'max.';

  @override
  String get movementLabel => 'Movement';

  @override
  String get dieLabel => 'Die';

  @override
  String get actionLabel => 'Action';

  @override
  String get tieBreakLabel => 'Tie break';

  @override
  String dolmenProgress(int placed, int required) {
    return '$placed/$required';
  }

  @override
  String get purple => 'Purple';

  @override
  String get yellow => 'Yellow';

  @override
  String get mint => 'Mint';

  @override
  String get red => 'Red';

  @override
  String get language => 'Language';

  @override
  String get prepareAutomata => 'Prepare Automata';

  @override
  String get unofficialSetup => 'Unofficial automa • initial setup';

  @override
  String get chooseColor => '1. Choose the automa color';

  @override
  String get prepareComponents => '2. Prepare the components';

  @override
  String get playerCount =>
      'Set up the game for 2, 3, or 4 players according to the number of automated opponents.';

  @override
  String get setupPieces =>
      'Take all 13 dice, the druid pawn, knowledge marker, 6 standing stones, and 6 runestones in the chosen color.';

  @override
  String get unusedPieces =>
      'Automata uses no provisions, player board, tablets, amulet, or potions.';

  @override
  String get startingShrine =>
      'You play last: choose your starting shrine first. Then randomly choose a starting shrine for Automata.';

  @override
  String get restartSetup => 'Restart';

  @override
  String get rollDice => 'Roll dice';

  @override
  String dieSemantics(int index, int value) {
    return 'Die $index: $value';
  }

  @override
  String get automataDice => 'Automata’s dice';

  @override
  String get rollingDice => 'Rolling 13 dice…';

  @override
  String get sortedDice => '13 dice sorted from lowest to highest.';

  @override
  String get automaticDice =>
      'These dice will be used automatically by the cards during the game.';

  @override
  String get continueToCards => 'Start game';

  @override
  String get cardCompetitionTitle => 'Competition';

  @override
  String get cardSurroundFireTitle => 'Surround a fire';

  @override
  String get cardStandingStoneTitle => 'Standing stone or runestone';

  @override
  String get cardSickleAmuletTitle => 'Sickle or amulet';

  @override
  String get cardTabletMistletoeTitle => 'Tablet or mistletoe';

  @override
  String get cardKnowledgeProvisionTitle => 'Knowledge or provisions';

  @override
  String get cardCompetitionTarget =>
      'The nearest shrine with a die weaker than Automata’s strongest die.';

  @override
  String get cardConnectDolmensTarget =>
      'If Automata is connected to a dolmen and fewer than 5 shrines remain to reach its matching dolmen, target that dolmen. Otherwise, draw another card.';

  @override
  String get cardSurroundFireTarget =>
      'A fire needing just one more of Automata’s shrines, reachable for 6 provisions or less. Otherwise, draw another card.';

  @override
  String get cardStandingStoneTarget =>
      'The nearest shrine with a standing stone or runestone action.';

  @override
  String get cardSickleAmuletTarget =>
      'The nearest shrine with a sickle or amulet action.';

  @override
  String get cardTabletMistletoeTarget =>
      'The nearest shrine with a tablet or mistletoe action.';

  @override
  String get cardKnowledgeProvisionTarget =>
      'The nearest shrine with a knowledge or provision action.';

  @override
  String get cardConnectDolmensMovement =>
      'Each turn, move to one shrine along the path to the target dolmen. Keep this objective until it is complete.';

  @override
  String get cardCompetitionMovement => 'Up to 6 provisions away.';

  @override
  String get cardDefaultMovement => 'Up to 5 provisions away.';

  @override
  String get cardCompetitionDie => 'Strongest die.';

  @override
  String get cardKnowledgeProvisionDie => 'Weakest die.';

  @override
  String get cardDefaultDie =>
      'Most frequent value; on a tie, randomly choose among tied values.';

  @override
  String get cardSickleAmuletAction => 'Sickle or amulet at the target shrine.';

  @override
  String get chooseShrineAction =>
      'Choose the least expensive path. Then prefer an empty shrine. If more than one option remains, the player chooses.';

  @override
  String get cardKnowledgeProvisionAction =>
      'Knowledge or provisions at the target shrine.';

  @override
  String get cardDefaultAction => 'Select the available actions';

  @override
  String get cardStandingStoneTieBreak =>
      'Target tie: cheapest path, then empty shrine, then player’s choice.';

  @override
  String get dolmenPink => 'Pink';

  @override
  String get dolmenOrange => 'Orange';

  @override
  String get dolmenBlue => 'Blue';

  @override
  String get dolmenGreen => 'Green';

  @override
  String get dolmenBrown => 'Brown';

  @override
  String get dolmenBlack => 'Black';

  @override
  String get playerConnectedDolmens => 'Connected';

  @override
  String get chooseAutomaForm => 'Automata’s form';

  @override
  String get druidForm => 'Druid form';

  @override
  String get bearForm => 'Bear form';

  @override
  String get automaFormHint =>
      'The form determines which actions appear more often in the 10-card deck.';

  @override
  String get chooseSupplyAction => 'Select one of the actions:';

  @override
  String get chooseTablet => 'Choose a tablet';

  @override
  String get choosePotion => 'Choose a potion';

  @override
  String get noSupplyAvailable => 'No items available for this action.';

  @override
  String get tabletQueueHelp =>
      'In the displayed order, select the first tablet available on the board. Confirming removes one copy of the selected tablet only.';

  @override
  String get potionQueueHelp =>
      'Select the first available potion in the displayed order. When you confirm, the selected potion and all earlier ones will be marked as used.';

  @override
  String tabletOption(int id) {
    return 'Tablet $id';
  }

  @override
  String potionOption(int cost, int variant) {
    return 'Cost $cost potion, variant $variant';
  }

  @override
  String get chooseStandingStone => 'Erect a standing stone';

  @override
  String get chooseRunestone => 'Erect a runestone';

  @override
  String stonesPlaced(int count) {
    return '$count/6';
  }

  @override
  String get tabletInventory => 'Tablets';

  @override
  String get potionInventory => 'Potions';

  @override
  String get stoneInventory => 'Stones';

  @override
  String potionCostHeading(int cost) {
    return 'Mistletoe cost $cost';
  }

  @override
  String get removeInventoryPiece => 'Remove one piece';

  @override
  String get restoreInventoryPiece => 'Restore one piece';

  @override
  String get closeInventory => 'Close';

  @override
  String get finishGame => 'Finish game';

  @override
  String get advanceSickle => 'Advance the sickle';

  @override
  String get chooseAmulet => 'Choose an amulet slot';

  @override
  String get amuletSlotHelp =>
      'Select an empty slot in the position you can reach.';

  @override
  String get amuletUseSickle => 'Position II is full: use the sickle';

  @override
  String sickleProgress(int value) {
    return 'Sickle: $value/13';
  }

  @override
  String get sickleLimitHelp => 'The sickle has reached 13. Choose the amulet.';

  @override
  String get setupColorTitle => 'Choose Automata’s color';

  @override
  String get bearFormDifficulty => 'Bear form is the more difficult option.';

  @override
  String get chooseProvisions => 'Provisions';

  @override
  String get advanceKnowledge => 'Advance knowledge';

  @override
  String knowledgeProgress(int value, int max) {
    return 'Knowledge: $value/$max';
  }

  @override
  String get setupPlayersTitle => 'Number of players';

  @override
  String setupPlayersSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count players',
      one: '1 player',
    );
    return '$_temp0';
  }

  @override
  String get auxiliaryPlacement =>
      'Use this card to find where to place the die and choose the action.';

  @override
  String get noAuxiliaryAction => 'No action available';

  @override
  String get executeShrineAction => 'Execute action';

  @override
  String get shrineActionTitle => 'Shrine actions';

  @override
  String shrineActionHelp(int limit) {
    return 'Find the indicated shrine and mark up to $limit actions available there.';
  }

  @override
  String get drawShrineAction => 'Draw action';

  @override
  String setupPlayersShort(int count) {
    return '$count pl.';
  }

  @override
  String get gameSummaryTitle => 'Game summary';

  @override
  String get viewGameSummary => 'View summary';

  @override
  String get summaryDiceUsed => 'Dice used';

  @override
  String get summaryDolmenPairs => 'Dolmen pairs connected';

  @override
  String get summaryTabletsRemoved => 'Tablets removed';

  @override
  String get summaryPotionsRemoved => 'Potions removed';

  @override
  String get summaryStandingStones => 'Standing stones placed';

  @override
  String get summaryRunestones => 'Runestones placed';

  @override
  String get summarySickle => 'Sickle';

  @override
  String get summaryKnowledge => 'Knowledge';

  @override
  String get summaryAmulet => 'Amulet';

  @override
  String get exitApp => 'Exit app';

  @override
  String get closeGameSummary => 'Close summary';
}
