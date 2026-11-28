// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get automataName => 'Automate';

  @override
  String get automataCards => 'Cartes de l’Automate';

  @override
  String get reshuffleDeck =>
      'La pioche sera mélangée avant de tirer la prochaine carte.';

  @override
  String get drawCard => 'Tirer une carte';

  @override
  String get setDolmens => 'Choisir les dolmens';

  @override
  String get placeNextDie => 'Placer un dé';

  @override
  String get nextCard => 'Carte suivante';

  @override
  String availableDice(int count) {
    return 'Dés disponibles : $count';
  }

  @override
  String get allDiceUsed => 'Tous les dés ont été utilisés.';

  @override
  String get connectDolmensTitle => 'Relier 2 dolmens';

  @override
  String get dolmenInstructions =>
      'Choisis la paire de dolmens et indique combien de dés restent à placer.';

  @override
  String get dolmenPair => 'Paire de dolmens';

  @override
  String get requiredDice => 'Dés nécessaires';

  @override
  String get cancel => 'Annuler';

  @override
  String get confirm => 'Confirmer';

  @override
  String get targetLabel => 'Cible';

  @override
  String get chosenDolmens => 'Dolmens';

  @override
  String get connectingDolmens => 'Connexion des deux dolmens en cours';

  @override
  String get waitingForDolmens =>
      'Choisis la paire et le nombre de dés pour continuer.';

  @override
  String get movementMaximum => 'Max.';

  @override
  String get movementLabel => 'Déplacement';

  @override
  String get dieLabel => 'Dé';

  @override
  String get actionLabel => 'Action';

  @override
  String get tieBreakLabel => 'Départage';

  @override
  String dolmenProgress(int placed, int required) {
    return '$placed/$required';
  }

  @override
  String get purple => 'Violet';

  @override
  String get yellow => 'Jaune';

  @override
  String get mint => 'Vert menthe';

  @override
  String get red => 'Rouge';

  @override
  String get language => 'Langue';

  @override
  String get prepareAutomata => 'Prépare l’Automate';

  @override
  String get unofficialSetup => 'Automate non officiel • mise en place';

  @override
  String get chooseColor => '1. Choisis la couleur de l’Automate';

  @override
  String get prepareComponents => '2. Prépare le matériel';

  @override
  String get playerCount =>
      'Prépare une partie à 2, 3 ou 4 joueurs selon le nombre d’adversaires automatisés.';

  @override
  String get setupPieces =>
      'Prépare les 13 dés, le druide, le marqueur de connaissance, 6 menhirs et 6 pierres runiques de la couleur choisie.';

  @override
  String get unusedPieces =>
      'L’Automate n’utilise ni provisions, ni plateau individuel, ni tablettes, ni amulette, ni potions.';

  @override
  String get startingShrine =>
      'Tu joues en dernier : choisis d’abord ton sanctuaire de départ. Tire ensuite au hasard celui de l’Automate.';

  @override
  String get restartSetup => 'Recommencer';

  @override
  String get rollDice => 'Lancer les dés';

  @override
  String dieSemantics(int index, int value) {
    return 'Dé $index : $value';
  }

  @override
  String get automataDice => 'Dés de l’Automate';

  @override
  String get rollingDice => 'Lancement des 13 dés…';

  @override
  String get sortedDice => '13 dés triés par ordre croissant.';

  @override
  String get automaticDice =>
      'Les cartes utiliseront automatiquement ces dés pendant la partie.';

  @override
  String get continueToCards => 'Commencer la partie';

  @override
  String get cardCompetitionTitle => 'Compétition';

  @override
  String get cardSurroundFireTitle => 'Entourer un feu de camp';

  @override
  String get cardStandingStoneTitle => 'Menhir ou pierre runique';

  @override
  String get cardSickleAmuletTitle => 'Faucille ou amulette';

  @override
  String get cardTabletMistletoeTitle => 'Tablette ou gui';

  @override
  String get cardKnowledgeProvisionTitle => 'Connaissance ou provisions';

  @override
  String get cardCompetitionTarget =>
      'Le sanctuaire le plus proche contenant un dé de valeur inférieure à celle du dé le plus fort de l’Automate.';

  @override
  String get cardConnectDolmensTarget =>
      'Si l’Automate est déjà relié à un dolmen et qu’il reste moins de 5 sanctuaires jusqu’au dolmen de même couleur, celui-ci est la cible. Sinon, tire une autre carte.';

  @override
  String get cardSurroundFireTarget =>
      'Un feu de camp auquel il ne manque qu’un sanctuaire de l’Automate et qui est accessible avec au plus 6 provisions. Sinon, tire une autre carte.';

  @override
  String get cardStandingStoneTarget =>
      'Le sanctuaire le plus proche avec une action de menhir ou de pierre runique.';

  @override
  String get cardSickleAmuletTarget =>
      'Le sanctuaire le plus proche avec une action de faucille ou d’amulette.';

  @override
  String get cardTabletMistletoeTarget =>
      'Le sanctuaire le plus proche avec une action de tablette ou de gui.';

  @override
  String get cardKnowledgeProvisionTarget =>
      'Le sanctuaire le plus proche avec une action de connaissance ou de provisions.';

  @override
  String get cardConnectDolmensMovement =>
      'À chaque tour, avance d’un sanctuaire sur le chemin du dolmen cible. Garde cet objectif jusqu’à la fin de la connexion.';

  @override
  String get cardCompetitionMovement => 'Déplacement de 6 provisions maximum.';

  @override
  String get cardDefaultMovement => 'Déplacement de 5 provisions maximum.';

  @override
  String get cardCompetitionDie => 'Dé de valeur la plus élevée.';

  @override
  String get cardKnowledgeProvisionDie => 'Dé de valeur la plus basse.';

  @override
  String get cardDefaultDie =>
      'Valeur la plus fréquente. En cas d’égalité, tire au sort parmi les valeurs à égalité.';

  @override
  String get cardSickleAmuletAction =>
      'Faucille ou amulette du sanctuaire cible.';

  @override
  String get chooseShrineAction =>
      'Choisis le chemin le moins coûteux. Privilégie ensuite un sanctuaire vide. S’il reste plusieurs possibilités, le joueur choisit.';

  @override
  String get cardKnowledgeProvisionAction =>
      'Connaissance ou provisions du sanctuaire cible.';

  @override
  String get cardDefaultAction => 'Sélectionne les actions possibles.';

  @override
  String get cardStandingStoneTieBreak =>
      'En cas d’égalité entre les cibles, privilégie le chemin le moins coûteux, puis un sanctuaire vide. S’il reste plusieurs options, le joueur choisit.';

  @override
  String get dolmenPink => 'Rose';

  @override
  String get dolmenOrange => 'Orange';

  @override
  String get dolmenBlue => 'Bleu';

  @override
  String get dolmenGreen => 'Vert';

  @override
  String get dolmenBrown => 'Marron';

  @override
  String get dolmenBlack => 'Noir';

  @override
  String get playerConnectedDolmens => 'Déjà reliés';

  @override
  String get chooseAutomaForm => 'Forme de l’Automate';

  @override
  String get druidForm => 'Forme de druide';

  @override
  String get bearForm => 'Forme d’ours';

  @override
  String get automaFormHint =>
      'La forme détermine quelles actions apparaissent plus souvent dans le paquet de 10 cartes.';

  @override
  String get chooseSupplyAction => 'Choisis une action :';

  @override
  String get chooseTablet => 'Choisir une tablette';

  @override
  String get choosePotion => 'Choisir une potion';

  @override
  String get noSupplyAvailable => 'Aucune pièce disponible pour cette action.';

  @override
  String get tabletQueueHelp =>
      'Dans l’ordre affiché, sélectionne la première tablette disponible sur le plateau. La confirmation retire un seul exemplaire de la tablette choisie.';

  @override
  String get potionQueueHelp =>
      'Sélectionne la première potion disponible dans l’ordre affiché. À la confirmation, la potion choisie et toutes celles qui la précèdent seront considérées comme utilisées.';

  @override
  String tabletOption(int id) {
    return 'Tablette $id';
  }

  @override
  String potionOption(int cost, int variant) {
    return 'Potion de coût $cost, variante $variant';
  }

  @override
  String get chooseStandingStone => 'Ériger un menhir';

  @override
  String get chooseRunestone => 'Ériger une pierre runique';

  @override
  String stonesPlaced(int count) {
    return '$count/6';
  }

  @override
  String get tabletInventory => 'Tablettes';

  @override
  String get potionInventory => 'Potions';

  @override
  String get stoneInventory => 'Pierres';

  @override
  String potionCostHeading(int cost) {
    return 'Coût en gui : $cost';
  }

  @override
  String get removeInventoryPiece => 'Retirer une pièce';

  @override
  String get restoreInventoryPiece => 'Remettre une pièce';

  @override
  String get closeInventory => 'Fermer';

  @override
  String get finishGame => 'Terminer la partie';

  @override
  String get advanceSickle => 'Avancer la faucille';

  @override
  String get chooseAmulet => 'Choisir un emplacement de l’amulette';

  @override
  String get amuletSlotHelp =>
      'Choisis un emplacement libre à la position accessible.';

  @override
  String get amuletUseSickle => 'Position II occupée : utiliser la faucille';

  @override
  String sickleProgress(int value) {
    return 'Faucille : $value/13';
  }

  @override
  String get sickleLimitHelp => 'La faucille a atteint 13. Choisis l’amulette.';

  @override
  String get setupColorTitle => 'Choisis la couleur de l’Automate';

  @override
  String get bearFormDifficulty => 'La forme d’ours est la plus difficile.';

  @override
  String get chooseProvisions => 'Provisions';

  @override
  String get advanceKnowledge => 'Avancer le marqueur de connaissance';

  @override
  String knowledgeProgress(int value, int max) {
    return 'Connaissance : $value/$max';
  }

  @override
  String get setupPlayersTitle => 'Nombre de joueurs';

  @override
  String setupPlayersSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count joueurs',
      one: '1 joueur',
    );
    return '$_temp0';
  }

  @override
  String get auxiliaryPlacement =>
      'Utilise cette carte pour déterminer où placer le dé et quelle action effectuer.';

  @override
  String get noAuxiliaryAction => 'Aucune action disponible';

  @override
  String get executeShrineAction => 'Effectuer une action';

  @override
  String get shrineActionTitle => 'Actions du sanctuaire';

  @override
  String shrineActionHelp(int limit) {
    return 'Repère le sanctuaire indiqué et sélectionne jusqu’à $limit de ses actions disponibles.';
  }

  @override
  String get drawShrineAction => 'Tirer une action au sort';

  @override
  String setupPlayersShort(int count) {
    return '$count j.';
  }

  @override
  String get gameSummaryTitle => 'Résumé de la partie';

  @override
  String get viewGameSummary => 'Voir le résumé';

  @override
  String get summaryDiceUsed => 'Dés utilisés';

  @override
  String get summaryDolmenPairs => 'Paires de dolmens reliées';

  @override
  String get summaryTabletsRemoved => 'Tablettes retirées';

  @override
  String get summaryPotionsRemoved => 'Potions retirées';

  @override
  String get summaryStandingStones => 'Menhirs érigés';

  @override
  String get summaryRunestones => 'Pierres runiques érigées';

  @override
  String get summarySickle => 'Faucille';

  @override
  String get summaryKnowledge => 'Connaissance';

  @override
  String get summaryAmulet => 'Amulette';

  @override
  String get exitApp => 'Quitter l’application';

  @override
  String get closeGameSummary => 'Fermer le résumé';

  @override
  String get aboutTitle => 'À propos';

  @override
  String aboutVersion(String version) {
    return 'Version $version';
  }

  @override
  String get aboutDescription =>
      'Assistant non officiel pour jouer à Druids of Edora en solo avec le jeu de plateau.';

  @override
  String get aboutAcknowledgments => 'Remerciements';

  @override
  String get aboutCreatorCredit =>
      'Merci à Julien (jujuandco), membre de la communauté BoardGameGeek, pour avoir créé Malfurion, l’automate original à la base de cette application. Cette adaptation ajuste certaines règles et automatise une partie du déroulement.';

  @override
  String get aboutBggProfile => 'Profil sur BoardGameGeek';

  @override
  String get aboutOriginalSolo => 'Mode solo original';

  @override
  String get aboutLicense => 'Code source et licence GPL v3';

  @override
  String get aboutPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get aboutLinkError => 'Impossible d’ouvrir le lien.';
}
