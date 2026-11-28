import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:the_druids_of_edora/features/cards/widgets/amulet_dialog.dart';
import 'package:the_druids_of_edora/l10n/app_localizations.dart';
import 'package:the_druids_of_edora/features/setup/automata_color.dart';
import 'package:the_druids_of_edora/features/cards/sickle_amulet.dart';

void main() {
  test('fills each row from the left with six distinct gems', () {
    final amulet = SickleAmulet();
    final random = Random(17);

    expect(amulet.drawGemForRow(1, random), 2);
    expect(amulet.drawGemForRow(1, random), 3);
    expect(amulet.drawGemForRow(1, random), isNull);
    expect(amulet.secondPositionFull, isTrue);
    expect(amulet.amuletComplete, isFalse);

    for (final row in [2, 0]) {
      expect(amulet.drawGemForRow(row, random), row * 2);
      expect(amulet.drawGemForRow(row, random), row * 2 + 1);
    }

    expect(amulet.amuletComplete, isTrue);
    for (var row = 0; row < SickleAmulet.positions.length; row++) {
      expect(amulet.drawGemForRow(row, random), isNull);
    }
    expect(List.generate(6, amulet.gemAt), unorderedEquals(AmuletGem.values));
  });

  testWidgets('tapping an image row places one gem for the current action', (
    tester,
  ) async {
    final amulet = SickleAmulet();
    final random = Random(17);
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: AmuletDialog(
            progress: amulet,
            color: AutomataColor.mint,
            onChooseRow: (row) => amulet.drawGemForRow(row, random) != null,
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.image(const AssetImage('assets/images/medallion-mint.png')),
      findsOneWidget,
    );
    await tester.tap(find.byKey(const ValueKey('amulet-row-2')));
    await tester.pumpAndSettle();
    final gem = amulet.gemAt(4)!;
    expect(find.image(AssetImage(gem.asset)), findsOneWidget);
    await tester.tap(
      find.byKey(const ValueKey('amulet-row-2')),
      warnIfMissed: false,
    );
    expect(amulet.gemsPlaced, 1);
  });
}
