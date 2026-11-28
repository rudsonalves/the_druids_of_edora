import 'package:material_ui/material_ui.dart';

import '../../../l10n/app_localizations.dart';
import '../../setup/automata_color.dart';
import '../sickle_amulet.dart';

class AmuletDialog extends StatefulWidget {
  const AmuletDialog({
    super.key,
    required this.progress,
    required this.color,
    this.onChooseRow,
  });

  final SickleAmulet progress;
  final AutomataColor color;
  final bool Function(int)? onChooseRow;

  @override
  State<AmuletDialog> createState() => _AmuletDialogState();
}

class _AmuletDialogState extends State<AmuletDialog> {
  // Slot centers normalized to the source image, from row I to III.
  static const _centers = [
    Offset(0.315, 0.78),
    Offset(0.693, 0.78),
    Offset(0.171, 0.515),
    Offset(0.827, 0.515),
    Offset(0.311, 0.26),
    Offset(0.693, 0.26),
  ];

  bool placedGem = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final progress = widget.progress;
    final onChooseRow = widget.onChooseRow;
    final readOnly = onChooseRow == null;
    return AlertDialog(
      title: Text(readOnly ? l10n.summaryAmulet : l10n.chooseAmulet),
      content: SizedBox(
        width: 360,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 12,
            children: [
              if (progress.amuletComplete)
                Text(l10n.amuletComplete)
              else if (!readOnly && !placedGem)
                Text(l10n.amuletSlotHelp),
              AspectRatio(
                aspectRatio: 2330 / 1782,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;
                    final height = constraints.maxHeight;
                    final gemSize = width * 0.2016;
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          widget.color.medallionAsset,
                          fit: BoxFit.contain,
                          excludeFromSemantics: true,
                        ),
                        for (final (index, center) in _centers.indexed)
                          if (progress.gemAt(index) case final gem?)
                            Positioned(
                              left: center.dx * width - gemSize / 2,
                              top: center.dy * height - gemSize / 2,
                              child: Image.asset(
                                gem.asset,
                                width: gemSize,
                                height: gemSize,
                                excludeFromSemantics: true,
                              ),
                            ),
                        if (onChooseRow != null)
                          for (
                            var row = 0;
                            row < SickleAmulet.positions.length;
                            row++
                          )
                            Positioned(
                              key: ValueKey('amulet-row-$row'),
                              left: 0,
                              right: 0,
                              top: (_centers[row * 2].dy - 0.125) * height,
                              height: height * 0.25,
                              child: Semantics(
                                button: true,
                                label: SickleAmulet.positions[row],
                                child: InkWell(
                                  onTap:
                                      placedGem ||
                                          progress.firstFreeSlot(row) == null
                                      ? null
                                      : () {
                                          if (onChooseRow(row)) {
                                            setState(() => placedGem = true);
                                          }
                                        },
                                ),
                              ),
                            ),
                      ],
                    );
                  },
                ),
              ),
              if (!readOnly && !placedGem && progress.secondPositionFull)
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text(l10n.amuletUseSickle),
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            readOnly || placedGem ? l10n.closeInventory : l10n.cancel,
          ),
        ),
      ],
    );
  }
}
