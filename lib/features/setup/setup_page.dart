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

  bool get isPortuguese => Localizations.localeOf(context).languageCode == 'pt';

  String label(String pt, String en) => isPortuguese ? pt : en;

  String colorName(AutomataColor color) => switch (color) {
    AutomataColor.purple => label('Roxo', 'Purple'),
    AutomataColor.yellow => label('Amarelo', 'Yellow'),
    AutomataColor.mint => label('Verde-água', 'Mint'),
    AutomataColor.red => label('Vermelho', 'Red'),
  };

  @override
  Widget build(BuildContext context) {
    final color = selectedColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Druids of Edora'),
        actions: [
          PopupMenuButton<Locale>(
            tooltip: label('Idioma', 'Language'),
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
              label('Prepare o Malfurion', 'Prepare Malfurion'),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              label(
                'Autômato não oficial • preparação inicial',
                'Unofficial automa • initial setup',
              ),
            ),
            const SizedBox(height: 24),
            Text(
              label(
                '1. Escolha a cor do autômato',
                '1. Choose the automa color',
              ),
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
              label('2. Prepare os componentes', '2. Prepare the components'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            SetupInstruction(
              number: 1,
              text: label(
                'Prepare o jogo para 2, 3 ou 4 jogadores conforme a quantidade de Malfurions.',
                'Set up the game for 2, 3, or 4 players according to the number of Malfurions.',
              ),
            ),
            SetupInstruction(
              number: 2,
              text: label(
                'Separe os 13 dados, o druida, o marcador de conhecimento, 6 pedras eretas e 6 pedras rúnicas da cor escolhida.',
                'Take all 13 dice, the druid pawn, knowledge marker, 6 standing stones, and 6 runestones in the chosen color.',
              ),
            ),
            SetupInstruction(
              number: 3,
              text: label(
                'Malfurion não usa provisões, tabuleiro individual, tábuas, amuleto ou poções.',
                'Malfurion uses no provisions, player board, tablets, amulet, or potions.',
              ),
            ),
            SetupInstruction(
              number: 4,
              text: label(
                'Você joga por último: escolha seu santuário inicial primeiro. Depois, escolha aleatoriamente um santuário inicial para Malfurion.',
                'You play last: choose your starting shrine first. Then randomly choose a starting shrine for Malfurion.',
              ),
            ),
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
          label: Text(label('Continuar para os dados', 'Continue to dice')),
        ),
      ),
    );
  }
}
