import 'package:flutter/material.dart';
import 'custom_circular_progress.dart';

class AnimatedCircularProgress extends StatelessWidget {
  /// Target value (0.0 → 1.0)
  final double value;

  /// Animation
  final Duration duration;
  final Curve curve;

  /// Pass-through (NO CHANGE)
  final double scale;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final Gradient? gradient;

  final bool showText;
  final String? text;
  final ProgressTextModes textMode;
  final ProgressTextPositions textPosition;
  final TextStyle? textStyle;
  final double? spaceBetween;

  const AnimatedCircularProgress({
    super.key,
    required this.value,
    this.duration = const Duration(milliseconds: 600),
    this.curve = Curves.easeOutCubic,

    // pass-through
    this.scale = 0.6,
    this.strokeWidth = 10,
    this.backgroundColor = const Color(0xFFE0E0E0),
    this.progressColor = Colors.blue,
    this.gradient,
    this.showText = true,
    this.text,
    this.textMode = ProgressTextModes.percentOnly,
    this.textPosition = ProgressTextPositions.center,
    this.textStyle,
    this.spaceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: value),
      duration: duration,
      curve: curve,
      builder: (context, animatedValue, _) {
        return CustomCircularProgress(
          value: animatedValue,
          scale: scale,
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          gradient: gradient,
          showText: showText,
          text: text,
          textMode: textMode,
          textPosition: textPosition,
          textStyle: textStyle,
          spaceBetween: spaceBetween,
        );
      },
    );
  }
}
