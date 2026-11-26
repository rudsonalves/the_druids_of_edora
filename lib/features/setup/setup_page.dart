import '../../l10n/app_localizations.dart';

import 'dart:math';

import 'package:material_ui/material_ui.dart';

import 'automata_color.dart';
import '../dice/dice_page.dart';
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

  AppLocalizations get l10n => AppLocalizations.of(context)!;

  String colorName(AutomataColor color) => switch (color) {
    AutomataColor.purple => l10n.purple,
    AutomataColor.yellow => l10n.yellow,
    AutomataColor.mint => l10n.mint,
    AutomataColor.red => l10n.red,
  };

  @override
  Widget build(BuildContext context) {
    final color = selectedColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Druids of Edora'),
        actions: [
          PopupMenuButton<Locale>(
            tooltip: l10n.language,
            icon: const Icon(Icons.language),
            onSelected: widget.onLocaleChanged,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: Locale('pt', 'BR'),
                child: Text('Português (BR)'),
              ),
              PopupMenuItem(value: Locale('en'), child: Text('English')),
            ],
          ),
        ],
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
            const SizedBox(height: 24),
            Text(
              l10n.chooseColor,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final option in AutomataColor.values)
                  ChoiceChip(
                    label: Text(colorName(option)),
                    avatar: CircleAvatar(
                      backgroundColor: option.value,
                      radius: 10,
                    ),
                    selected: color == option,
                    onSelected: (_) => setState(() {
                      selectedColor = option;
                    }),
                  ),
              ],
            ),
            const SizedBox(height: 28),
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
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(20, 12, 20, 16),
        child: FilledButton.icon(
          onPressed: color == null
              ? null
              : () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) =>
                        DicePage(color: color, random: widget.random),
                  ),
                ),
          icon: const Icon(Icons.arrow_forward),
          label: Text(l10n.continueToDice),
        ),
      ),
    );
  }
}
