import '../../../l10n/app_localizations.dart';

import 'package:material_ui/material_ui.dart';

class DieFace extends StatelessWidget {
  const DieFace({
    super.key,
    required this.value,
    required this.color,
    required this.index,
    this.size = 58,
  });

  final int value;
  final Color color;
  final int index;
  final double size;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Semantics(
      label: l10n.dieSemantics(index, value),
      child: ExcludeSemantics(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(size * 0.17),
            border: Border.all(color: Colors.black26),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                offset: Offset(1, 2),
              ),
            ],
          ),
          child: CustomPaint(painter: _PipsPainter(value)),
        ),
      ),
    );
  }
}

class _PipsPainter extends CustomPainter {
  const _PipsPainter(this.value);

  final int value;

  static const positions = {
    1: [Offset(0.5, 0.5)],
    2: [Offset(0.25, 0.25), Offset(0.75, 0.75)],
    3: [Offset(0.25, 0.25), Offset(0.5, 0.5), Offset(0.75, 0.75)],
    4: [
      Offset(0.25, 0.25),
      Offset(0.75, 0.25),
      Offset(0.25, 0.75),
      Offset(0.75, 0.75),
    ],
    5: [
      Offset(0.25, 0.25),
      Offset(0.75, 0.25),
      Offset(0.5, 0.5),
      Offset(0.25, 0.75),
      Offset(0.75, 0.75),
    ],
    6: [
      Offset(0.25, 0.25),
      Offset(0.75, 0.25),
      Offset(0.25, 0.5),
      Offset(0.75, 0.5),
      Offset(0.25, 0.75),
      Offset(0.75, 0.75),
    ],
  };

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFF303334);
    for (final position in positions[value] ?? const <Offset>[]) {
      canvas.drawCircle(
        Offset(position.dx * size.width, position.dy * size.height),
        size.width * 0.07,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_PipsPainter oldDelegate) => value != oldDelegate.value;
}
