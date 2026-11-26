import '../../../l10n/app_localizations.dart';

import 'package:material_ui/material_ui.dart';

class DolmenSetup {
  const DolmenSetup({required this.pair, required this.requiredDice});

  final String pair;
  final int requiredDice;
}

class DolmenSetupDialog extends StatefulWidget {
  const DolmenSetupDialog({super.key, required this.maxDice});

  final int maxDice;

  @override
  State<DolmenSetupDialog> createState() => _DolmenSetupDialogState();
}

class _DolmenSetupDialogState extends State<DolmenSetupDialog> {
  final TextEditingController pairController = TextEditingController();
  int? requiredDice;

  @override
  void dispose() {
    pairController.dispose();
    super.dispose();
  }

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
            Text(l10n.dolmenInstructions),
            const SizedBox(height: 16),
            TextField(
              key: const Key('dolmen-pair'),
              controller: pairController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: l10n.dolmenPair,
                border: const OutlineInputBorder(),
              ),
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
          onPressed: pairController.text.trim().isEmpty || requiredDice == null
              ? null
              : () => Navigator.of(context).pop(
                  DolmenSetup(
                    pair: pairController.text.trim(),
                    requiredDice: requiredDice!,
                  ),
                ),
          child: Text(l10n.confirm),
        ),
      ],
    );
  }
}
