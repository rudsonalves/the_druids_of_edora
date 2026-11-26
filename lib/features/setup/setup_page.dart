import 'dart:async';
import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../../l10n/app_localizations.dart';
import '../cards/automa_card.dart';
import '../cards/cards_page.dart';
import 'automata_color.dart';
import 'widgets/die_face.dart';
import 'widgets/setup_instruction.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({
    super.key,
    required this.random,
    required this.onLocaleChanged,
  });

  final Random random;
  final ValueChanged<Locale> onLocaleChanged;

  @override
  State<SetupPage> createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  AutomataColor? selectedColor;
  AutomaForm? selectedForm;
  int? playerCount;
  List<int> dice = const [];
  Timer? rollTimer;
  bool isRolling = false;

  @override
  void dispose() {
    rollTimer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) chooseSetup();
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = selectedColor;
    final form = selectedForm;
    final players = playerCount;
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Druids of Edora'),
        actions: [if (form != null) languageMenu(l10n)],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          children: [
            Text(
              l10n.prepareMalfurion,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(l10n.unofficialSetup),
            if (color != null && form != null && players != null) ...[
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(
                    avatar: CircleAvatar(backgroundColor: color.value),
                    label: Text(colorName(color)),
                  ),
                  Chip(
                    label: Text(
                      form == AutomaForm.druid ? l10n.druidForm : l10n.bearForm,
                    ),
                  ),
                  Chip(label: Text(l10n.setupPlayersSummary(players))),
                ],
              ),
              if (dice.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(isRolling ? l10n.rollingDice : l10n.sortedDice),
                const SizedBox(height: 8),
                LayoutBuilder(
                  builder: (context, constraints) {
                    const spacing = 4.0;
                    const columns = 7;
                    final size = min(
                      42.0,
                      (constraints.maxWidth - spacing * (columns - 1)) /
                          columns,
                    );
                    return Column(
                      key: const Key('dice-grid'),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: spacing,
                      children: [
                        for (
                          var start = 0;
                          start < dice.length;
                          start += columns
                        )
                          Row(
                            spacing: spacing,
                            children: [
                              for (
                                var index = start;
                                index < min(start + columns, dice.length);
                                index++
                              )
                                DieFace(
                                  value: dice[index],
                                  color: color.value,
                                  index: index + 1,
                                  size: size,
                                ),
                            ],
                          ),
                      ],
                    );
                  },
                ),
                if (!isRolling) ...[
                  const SizedBox(height: 8),
                  Text(l10n.automaticDice),
                ],
              ],
              const SizedBox(height: 24),
              Text(
                l10n.prepareComponents,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 12),
              SetupInstruction(number: 1, text: l10n.playerCount),
              SetupInstruction(number: 2, text: l10n.setupPieces),
              SetupInstruction(number: 3, text: l10n.unusedPieces),
              SetupInstruction(number: 4, text: l10n.startingShrine),
            ],
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 12, 20, 16),
        child: FilledButton.icon(
          onPressed:
              color == null || form == null || players == null || isRolling
              ? null
              : dice.isEmpty
              ? startRoll
              : () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute<void>(
                    builder: (_) => CardsPage(
                      color: color,
                      form: form,
                      playerCount: players,
                      dice: List.unmodifiable(dice),
                      random: widget.random,
                    ),
                  ),
                  (_) => false,
                ),
          icon: Icon(
            dice.isEmpty || isRolling ? Icons.casino : Icons.arrow_forward,
          ),
          label: Text(
            dice.isEmpty || isRolling ? l10n.rollDice : l10n.continueToCards,
          ),
        ),
      ),
    );
  }

  AppLocalizations get l10n => AppLocalizations.of(context)!;

  String colorName(AutomataColor color) => switch (color) {
    AutomataColor.purple => l10n.purple,
    AutomataColor.yellow => l10n.yellow,
    AutomataColor.mint => l10n.mint,
    AutomataColor.red => l10n.red,
  };

  List<int> rollDice() =>
      List.generate(13, (_) => widget.random.nextInt(6) + 1);

  void startRoll() {
    setState(() {
      dice = rollDice();
      isRolling = true;
    });
    rollTimer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      setState(() {
        dice = rollDice();
        if (timer.tick == 12) {
          timer.cancel();
          dice.sort();
          isRolling = false;
        }
      });
    });
  }

  Widget languageMenu(AppLocalizations strings) => PopupMenuButton<Locale>(
    tooltip: strings.language,
    icon: const Icon(Icons.language),
    onSelected: widget.onLocaleChanged,
    itemBuilder: (_) => const [
      PopupMenuItem(value: Locale('pt', 'BR'), child: Text('Português (BR)')),
      PopupMenuItem(value: Locale('en'), child: Text('English')),
    ],
  );

  Future<void> chooseSetup() async {
    final color = await showDialog<AutomataColor>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final strings = AppLocalizations.of(context)!;
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Row(
              children: [
                Expanded(child: Text(strings.setupColorTitle)),
                languageMenu(strings),
              ],
            ),
            content: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final option in AutomataColor.values)
                  ActionChip(
                    avatar: CircleAvatar(backgroundColor: option.value),
                    label: Text(colorName(option)),
                    onPressed: () => Navigator.pop(context, option),
                  ),
              ],
            ),
          ),
        );
      },
    );
    if (!mounted || color == null) return;

    final form = await showDialog<AutomaForm>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        final strings = AppLocalizations.of(context)!;
        return PopScope(
          canPop: false,
          child: AlertDialog(
            title: Text(strings.chooseAutomaForm),
            content: Text(strings.bearFormDifficulty),
            actionsAlignment: .spaceBetween,
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, AutomaForm.druid),
                child: Text(strings.druidForm),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, AutomaForm.bear),
                child: Text(strings.bearForm),
              ),
            ],
          ),
        );
      },
    );
    if (!mounted || form == null) return;

    final players = await showDialog<int>(
      context: context,
      barrierDismissible: false,
      builder: (context) => PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text(AppLocalizations.of(context)!.setupPlayersTitle),
          content: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (var count = 2; count <= 4; count++)
                ActionChip(
                  label: Text('$count'),
                  onPressed: () => Navigator.pop(context, count),
                ),
            ],
          ),
        ),
      ),
    );
    if (!mounted || players == null) return;

    setState(() {
      selectedColor = color;
      selectedForm = form;
      playerCount = players;
    });
  }
}
