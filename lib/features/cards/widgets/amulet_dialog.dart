import 'package:material_ui/material_ui.dart';

import '../../../l10n/app_localizations.dart';
import '../sickle_amulet.dart';

class AmuletDialog extends StatelessWidget {
  const AmuletDialog({super.key, required this.progress});

  final SickleAmulet progress;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return AlertDialog(
      title: Text(l10n.chooseAmulet),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.amuletSlotHelp),
            for (var position = 0; position < 3; position++)
              Wrap(
                spacing: 8,
                children: [
                  for (var slot = position * 2; slot < position * 2 + 2; slot++)
                    OutlinedButton(
                      onPressed: progress.occupied(slot)
                          ? null
                          : () => Navigator.pop(context, slot),
                      child: Text(SickleAmulet.slotName(slot)),
                    ),
                ],
              ),
            if (progress.secondPositionFull)
              TextButton(
                onPressed: () => Navigator.pop(context, -1),
                child: Text(l10n.amuletUseSickle),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(l10n.cancel),
        ),
      ],
    );
  }
}
