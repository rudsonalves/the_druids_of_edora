import 'package:material_ui/material_ui.dart';

class DolmenSetup {
  const DolmenSetup({required this.pair, required this.requiredDice});

  final String pair;
  final int requiredDice;
}

class DolmenSetupDialog extends StatefulWidget {
  const DolmenSetupDialog({
    super.key,
    required this.isPortuguese,
    required this.maxDice,
  });

  final bool isPortuguese;
  final int maxDice;

  @override
  State<DolmenSetupDialog> createState() => _DolmenSetupDialogState();
}

class _DolmenSetupDialogState extends State<DolmenSetupDialog> {
  final TextEditingController pairController = TextEditingController();
  int? requiredDice;

  String label(String pt, String en) => widget.isPortuguese ? pt : en;

  @override
  void dispose() {
    pairController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(label('Conectar 2 dolmens', 'Connect 2 dolmens')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label(
                'Identifique o par de dolmens e informe quantos dados ainda precisam ser colocados no caminho.',
                'Identify the dolmen pair and choose how many dice still need to be placed along the path.',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              key: const Key('dolmen-pair'),
              controller: pairController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                labelText: label(
                  'Par de dolmens (cor ou nome)',
                  'Dolmen pair (color or name)',
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Text(label('Dados necessários', 'Dice needed')),
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
          child: Text(label('Cancelar', 'Cancel')),
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
          child: Text(label('Confirmar', 'Confirm')),
        ),
      ],
    );
  }
}
