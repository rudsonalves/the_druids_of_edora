import '../../l10n/app_localizations.dart';
import 'automa_card.dart';

extension AutomaCardLocalization on AutomaCard {
  String title(AppLocalizations l10n) => switch (this) {
    AutomaCard.competition => l10n.cardCompetitionTitle,
    AutomaCard.connectDolmens => l10n.connectDolmensTitle,
    AutomaCard.surroundFire => l10n.cardSurroundFireTitle,
    AutomaCard.standingStone => l10n.cardStandingStoneTitle,
    AutomaCard.sickleAmulet => l10n.cardSickleAmuletTitle,
    AutomaCard.tabletMistletoe => l10n.cardTabletMistletoeTitle,
    AutomaCard.knowledgeProvision => l10n.cardKnowledgeProvisionTitle,
  };

  String target(AppLocalizations l10n) => switch (this) {
    AutomaCard.competition => l10n.cardCompetitionTarget,
    AutomaCard.connectDolmens => l10n.cardConnectDolmensTarget,
    AutomaCard.surroundFire => l10n.cardSurroundFireTarget,
    AutomaCard.standingStone => l10n.cardStandingStoneTarget,
    AutomaCard.sickleAmulet => l10n.cardSickleAmuletTarget,
    AutomaCard.tabletMistletoe => l10n.cardTabletMistletoeTarget,
    AutomaCard.knowledgeProvision => l10n.cardKnowledgeProvisionTarget,
  };

  int? get movementDistance => switch (this) {
    AutomaCard.connectDolmens => null,
    AutomaCard.competition || AutomaCard.surroundFire => 6,
    _ => 5,
  };

  String movement(AppLocalizations l10n) => switch (movementDistance) {
    null => l10n.cardConnectDolmensMovement,
    6 => l10n.cardCompetitionMovement,
    _ => l10n.cardDefaultMovement,
  };

  String die(AppLocalizations l10n) => switch (this) {
    AutomaCard.competition ||
    AutomaCard.standingStone => l10n.cardCompetitionDie,
    AutomaCard.knowledgeProvision => l10n.cardKnowledgeProvisionDie,
    _ => l10n.cardDefaultDie,
  };

  String action(AppLocalizations l10n) => switch (this) {
    AutomaCard.standingStone => l10n.cardStandingStoneAction,
    AutomaCard.sickleAmulet => l10n.cardSickleAmuletAction,
    AutomaCard.tabletMistletoe => l10n.cardTabletMistletoeAction,
    AutomaCard.knowledgeProvision => l10n.cardKnowledgeProvisionAction,
    _ => l10n.cardDefaultAction,
  };

  String? tieBreak(AppLocalizations l10n) => switch (this) {
    AutomaCard.standingStone ||
    AutomaCard.sickleAmulet ||
    AutomaCard.tabletMistletoe ||
    AutomaCard.knowledgeProvision => l10n.cardStandingStoneTieBreak,
    _ => null,
  };
}
