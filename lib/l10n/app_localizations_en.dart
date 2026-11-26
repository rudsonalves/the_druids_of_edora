// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get malfurionCards => 'Malfurion cards';

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
  String get prepareMalfurion => 'Prepare Malfurion';

  @override
  String get unofficialSetup => 'Unofficial automa • initial setup';

  @override
  String get chooseColor => '1. Choose the automa color';

  @override
  String get prepareComponents => '2. Prepare the components';

  @override
  String get playerCount =>
      'Set up the game for 2, 3, or 4 players according to the number of Malfurions.';

  @override
  String get setupPieces =>
      'Take all 13 dice, the druid pawn, knowledge marker, 6 standing stones, and 6 runestones in the chosen color.';

  @override
  String get unusedPieces =>
      'Malfurion uses no provisions, player board, tablets, amulet, or potions.';

  @override
  String get startingShrine =>
      'You play last: choose your starting shrine first. Then randomly choose a starting shrine for Malfurion.';

  @override
  String get continueToDice => 'Continue to dice';

  @override
  String dieSemantics(int index, int value) {
    return 'Die $index: $value';
  }

  @override
  String get malfurionDice => 'Malfurion dice';

  @override
  String get rollingDice => 'Rolling 13 dice…';

  @override
  String get sortedDice => '13 dice sorted from lowest to highest.';

  @override
  String get automaticDice =>
      'These dice will be used automatically by the cards during the game.';

  @override
  String get continueToCards => 'Continue to cards';

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
      'The nearest shrine with a die weaker than Malfurion’s strongest die.';

  @override
  String get cardConnectDolmensTarget =>
      'If Malfurion is connected to a dolmen and fewer than 5 shrines remain to reach its matching dolmen, target that dolmen. Otherwise, draw another card.';

  @override
  String get cardSurroundFireTarget =>
      'A fire needing just one more of Malfurion’s shrines, reachable for 6 provisions or less. Otherwise, draw another card.';

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
  String get cardStandingStoneAction =>
      'Standing stone or runestone at the target shrine.';

  @override
  String get cardSickleAmuletAction => 'Sickle or amulet at the target shrine.';

  @override
  String get cardTabletMistletoeAction =>
      'Tablet or mistletoe at the target shrine.';

  @override
  String get cardKnowledgeProvisionAction =>
      'Knowledge or provisions at the target shrine.';

  @override
  String get cardDefaultAction =>
      'Count action spaces clockwise from the top left by the chosen die value.';

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
}
