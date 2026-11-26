import '../../../l10n/app_localizations.dart';

import 'package:material_ui/material_ui.dart';

enum DolmenPair {
  pink,
  orange,
  blue,
  green,
  brown,
  black;

  String get asset => 'assets/dolmens/dolmen-$name.png';

  String label(AppLocalizations l10n) => switch (this) {
    pink => l10n.dolmenPink,
    orange => l10n.dolmenOrange,
    blue => l10n.dolmenBlue,
    green => l10n.dolmenGreen,
    brown => l10n.dolmenBrown,
    black => l10n.dolmenBlack,
  };
}

class DolmenSetup {
  const DolmenSetup({required this.pair, required this.requiredDice});

  final DolmenPair pair;
  final int requiredDice;
}

class DolmenSetupDialog extends StatefulWidget {
  const DolmenSetupDialog({
    super.key,
    required this.maxDice,
    required this.pairs,
  });

  final List<DolmenPair> pairs;

  final int maxDice;

  @override
  State<DolmenSetupDialog> createState() => _DolmenSetupDialogState();
}

class _DolmenSetupDialogState extends State<DolmenSetupDialog> {
  DolmenPair? pair;
  int? requiredDice;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.connectDolmensTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.cardConnectDolmensTarget),
            const SizedBox(height: 12),
            Text(l10n.dolmenInstructions),
            const SizedBox(height: 16),
            Text(l10n.dolmenPair),
            Wrap(
              spacing: 8,
              children: [
                for (final option in widget.pairs)
                  ChoiceChip(
                    key: Key('dolmen-pair-${option.name}'),
                    avatar: Image.asset(option.asset, width: 24),
                    label: Text(option.label(l10n)),
                    selected: pair == option,
                    onSelected: (_) => setState(() => pair = option),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(l10n.requiredDice),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (var count = 1; count <= widget.maxDice; count++)
                  ChoiceChip(
                    key: Key('dolmen-count-$count'),
                    label: Text('$count'),
                    selected: requiredDice == count,
                    onSelected: (_) => setState(() => requiredDice = count),
                  ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.cancel),
        ),
        FilledButton(
          onPressed: pair == null || requiredDice == null
              ? null
              : () => Navigator.of(context)
                    .pop(DolmenSetup(pair: pair!, requiredDice: requiredDice!)),
          child: Text(l10n.confirm),
        ),
      ],
    );
  }
}
