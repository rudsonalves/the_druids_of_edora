import '../../l10n/app_localizations.dart';

import 'dart:async';
import 'dart:math';

import 'package:material_ui/material_ui.dart';

import '../cards/cards_page.dart';
import '../setup/automata_color.dart';
import '../setup/widgets/die_face.dart';

class DicePage extends StatefulWidget {
  const DicePage({super.key, required this.color, required this.random});

  final AutomataColor color;
  final Random random;

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  static const diceCount = 13;
  static const animationFrames = 12;

  Timer? rollTimer;
  List<int> dice = const [];
  bool isRolling = true;
  int frame = 0;

  @override
  void initState() {
    super.initState();
    dice = _roll();
    rollTimer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (!mounted) return;
      setState(() {
        frame++;
        if (frame >= animationFrames) {
          dice = _roll()..sort();
          isRolling = false;
          timer.cancel();
        } else {
          dice = _roll();
        }
      });
    });
  }

  List<int> _roll() =>
      List.generate(diceCount, (_) => widget.random.nextInt(6) + 1);

  @override
  void dispose() {
    rollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.malfurionDice)),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              l10n.malfurionDice,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(isRolling ? l10n.rollingDice : l10n.sortedDice),
            const SizedBox(height: 24),
            LayoutBuilder(
              builder: (context, constraints) {
                final columns = (constraints.maxWidth / 76).floor().clamp(3, 6);
                return GridView.builder(
                  key: const Key('dice-grid'),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: diceCount,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) => Center(
                    child: DieFace(
                      value: dice[index],
                      color: widget.color.value,
                      index: index + 1,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            if (!isRolling) Text(l10n.automaticDice),
          ],
        ),
      ),
      bottomNavigationBar: isRolling
          ? null
          : SafeArea(
              minimum: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              child: FilledButton.icon(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => CardsPage(
                      color: widget.color,
                      dice: List.unmodifiable(dice),
                      random: widget.random,
                    ),
                  ),
                ),
                icon: const Icon(Icons.arrow_forward),
                label: Text(l10n.continueToCards),
              ),
            ),
    );
  }
}
