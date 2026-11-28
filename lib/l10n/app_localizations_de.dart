// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get automataName => 'Automa';

  @override
  String get automataCards => 'Karten des Automa';

  @override
  String get reshuffleDeck =>
      'Beim nächsten Ziehen wird der Stapel neu gemischt.';

  @override
  String get drawCard => 'Karte ziehen';

  @override
  String get setDolmens => 'Dolmen auswählen';

  @override
  String get placeNextDie => 'Würfel einsetzen';

  @override
  String get nextCard => 'Nächste Karte';

  @override
  String availableDice(int count) {
    return 'Verfügbare Würfel: $count';
  }

  @override
  String get allDiceUsed => 'Alle Würfel wurden eingesetzt.';

  @override
  String get connectDolmensTitle => '2 Dolmen verbinden';

  @override
  String get dolmenInstructions =>
      'Wähle das Dolmenpaar und gib an, wie viele Würfel noch eingesetzt werden müssen.';

  @override
  String get dolmenPair => 'Dolmenpaar';

  @override
  String get requiredDice => 'Benötigte Würfel';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get targetLabel => 'Ziel';

  @override
  String get chosenDolmens => 'Dolmen';

  @override
  String get connectingDolmens => 'Die beiden Dolmen verbinden';

  @override
  String get waitingForDolmens =>
      'Wähle das Paar und die Anzahl der Würfel, um fortzufahren.';

  @override
  String get movementMaximum => 'Max.';

  @override
  String get movementLabel => 'Bewegung';

  @override
  String get dieLabel => 'Würfel';

  @override
  String get actionLabel => 'Aktion';

  @override
  String get tieBreakLabel => 'Gleichstand';

  @override
  String dolmenProgress(int placed, int required) {
    return '$placed/$required';
  }

  @override
  String get purple => 'Violett';

  @override
  String get yellow => 'Gelb';

  @override
  String get mint => 'Mintgrün';

  @override
  String get red => 'Rot';

  @override
  String get language => 'Sprache';

  @override
  String get prepareAutomata => 'Bereite den Automa vor';

  @override
  String get unofficialSetup => 'Inoffizieller Automa • Spielvorbereitung';

  @override
  String get chooseColor => '1. Wähle die Farbe des Automa';

  @override
  String get prepareComponents => '2. Bereite das Spielmaterial vor';

  @override
  String get playerCount =>
      'Bereite je nach Anzahl der automatisierten Gegner eine Partie für 2, 3 oder 4 Spieler vor.';

  @override
  String get setupPieces =>
      'Lege die 13 Würfel, den Druiden, den Wissensmarker, 6 Menhire und 6 Runensteine der gewählten Farbe bereit.';

  @override
  String get unusedPieces =>
      'Der Automa verwendet keine Vorräte, kein Spielertableau, keine Steintafeln, kein Amulett und keine Tränke.';

  @override
  String get startingShrine =>
      'Du bist zuletzt am Zug: Wähle zuerst dein Startheiligtum. Wähle danach das Startheiligtum des Automa zufällig aus.';

  @override
  String get restartSetup => 'Neu starten';

  @override
  String get rollDice => 'Würfeln';

  @override
  String dieSemantics(int index, int value) {
    return 'Würfel $index: $value';
  }

  @override
  String get automataDice => 'Würfel des Automa';

  @override
  String get rollingDice => 'Die 13 Würfel werden geworfen …';

  @override
  String get sortedDice => '13 Würfel, aufsteigend sortiert.';

  @override
  String get automaticDice =>
      'Diese Würfel werden im Spiel automatisch von den Karten verwendet.';

  @override
  String get continueToCards => 'Partie starten';

  @override
  String get cardCompetitionTitle => 'Wettstreit';

  @override
  String get cardSurroundFireTitle => 'Eine Feuerstelle umschließen';

  @override
  String get cardStandingStoneTitle => 'Menhir oder Runenstein';

  @override
  String get cardSickleAmuletTitle => 'Sichel oder Amulett';

  @override
  String get cardTabletMistletoeTitle => 'Steintafel oder Mistel';

  @override
  String get cardKnowledgeProvisionTitle => 'Wissen oder Vorräte';

  @override
  String get cardCompetitionTarget =>
      'Das nächstgelegene Heiligtum mit einem Würfel, dessen Wert niedriger ist als der höchste Würfelwert des Automa.';

  @override
  String get cardConnectDolmensTarget =>
      'Wenn der Automa bereits mit einem Dolmen verbunden ist und es bis zum gleichfarbigen Dolmen weniger als 5 Heiligtümer sind, ist dieser Dolmen das Ziel. Ziehe andernfalls eine neue Karte.';

  @override
  String get cardSurroundFireTarget =>
      'Eine Feuerstelle, für die dem Automa nur noch ein Heiligtum fehlt und die mit höchstens 6 Vorräten erreichbar ist. Ziehe andernfalls eine neue Karte.';

  @override
  String get cardStandingStoneTarget =>
      'Das nächstgelegene Heiligtum mit einer Menhir- oder Runensteinaktion.';

  @override
  String get cardSickleAmuletTarget =>
      'Das nächstgelegene Heiligtum mit einer Sichel- oder Amulettaktion.';

  @override
  String get cardTabletMistletoeTarget =>
      'Das nächstgelegene Heiligtum mit einer Steintafel- oder Mistelaktion.';

  @override
  String get cardKnowledgeProvisionTarget =>
      'Das nächstgelegene Heiligtum mit einer Wissens- oder Vorratsaktion.';

  @override
  String get cardConnectDolmensMovement =>
      'Rücke in jedem Zug um ein Heiligtum auf dem Weg zum Zieldolmen vor. Verfolge dieses Ziel, bis die Verbindung abgeschlossen ist.';

  @override
  String get cardCompetitionMovement => 'Bis zu 6 Vorräte für die Bewegung.';

  @override
  String get cardDefaultMovement => 'Bis zu 5 Vorräte für die Bewegung.';

  @override
  String get cardCompetitionDie => 'Würfel mit dem höchsten Wert.';

  @override
  String get cardKnowledgeProvisionDie => 'Würfel mit dem niedrigsten Wert.';

  @override
  String get cardDefaultDie =>
      'Würfelwert, der am häufigsten vorkommt. Lose bei Gleichstand unter den betreffenden Werten aus.';

  @override
  String get cardSickleAmuletAction =>
      'Sichel oder Amulett des Zielheiligtums.';

  @override
  String get chooseShrineAction =>
      'Wähle den günstigsten Weg. Bevorzuge dann ein leeres Heiligtum. Bleiben mehrere Möglichkeiten, entscheidest du.';

  @override
  String get cardKnowledgeProvisionAction =>
      'Wissen oder Vorräte des Zielheiligtums.';

  @override
  String get cardDefaultAction => 'Wähle die verfügbaren Aktionen.';

  @override
  String get cardStandingStoneTieBreak =>
      'Bei gleichwertigen Zielen hat der günstigste Weg Vorrang, dann ein leeres Heiligtum. Gibt es weiterhin mehrere Optionen, entscheidest du.';

  @override
  String get dolmenPink => 'Rosa';

  @override
  String get dolmenOrange => 'Orange';

  @override
  String get dolmenBlue => 'Blau';

  @override
  String get dolmenGreen => 'Grün';

  @override
  String get dolmenBrown => 'Braun';

  @override
  String get dolmenBlack => 'Schwarz';

  @override
  String get playerConnectedDolmens => 'Bereits verbunden';

  @override
  String get chooseAutomaForm => 'Form des Automa';

  @override
  String get druidForm => 'Druidenform';

  @override
  String get bearForm => 'Bärenform';

  @override
  String get automaFormHint =>
      'Die Form bestimmt, welche Aktionen im Stapel mit 10 Karten häufiger auftreten.';

  @override
  String get chooseSupplyAction => 'Wähle eine Aktion:';

  @override
  String get chooseTablet => 'Steintafel auswählen';

  @override
  String get choosePotion => 'Trank auswählen';

  @override
  String get noSupplyAvailable =>
      'Für diese Aktion sind keine Spielsteine verfügbar.';

  @override
  String get tabletQueueHelp =>
      'Wähle in der angezeigten Reihenfolge die erste Steintafel, die auf dem Spielbrett verfügbar ist. Beim Bestätigen wird nur ein Exemplar der ausgewählten Tafel abgezogen.';

  @override
  String get potionQueueHelp =>
      'Wähle in der angezeigten Reihenfolge den ersten verfügbaren Trank. Beim Bestätigen gelten der ausgewählte Trank und alle davor als verbraucht.';

  @override
  String tabletOption(int id) {
    return 'Steintafel $id';
  }

  @override
  String potionOption(int cost, int variant) {
    return 'Trank mit Kosten $cost, Variante $variant';
  }

  @override
  String get chooseStandingStone => 'Menhir errichten';

  @override
  String get chooseRunestone => 'Runenstein errichten';

  @override
  String stonesPlaced(int count) {
    return '$count/6';
  }

  @override
  String get tabletInventory => 'Steintafeln';

  @override
  String get potionInventory => 'Tränke';

  @override
  String get stoneInventory => 'Steine';

  @override
  String potionCostHeading(int cost) {
    return 'Mistelkosten: $cost';
  }

  @override
  String get removeInventoryPiece => 'Ein Stück abziehen';

  @override
  String get restoreInventoryPiece => 'Ein Stück wiederherstellen';

  @override
  String get closeInventory => 'Schließen';

  @override
  String get finishGame => 'Partie beenden';

  @override
  String get advanceSickle => 'Sichel vorrücken';

  @override
  String get chooseAmulet => 'Feld im Amulett auswählen';

  @override
  String get amuletSlotHelp =>
      'Wähle ein freies Feld an der erreichbaren Position.';

  @override
  String get amuletUseSickle => 'Position II ist belegt: Sichel verwenden';

  @override
  String sickleProgress(int value) {
    return 'Sichel: $value/13';
  }

  @override
  String get sickleLimitHelp =>
      'Die Sichel hat 13 erreicht. Wähle das Amulett.';

  @override
  String get setupColorTitle => 'Wähle die Farbe des Automa';

  @override
  String get bearFormDifficulty =>
      'Die Bärenform ist die schwierigere Variante.';

  @override
  String get chooseProvisions => 'Vorräte';

  @override
  String get advanceKnowledge => 'Wissensmarker vorrücken';

  @override
  String knowledgeProgress(int value, int max) {
    return 'Wissen: $value/$max';
  }

  @override
  String get setupPlayersTitle => 'Anzahl der Spieler';

  @override
  String setupPlayersSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Spieler',
      one: '1 Spieler',
    );
    return '$_temp0';
  }

  @override
  String get auxiliaryPlacement =>
      'Entscheide anhand dieser Karte, wo du den Würfel einsetzt und welche Aktion du ausführst.';

  @override
  String get noAuxiliaryAction => 'Keine Aktion verfügbar';

  @override
  String get executeShrineAction => 'Aktion ausführen';

  @override
  String get shrineActionTitle => 'Aktionen des Heiligtums';

  @override
  String shrineActionHelp(int limit) {
    return 'Suche das angegebene Heiligtum und markiere bis zu $limit der dort verfügbaren Aktionen.';
  }

  @override
  String get drawShrineAction => 'Aktion auslosen';

  @override
  String setupPlayersShort(int count) {
    return '$count Sp.';
  }

  @override
  String get gameSummaryTitle => 'Partiezusammenfassung';

  @override
  String get viewGameSummary => 'Zusammenfassung ansehen';

  @override
  String get summaryDiceUsed => 'Eingesetzte Würfel';

  @override
  String get summaryDolmenPairs => 'Verbundene Dolmenpaare';

  @override
  String get summaryTabletsRemoved => 'Entfernte Steintafeln';

  @override
  String get summaryPotionsRemoved => 'Entfernte Tränke';

  @override
  String get summaryStandingStones => 'Errichtete Menhire';

  @override
  String get summaryRunestones => 'Errichtete Runensteine';

  @override
  String get summarySickle => 'Sichel';

  @override
  String get summaryKnowledge => 'Wissen';

  @override
  String get summaryAmulet => 'Amulett';

  @override
  String get exitApp => 'App verlassen';

  @override
  String get closeGameSummary => 'Zusammenfassung schließen';

  @override
  String get aboutTitle => 'Über die App';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutDescription =>
      'Inoffizielle Begleit-App für Solopartien von Druids of Edora mit dem physischen Brettspiel.';

  @override
  String get aboutAcknowledgments => 'Danksagung';

  @override
  String get aboutCreatorCredit =>
      'Vielen Dank an Julien (jujuandco) aus der BoardGameGeek-Community für Malfurion, den ursprünglichen Automa, auf dem diese App basiert. Diese Adaption passt einige Regeln an und automatisiert Teile des Spiels.';

  @override
  String get aboutBggProfile => 'Profil auf BoardGameGeek';

  @override
  String get aboutOriginalSolo => 'Ursprünglicher Solomodus';

  @override
  String get aboutLicense => 'Quellcode und GPL-v3-Lizenz';

  @override
  String get aboutPrivacyPolicy => 'Datenschutzerklärung';

  @override
  String get aboutLinkError => 'Der Link konnte nicht geöffnet werden.';
}
