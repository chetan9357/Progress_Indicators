import 'package:flutter/material.dart';
import 'custom_linear_progress.dart';

class AnimatedLinearProgress extends StatelessWidget {
  /// Target value (0.0 → 1.0)
  final double value;

  /// Animation
  final Duration duration;
  final Curve curve;

  /// Pass-through (NO CHANGE)
  final double height;
  final Color backgroundColor;
  final Color progressColor;
  final LinearGradient? gradient;
  final double radius;

  final bool showText;
  final String? text;
  final ProgressTextMode textMode;
  final ProgressTextPosition textPosition;
  final TextStyle? textStyle;

  const AnimatedLinearProgress({
    super.key,
    required this.value,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutCubic,

    // pass-through
    this.height = 10,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = Colors.blue,
    this.gradient,
    this.radius = 6,
    this.showText = true,
    this.text,
    this.textMode = ProgressTextMode.percentOnly,
    this.textPosition = ProgressTextPosition.center,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value),
      duration: duration,
      curve: curve,
      builder: (context, animatedValue, _) {
        return CustomLinearProgress(
          value: animatedValue,
          height: height,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          gradient: gradient,
          radius: radius,
          showText: showText,
          text: text,
          textMode: textMode,
          textPosition: textPosition,
          textStyle: textStyle,
        );
      },
    );
  }
}
