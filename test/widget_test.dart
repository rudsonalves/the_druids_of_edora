import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:the_druids_of_edora/app/edora_app.dart';
import 'package:the_druids_of_edora/features/cards/widgets/automa_instruction_card.dart';
import 'package:the_druids_of_edora/features/cards/widgets/dolmen_setup_dialog.dart';
import 'package:the_druids_of_edora/features/setup/widgets/die_face.dart';

class SequenceRandom implements Random {
  int nextValue = 0;

  @override
  int nextInt(int max) => (nextValue++ * 5) % max;

  @override
  bool nextBool() => true;

  @override
  double nextDouble() => 0.5;
}

void main() {
  Future<void> completeDolmenDialog(WidgetTester tester, int count) async {
    if (find.byType(DolmenSetupDialog).evaluate().isEmpty) return;
    final pairs = find.byWidgetPredicate(
      (widget) =>
          widget is ChoiceChip &&
          (widget.key as ValueKey<String>?)?.value.startsWith('dolmen-pair-') ==
              true,
    );
    final blue = find.byKey(const Key('dolmen-pair-blue'));
    await tester.tap(blue.evaluate().isEmpty ? pairs.first : blue);
    await tester.ensureVisible(find.byKey(Key('dolmen-count-$count')));
    await tester.tap(find.byKey(Key('dolmen-count-$count')));
    await tester.pump();
    await tester.tap(find.text('Confirmar'));
    await tester.pumpAndSettle();
  }

  testWidgets('selects a color, animates and sorts thirteen dice', (
    tester,
  ) async {
    await tester.pumpWidget(EdoraApp(random: SequenceRandom()));
    await tester.pumpAndSettle();

    expect(find.text('Prepare o Malfurion'), findsOneWidget);
    expect(find.byType(DieFace), findsNothing);
    expect(
      tester.widget<FilledButton>(find.byType(FilledButton)).onPressed,
      isNull,
    );

    await tester.tap(find.text('Roxo'));
    await tester.pumpAndSettle();
    expect(find.text('A Forma Urso é a mais difícil.'), findsOneWidget);
    await tester.tap(find.text('Forma Druida'));
    await tester.pumpAndSettle();
    expect(find.text('Forma Druida'), findsOneWidget);
    await tester.tap(find.text('Rolar dados'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 250));

    expect(find.text('Rolando os 13 dados…'), findsOneWidget);
    await tester.pump(const Duration(seconds: 1));

    expect(
      find.text('13 dados ordenados do menor para o maior.'),
      findsOneWidget,
    );
    final values = tester
        .widgetList<DieFace>(find.byType(DieFace))
        .map((die) => die.value)
        .toList();
    expect(values, hasLength(13));
    expect(values, orderedEquals([...values]..sort()));
    expect(values.every((value) => value >= 1 && value <= 6), isTrue);
  });

  testWidgets('supports English from setup through the cards', (tester) async {
    await tester.pumpWidget(EdoraApp(random: SequenceRandom()));
    await tester.pumpAndSettle();
    await tester.tap(find.byIcon(Icons.language));
    await tester.pumpAndSettle();
    await tester.tap(find.text('English'));
    await tester.pumpAndSettle();

    expect(find.text('Choose Malfurion’s color'), findsOneWidget);
    await tester.tap(find.text('Purple'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Druid form'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Roll dice'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('13 dice sorted from lowest to highest.'), findsOneWidget);
    await tester.tap(find.text('Start game'));
    await tester.pumpAndSettle();
    expect(find.text('Available dice: 13'), findsOneWidget);
    await tester.tap(find.text('Draw card'));
    await tester.pumpAndSettle();
    expect(find.byType(AutomaInstructionCard), findsOneWidget);
  });

  testWidgets('draws ten cards and keeps the dice in a bottom row', (
    tester,
  ) async {
    await tester.pumpWidget(EdoraApp(random: SequenceRandom()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Roxo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Forma Druida'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rolar dados'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Iniciar a partida'));
    await tester.pumpAndSettle();

    expect(find.text('Sortear carta'), findsOneWidget);
    expect(find.byKey(const Key('dice-strip')), findsOneWidget);
    expect(tester.widget<DieFace>(find.byType(DieFace).first).size, 36);
    expect(find.text('Dados disponíveis: 13'), findsOneWidget);
    expect(find.text('Malfurion'), findsOneWidget);
    expect(find.byType(BackButton), findsNothing);
    await tester.binding.handlePopRoute();
    await tester.pumpAndSettle();
    expect(find.text('Malfurion'), findsOneWidget);
    await tester.tap(find.byTooltip('Pedras'));
    await tester.pumpAndSettle();
    final stoneButtons = tester.widgetList<IconButton>(
      find.descendant(
        of: find.byType(AlertDialog),
        matching: find.byType(IconButton),
      ),
    );
    expect(stoneButtons, hasLength(12));
    expect(stoneButtons.every((button) => button.onPressed == null), isTrue);
    await tester.tap(find.text('Fechar'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sortear carta'));
    await tester.pumpAndSettle();
    await completeDolmenDialog(tester, 1);
    expect(find.byType(AutomaInstructionCard), findsOneWidget);
    expect(find.byKey(const Key('selected-die-0')), findsOneWidget);
    expect(find.text('Dados disponíveis: 12'), findsOneWidget);
    for (var number = 2; number <= 10; number++) {
      await tester.tap(find.text('Próxima carta'));
      await tester.pumpAndSettle();
      await completeDolmenDialog(tester, 1);
    }
    expect(find.text('Dados disponíveis: 3'), findsOneWidget);

    await tester.tap(find.text('Próxima carta'));
    await tester.pumpAndSettle();
    await completeDolmenDialog(tester, 1);
    expect(find.text('Dados disponíveis: 2'), findsOneWidget);

    for (var number = 12; number <= 13; number++) {
      await tester.tap(find.text('Próxima carta'));
      await tester.pumpAndSettle();
      await completeDolmenDialog(tester, 1);
    }
    expect(find.text('Dados disponíveis: 0'), findsOneWidget);
    expect(find.text('Todos os dados foram usados.'), findsOneWidget);
    await tester.tap(find.text('Encerrar partida'));
    await tester.pumpAndSettle();
    expect(find.text('Selecione a cor de Malfurion'), findsOneWidget);
    expect(find.byTooltip('Voltar'), findsNothing);
  });

  testWidgets('keeps dolmen card until the chosen dice are placed', (
    tester,
  ) async {
    await tester.pumpWidget(EdoraApp(random: SequenceRandom()));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Roxo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Forma Druida'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Rolar dados'));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Iniciar a partida'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Sortear carta'));
    await tester.pumpAndSettle();
    for (
      var attempt = 1;
      find.byType(DolmenSetupDialog).evaluate().isEmpty && attempt < 10;
      attempt++
    ) {
      await tester.tap(find.text('Próxima carta'));
      await tester.pumpAndSettle();
    }

    expect(find.byType(DolmenSetupDialog), findsOneWidget);
    final dolmenCard = tester.widget<AutomaInstructionCard>(
      find.byType(AutomaInstructionCard),
    );
    expect(dolmenCard.card.name, 'connectDolmens');
    final cardKey = dolmenCard.key;
    await completeDolmenDialog(tester, 2);

    expect(find.text('1/2'), findsOneWidget);
    expect(find.text('Colocar dado'), findsOneWidget);
    expect(find.byKey(const Key('selected-die-0')), findsOneWidget);
    await tester.tap(find.text('Colocar dado'));
    await tester.pumpAndSettle();

    expect(find.text('2/2'), findsOneWidget);
    expect(find.byKey(const Key('selected-die-1')), findsOneWidget);
    expect(find.text('Próxima carta'), findsOneWidget);
    expect(
      tester
          .widget<AutomaInstructionCard>(find.byType(AutomaInstructionCard))
          .key,
      cardKey,
    );

    await tester.tap(find.text('Próxima carta'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<AutomaInstructionCard>(find.byType(AutomaInstructionCard))
          .key,
      isNot(cardKey),
    );
  });
}
