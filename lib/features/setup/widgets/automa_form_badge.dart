import 'package:material_ui/material_ui.dart';

import '../../cards/automa_card.dart';

class AutomaFormBadge extends StatelessWidget {
  const AutomaFormBadge({super.key, required this.form});

  final AutomaForm form;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: const Size.square(32),
    painter: _FormPainter(
      form,
      Theme.of(context).colorScheme.primary,
      const Color(0xFF183A32),
    ),
  );
}

class _FormPainter extends CustomPainter {
  const _FormPainter(this.form, this.gold, this.green);

  final AutomaForm form;
  final Color gold;
  final Color green;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 32, size.height / 32);
    final paint = Paint()..color = gold;
    canvas.drawCircle(const Offset(16, 16), 16, paint);
    paint.color = green;

    if (form == AutomaForm.druid) {
      final hood = Path()
        ..moveTo(16, 5)
        ..quadraticBezierTo(8, 10, 6, 24)
        ..quadraticBezierTo(16, 29, 26, 24)
        ..quadraticBezierTo(24, 10, 16, 5)
        ..close();
      canvas.drawPath(hood, paint);
      paint.color = gold;
      canvas.drawPath(
        Path()
          ..moveTo(16, 12)
          ..quadraticBezierTo(12, 15, 11, 22)
          ..quadraticBezierTo(16, 24, 21, 22)
          ..quadraticBezierTo(20, 15, 16, 12)
          ..close(),
        paint,
      );
    } else {
      canvas.drawCircle(const Offset(8, 9), 4, paint);
      canvas.drawCircle(const Offset(24, 9), 4, paint);
      canvas.drawOval(const Rect.fromLTRB(6, 8, 26, 26), paint);
      paint.color = gold;
      canvas.drawCircle(const Offset(12, 15), 1.2, paint);
      canvas.drawCircle(const Offset(20, 15), 1.2, paint);
      canvas.drawOval(const Rect.fromLTRB(12, 18, 20, 23), paint);
      paint.color = green;
      canvas.drawCircle(const Offset(16, 19.6), 1.1, paint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_FormPainter old) =>
      form != old.form || gold != old.gold || green != old.green;
}
