import 'dart:ui' show ImageFilter;

import 'package:material_ui/material_ui.dart';

class ForestSurface extends StatelessWidget {
  const ForestSurface({super.key, required this.child, this.showPanel = true});

  final Widget child;
  final bool showPanel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'assets/backgrounds/forest-floor.png',
          fit: BoxFit.cover,
          excludeFromSemantics: true,
        ),
        const ColoredBox(color: Color(0x33102B28)),
        if (showPanel)
          const Positioned.fill(
            left: 10,
            right: 10,
            top: 8,
            bottom: 8,
            child: ForestGlass(child: SizedBox.expand()),
          ),
        child,
      ],
    );
  }
}

class ForestGlass extends StatelessWidget {
  const ForestGlass({
    super.key,
    required this.child,
    this.radius = 24,
    this.borderColor = const Color(0x44E2BD77),
  });

  final Widget child;
  final double radius;
  final Color borderColor;

  static final _blur = ImageFilter.blur(sigmaX: 14, sigmaY: 14);

  @override
  Widget build(BuildContext context) {
    const tint = Color(0xFF102B28);
    final borderRadius = BorderRadius.circular(radius);
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: _blur,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            border: Border.all(color: borderColor),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                tint.withValues(alpha: 0.54),
                tint.withValues(alpha: 0.76),
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
