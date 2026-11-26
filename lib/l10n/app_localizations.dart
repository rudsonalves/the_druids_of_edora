import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// No description provided for @automataName.
  ///
  /// In en, this message translates to:
  /// **'Automata'**
  String get automataName;

  /// No description provided for @automataCards.
  ///
  /// In en, this message translates to:
  /// **'Automata’s cards'**
  String get automataCards;

  /// No description provided for @reshuffleDeck.
  ///
  /// In en, this message translates to:
  /// **'The deck will be shuffled again on the next draw.'**
  String get reshuffleDeck;

  /// No description provided for @drawCard.
  ///
  /// In en, this message translates to:
  /// **'Draw card'**
  String get drawCard;

  /// No description provided for @setDolmens.
  ///
  /// In en, this message translates to:
  /// **'Set dolmens'**
  String get setDolmens;

  /// No description provided for @placeNextDie.
  ///
  /// In en, this message translates to:
  /// **'Place die'**
  String get placeNextDie;

  /// No description provided for @nextCard.
  ///
  /// In en, this message translates to:
  /// **'Next card'**
  String get nextCard;

  /// No description provided for @availableDice.
  ///
  /// In en, this message translates to:
  /// **'Available dice: {count}'**
  String availableDice(int count);

  /// No description provided for @allDiceUsed.
  ///
  /// In en, this message translates to:
  /// **'All dice have been used.'**
  String get allDiceUsed;

  /// No description provided for @connectDolmensTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect 2 dolmens'**
  String get connectDolmensTitle;

  /// No description provided for @dolmenInstructions.
  ///
  /// In en, this message translates to:
  /// **'Choose the dolmen pair and how many dice still need to be placed.'**
  String get dolmenInstructions;

  /// No description provided for @dolmenPair.
  ///
  /// In en, this message translates to:
  /// **'Dolmen pair'**
  String get dolmenPair;

  /// No description provided for @requiredDice.
  ///
  /// In en, this message translates to:
  /// **'Dice needed'**
  String get requiredDice;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @targetLabel.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get targetLabel;

  /// No description provided for @chosenDolmens.
  ///
  /// In en, this message translates to:
  /// **'Dolmens'**
  String get chosenDolmens;

  /// No description provided for @connectingDolmens.
  ///
  /// In en, this message translates to:
  /// **'Connecting the two dolmens'**
  String get connectingDolmens;

  /// No description provided for @waitingForDolmens.
  ///
  /// In en, this message translates to:
  /// **'Waiting for the pair and die count to be set.'**
  String get waitingForDolmens;

  /// No description provided for @movementMaximum.
  ///
  /// In en, this message translates to:
  /// **'max.'**
  String get movementMaximum;

  /// No description provided for @movementLabel.
  ///
  /// In en, this message translates to:
  /// **'Movement'**
  String get movementLabel;

  /// No description provided for @dieLabel.
  ///
  /// In en, this message translates to:
  /// **'Die'**
  String get dieLabel;

  /// No description provided for @actionLabel.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get actionLabel;

  /// No description provided for @tieBreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Tie break'**
  String get tieBreakLabel;

  /// No description provided for @dolmenProgress.
  ///
  /// In en, this message translates to:
  /// **'{placed}/{required}'**
  String dolmenProgress(int placed, int required);

  /// No description provided for @purple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get purple;

  /// No description provided for @yellow.
  ///
  /// In en, this message translates to:
  /// **'Yellow'**
  String get yellow;

  /// No description provided for @mint.
  ///
  /// In en, this message translates to:
  /// **'Mint'**
  String get mint;

  /// No description provided for @red.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get red;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @prepareAutomata.
  ///
  /// In en, this message translates to:
  /// **'Prepare Automata'**
  String get prepareAutomata;

  /// No description provided for @unofficialSetup.
  ///
  /// In en, this message translates to:
  /// **'Unofficial automa • initial setup'**
  String get unofficialSetup;

  /// No description provided for @chooseColor.
  ///
  /// In en, this message translates to:
  /// **'1. Choose the automa color'**
  String get chooseColor;

  /// No description provided for @prepareComponents.
  ///
  /// In en, this message translates to:
  /// **'2. Prepare the components'**
  String get prepareComponents;

  /// No description provided for @playerCount.
  ///
  /// In en, this message translates to:
  /// **'Set up the game for 2, 3, or 4 players according to the number of automated opponents.'**
  String get playerCount;

  /// No description provided for @setupPieces.
  ///
  /// In en, this message translates to:
  /// **'Take all 13 dice, the druid pawn, knowledge marker, 6 standing stones, and 6 runestones in the chosen color.'**
  String get setupPieces;

  /// No description provided for @unusedPieces.
  ///
  /// In en, this message translates to:
  /// **'Automata uses no provisions, player board, tablets, amulet, or potions.'**
  String get unusedPieces;

  /// No description provided for @startingShrine.
  ///
  /// In en, this message translates to:
  /// **'You play last: choose your starting shrine first. Then randomly choose a starting shrine for Automata.'**
  String get startingShrine;

  /// No description provided for @restartSetup.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restartSetup;

  /// No description provided for @rollDice.
  ///
  /// In en, this message translates to:
  /// **'Roll dice'**
  String get rollDice;

  /// No description provided for @dieSemantics.
  ///
  /// In en, this message translates to:
  /// **'Die {index}: {value}'**
  String dieSemantics(int index, int value);

  /// No description provided for @automataDice.
  ///
  /// In en, this message translates to:
  /// **'Automata’s dice'**
  String get automataDice;

  /// No description provided for @rollingDice.
  ///
  /// In en, this message translates to:
  /// **'Rolling 13 dice…'**
  String get rollingDice;

  /// No description provided for @sortedDice.
  ///
  /// In en, this message translates to:
  /// **'13 dice sorted from lowest to highest.'**
  String get sortedDice;

  /// No description provided for @automaticDice.
  ///
  /// In en, this message translates to:
  /// **'These dice will be used automatically by the cards during the game.'**
  String get automaticDice;

  /// No description provided for @continueToCards.
  ///
  /// In en, this message translates to:
  /// **'Start game'**
  String get continueToCards;

  /// No description provided for @cardCompetitionTitle.
  ///
  /// In en, this message translates to:
  /// **'Competition'**
  String get cardCompetitionTitle;

  /// No description provided for @cardSurroundFireTitle.
  ///
  /// In en, this message translates to:
  /// **'Surround a fire'**
  String get cardSurroundFireTitle;

  /// No description provided for @cardStandingStoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Standing stone or runestone'**
  String get cardStandingStoneTitle;

  /// No description provided for @cardSickleAmuletTitle.
  ///
  /// In en, this message translates to:
  /// **'Sickle or amulet'**
  String get cardSickleAmuletTitle;

  /// No description provided for @cardTabletMistletoeTitle.
  ///
  /// In en, this message translates to:
  /// **'Tablet or mistletoe'**
  String get cardTabletMistletoeTitle;

  /// No description provided for @cardKnowledgeProvisionTitle.
  ///
  /// In en, this message translates to:
  /// **'Knowledge or provisions'**
  String get cardKnowledgeProvisionTitle;

  /// No description provided for @cardCompetitionTarget.
  ///
  /// In en, this message translates to:
  /// **'The nearest shrine with a die weaker than Automata’s strongest die.'**
  String get cardCompetitionTarget;

  /// No description provided for @cardConnectDolmensTarget.
  ///
  /// In en, this message translates to:
  /// **'If Automata is connected to a dolmen and fewer than 5 shrines remain to reach its matching dolmen, target that dolmen. Otherwise, draw another card.'**
  String get cardConnectDolmensTarget;

  /// No description provided for @cardSurroundFireTarget.
  ///
  /// In en, this message translates to:
  /// **'A fire needing just one more of Automata’s shrines, reachable for 6 provisions or less. Otherwise, draw another card.'**
  String get cardSurroundFireTarget;

  /// No description provided for @cardStandingStoneTarget.
  ///
  /// In en, this message translates to:
  /// **'The nearest shrine with a standing stone or runestone action.'**
  String get cardStandingStoneTarget;

  /// No description provided for @cardSickleAmuletTarget.
  ///
  /// In en, this message translates to:
  /// **'The nearest shrine with a sickle or amulet action.'**
  String get cardSickleAmuletTarget;

  /// No description provided for @cardTabletMistletoeTarget.
  ///
  /// In en, this message translates to:
  /// **'The nearest shrine with a tablet or mistletoe action.'**
  String get cardTabletMistletoeTarget;

  /// No description provided for @cardKnowledgeProvisionTarget.
  ///
  /// In en, this message translates to:
  /// **'The nearest shrine with a knowledge or provision action.'**
  String get cardKnowledgeProvisionTarget;

  /// No description provided for @cardConnectDolmensMovement.
  ///
  /// In en, this message translates to:
  /// **'Each turn, move to one shrine along the path to the target dolmen. Keep this objective until it is complete.'**
  String get cardConnectDolmensMovement;

  /// No description provided for @cardCompetitionMovement.
  ///
  /// In en, this message translates to:
  /// **'Up to 6 provisions away.'**
  String get cardCompetitionMovement;

  /// No description provided for @cardDefaultMovement.
  ///
  /// In en, this message translates to:
  /// **'Up to 5 provisions away.'**
  String get cardDefaultMovement;

  /// No description provided for @cardCompetitionDie.
  ///
  /// In en, this message translates to:
  /// **'Strongest die.'**
  String get cardCompetitionDie;

  /// No description provided for @cardKnowledgeProvisionDie.
  ///
  /// In en, this message translates to:
  /// **'Weakest die.'**
  String get cardKnowledgeProvisionDie;

  /// No description provided for @cardDefaultDie.
  ///
  /// In en, this message translates to:
  /// **'Most frequent value; on a tie, randomly choose among tied values.'**
  String get cardDefaultDie;

  /// No description provided for @cardSickleAmuletAction.
  ///
  /// In en, this message translates to:
  /// **'Sickle or amulet at the target shrine.'**
  String get cardSickleAmuletAction;

  /// No description provided for @chooseShrineAction.
  ///
  /// In en, this message translates to:
  /// **'Choose the least expensive path. Then prefer an empty shrine. If more than one option remains, the player chooses.'**
  String get chooseShrineAction;

  /// No description provided for @cardKnowledgeProvisionAction.
  ///
  /// In en, this message translates to:
  /// **'Knowledge or provisions at the target shrine.'**
  String get cardKnowledgeProvisionAction;

  /// No description provided for @cardDefaultAction.
  ///
  /// In en, this message translates to:
  /// **'Select the available actions'**
  String get cardDefaultAction;

  /// No description provided for @cardStandingStoneTieBreak.
  ///
  /// In en, this message translates to:
  /// **'Target tie: cheapest path, then empty shrine, then player’s choice.'**
  String get cardStandingStoneTieBreak;

  /// No description provided for @dolmenPink.
  ///
  /// In en, this message translates to:
  /// **'Pink'**
  String get dolmenPink;

  /// No description provided for @dolmenOrange.
  ///
  /// In en, this message translates to:
  /// **'Orange'**
  String get dolmenOrange;

  /// No description provided for @dolmenBlue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get dolmenBlue;

  /// No description provided for @dolmenGreen.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get dolmenGreen;

  /// No description provided for @dolmenBrown.
  ///
  /// In en, this message translates to:
  /// **'Brown'**
  String get dolmenBrown;

  /// No description provided for @dolmenBlack.
  ///
  /// In en, this message translates to:
  /// **'Black'**
  String get dolmenBlack;

  /// No description provided for @playerConnectedDolmens.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get playerConnectedDolmens;

  /// No description provided for @chooseAutomaForm.
  ///
  /// In en, this message translates to:
  /// **'Automata’s form'**
  String get chooseAutomaForm;

  /// No description provided for @druidForm.
  ///
  /// In en, this message translates to:
  /// **'Druid form'**
  String get druidForm;

  /// No description provided for @bearForm.
  ///
  /// In en, this message translates to:
  /// **'Bear form'**
  String get bearForm;

  /// No description provided for @automaFormHint.
  ///
  /// In en, this message translates to:
  /// **'The form determines which actions appear more often in the 10-card deck.'**
  String get automaFormHint;

  /// No description provided for @chooseSupplyAction.
  ///
  /// In en, this message translates to:
  /// **'Select one of the actions:'**
  String get chooseSupplyAction;

  /// No description provided for @chooseTablet.
  ///
  /// In en, this message translates to:
  /// **'Choose a tablet'**
  String get chooseTablet;

  /// No description provided for @choosePotion.
  ///
  /// In en, this message translates to:
  /// **'Choose a potion'**
  String get choosePotion;

  /// No description provided for @noSupplyAvailable.
  ///
  /// In en, this message translates to:
  /// **'No items available for this action.'**
  String get noSupplyAvailable;

  /// No description provided for @tabletQueueHelp.
  ///
  /// In en, this message translates to:
  /// **'In the displayed order, select the first tablet available on the board. Confirming removes one copy of the selected tablet only.'**
  String get tabletQueueHelp;

  /// No description provided for @potionQueueHelp.
  ///
  /// In en, this message translates to:
  /// **'Select the first available potion in the displayed order. When you confirm, the selected potion and all earlier ones will be marked as used.'**
  String get potionQueueHelp;

  /// No description provided for @tabletOption.
  ///
  /// In en, this message translates to:
  /// **'Tablet {id}'**
  String tabletOption(int id);

  /// No description provided for @potionOption.
  ///
  /// In en, this message translates to:
  /// **'Cost {cost} potion, variant {variant}'**
  String potionOption(int cost, int variant);

  /// No description provided for @chooseStandingStone.
  ///
  /// In en, this message translates to:
  /// **'Erect a standing stone'**
  String get chooseStandingStone;

  /// No description provided for @chooseRunestone.
  ///
  /// In en, this message translates to:
  /// **'Erect a runestone'**
  String get chooseRunestone;

  /// No description provided for @stonesPlaced.
  ///
  /// In en, this message translates to:
  /// **'{count}/6'**
  String stonesPlaced(int count);

  /// No description provided for @tabletInventory.
  ///
  /// In en, this message translates to:
  /// **'Tablets'**
  String get tabletInventory;

  /// No description provided for @potionInventory.
  ///
  /// In en, this message translates to:
  /// **'Potions'**
  String get potionInventory;

  /// No description provided for @stoneInventory.
  ///
  /// In en, this message translates to:
  /// **'Stones'**
  String get stoneInventory;

  /// No description provided for @potionCostHeading.
  ///
  /// In en, this message translates to:
  /// **'Mistletoe cost {cost}'**
  String potionCostHeading(int cost);

  /// No description provided for @removeInventoryPiece.
  ///
  /// In en, this message translates to:
  /// **'Remove one piece'**
  String get removeInventoryPiece;

  /// No description provided for @restoreInventoryPiece.
  ///
  /// In en, this message translates to:
  /// **'Restore one piece'**
  String get restoreInventoryPiece;

  /// No description provided for @closeInventory.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeInventory;

  /// No description provided for @finishGame.
  ///
  /// In en, this message translates to:
  /// **'Finish game'**
  String get finishGame;

  /// No description provided for @advanceSickle.
  ///
  /// In en, this message translates to:
  /// **'Advance the sickle'**
  String get advanceSickle;

  /// No description provided for @chooseAmulet.
  ///
  /// In en, this message translates to:
  /// **'Choose an amulet slot'**
  String get chooseAmulet;

  /// No description provided for @amuletSlotHelp.
  ///
  /// In en, this message translates to:
  /// **'Select an empty slot in the position you can reach.'**
  String get amuletSlotHelp;

  /// No description provided for @amuletUseSickle.
  ///
  /// In en, this message translates to:
  /// **'Position II is full: use the sickle'**
  String get amuletUseSickle;

  /// No description provided for @sickleProgress.
  ///
  /// In en, this message translates to:
  /// **'Sickle: {value}/13'**
  String sickleProgress(int value);

  /// No description provided for @sickleLimitHelp.
  ///
  /// In en, this message translates to:
  /// **'The sickle has reached 13. Choose the amulet.'**
  String get sickleLimitHelp;

  /// No description provided for @setupColorTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose Automata’s color'**
  String get setupColorTitle;

  /// No description provided for @bearFormDifficulty.
  ///
  /// In en, this message translates to:
  /// **'Bear form is the more difficult option.'**
  String get bearFormDifficulty;

  /// No description provided for @chooseProvisions.
  ///
  /// In en, this message translates to:
  /// **'Provisions'**
  String get chooseProvisions;

  /// No description provided for @advanceKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Advance knowledge'**
  String get advanceKnowledge;

  /// No description provided for @knowledgeProgress.
  ///
  /// In en, this message translates to:
  /// **'Knowledge: {value}/{max}'**
  String knowledgeProgress(int value, int max);

  /// No description provided for @setupPlayersTitle.
  ///
  /// In en, this message translates to:
  /// **'Number of players'**
  String get setupPlayersTitle;

  /// No description provided for @setupPlayersSummary.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, one{1 player} other{{count} players}}'**
  String setupPlayersSummary(int count);

  /// No description provided for @auxiliaryPlacement.
  ///
  /// In en, this message translates to:
  /// **'Use this card to find where to place the die and choose the action.'**
  String get auxiliaryPlacement;

  /// No description provided for @noAuxiliaryAction.
  ///
  /// In en, this message translates to:
  /// **'No action available'**
  String get noAuxiliaryAction;

  /// No description provided for @executeShrineAction.
  ///
  /// In en, this message translates to:
  /// **'Execute action'**
  String get executeShrineAction;

  /// No description provided for @shrineActionTitle.
  ///
  /// In en, this message translates to:
  /// **'Shrine actions'**
  String get shrineActionTitle;

  /// No description provided for @shrineActionHelp.
  ///
  /// In en, this message translates to:
  /// **'Find the indicated shrine and mark up to {limit} actions available there.'**
  String shrineActionHelp(int limit);

  /// No description provided for @drawShrineAction.
  ///
  /// In en, this message translates to:
  /// **'Draw action'**
  String get drawShrineAction;

  /// No description provided for @setupPlayersShort.
  ///
  /// In en, this message translates to:
  /// **'{count} pl.'**
  String setupPlayersShort(int count);

  /// No description provided for @gameSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Game summary'**
  String get gameSummaryTitle;

  /// No description provided for @viewGameSummary.
  ///
  /// In en, this message translates to:
  /// **'View summary'**
  String get viewGameSummary;

  /// No description provided for @summaryDiceUsed.
  ///
  /// In en, this message translates to:
  /// **'Dice used'**
  String get summaryDiceUsed;

  /// No description provided for @summaryDolmenPairs.
  ///
  /// In en, this message translates to:
  /// **'Dolmen pairs connected'**
  String get summaryDolmenPairs;

  /// No description provided for @summaryTabletsRemoved.
  ///
  /// In en, this message translates to:
  /// **'Tablets removed'**
  String get summaryTabletsRemoved;

  /// No description provided for @summaryPotionsRemoved.
  ///
  /// In en, this message translates to:
  /// **'Potions removed'**
  String get summaryPotionsRemoved;

  /// No description provided for @summaryStandingStones.
  ///
  /// In en, this message translates to:
  /// **'Standing stones placed'**
  String get summaryStandingStones;

  /// No description provided for @summaryRunestones.
  ///
  /// In en, this message translates to:
  /// **'Runestones placed'**
  String get summaryRunestones;

  /// No description provided for @summarySickle.
  ///
  /// In en, this message translates to:
  /// **'Sickle'**
  String get summarySickle;

  /// No description provided for @summaryKnowledge.
  ///
  /// In en, this message translates to:
  /// **'Knowledge'**
  String get summaryKnowledge;

  /// No description provided for @summaryAmulet.
  ///
  /// In en, this message translates to:
  /// **'Amulet'**
  String get summaryAmulet;

  /// No description provided for @exitApp.
  ///
  /// In en, this message translates to:
  /// **'Exit app'**
  String get exitApp;

  /// No description provided for @closeGameSummary.
  ///
  /// In en, this message translates to:
  /// **'Close summary'**
  String get closeGameSummary;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
