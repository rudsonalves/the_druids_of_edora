import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

class LaunchIntro extends StatefulWidget {
  const LaunchIntro({super.key, required this.onFinished});

  final VoidCallback onFinished;

  @override
  State<LaunchIntro> createState() => _LaunchIntroState();
}

class _LaunchIntroState extends State<LaunchIntro>
    with SingleTickerProviderStateMixin {
  late final AnimationController animation;
  bool started = false;

  @override
  void initState() {
    super.initState();
    animation =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 1650),
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) widget.onFinished();
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (started) return;
    started = true;
    if (MediaQuery.disableAnimationsOf(context)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) widget.onFinished();
      });
    } else {
      animation.forward();
    }
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = math.min(
              160.0,
              math.min(
                constraints.maxWidth * 0.54,
                constraints.maxHeight * 0.46,
              ),
            );
            final artwork = Image.asset(
              'assets/icons/play-store-icon.png',
              width: size,
              height: size,
              excludeFromSemantics: true,
            );
            return AnimatedBuilder(
              animation: animation,
              builder: (context, _) {
                final time = animation.value;
                final reveal = const Interval(
                  0,
                  0.55,
                  curve: Curves.easeOutCubic,
                ).transform(time);
                final title = const Interval(
                  0.21,
                  0.61,
                  curve: Curves.easeOut,
                ).transform(time);
                final fade =
                    1 -
                    const Interval(
                      0.82,
                      1,
                      curve: Curves.easeIn,
                    ).transform(time);
                return Opacity(
                  opacity: fade,
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.expand,
                    children: [
                      Center(
                        child: CustomPaint(
                          size: Size.square(size * 1.65),
                          painter: _HaloPainter(
                            reveal,
                            theme.colorScheme.primary,
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.translate(
                          offset: Offset(0, -size * 0.13 * reveal),
                          child: Transform.scale(
                            scale: 0.9 + 0.14 * reveal,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(size * 0.15),
                              child: artwork,
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Transform.translate(
                          offset: Offset(0, size * 0.62 + 10 * (1 - title)),
                          child: Opacity(
                            opacity: title,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: Text(
                                'Druids of Edora',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headlineSmall?.copyWith(
                                  color: theme.colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.3,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class _HaloPainter extends CustomPainter {
  const _HaloPainter(this.progress, this.color);

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress == 0) return;
    final center = size.center(Offset.zero).translate(0, -size.height * 0.08);
    final radius = size.width * (0.29 + 0.095 * progress);
    final halo = Paint()
      ..color = color.withValues(alpha: 0.35 * progress)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      math.pi * 2 * progress,
      false,
      halo,
    );
    final spark = Paint()..color = color.withValues(alpha: 0.72 * progress);
    for (var index = 0; index < 8; index++) {
      final angle = index * math.pi / 4 - math.pi / 2 + progress * 0.18;
      final point =
          center +
          Offset(math.cos(angle), math.sin(angle)) *
              (radius + size.width * (index.isEven ? 0.055 : 0.025));
      final tip = index.isEven ? 3.2 : 1.8;
      canvas.drawPath(
        Path()
          ..moveTo(point.dx, point.dy - tip)
          ..lineTo(point.dx + tip * 0.6, point.dy)
          ..lineTo(point.dx, point.dy + tip)
          ..lineTo(point.dx - tip * 0.6, point.dy)
          ..close(),
        spark,
      );
    }
  }

  @override
  bool shouldRepaint(_HaloPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
