import 'dart:math';
import 'package:flutter/material.dart';
import 'package:progress_indicators/widgets/circular/gradient_circular_progress_widget.dart';

enum ProgressTextPositions { center, below }
enum ProgressTextModes { percentOnly, textOnly, textWithPercent }

class CustomCircularProgress extends StatelessWidget {
  final double value;

  /// Visual scale
  final double scale;

  /// Stroke
  final double strokeWidth;

  /// Colors
  final Color backgroundColor;
  final Color progressColor;
  final Gradient? gradient;

  /// Text
  final bool showText;
  final String? text;
  final ProgressTextModes textMode;
  final ProgressTextPositions textPosition;
  final TextStyle? textStyle;
  final double? spaceBetween;

  const CustomCircularProgress({
    super.key,
    required this.value,
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

  SweepGradient? _safeGradient() {
    if (gradient == null) return null;

    if (gradient is SweepGradient) {
      return gradient as SweepGradient;
    }

    final colors = gradient!.colors;
    return SweepGradient(
      startAngle: -pi / 2,
      endAngle: 3 * pi / 2,
      colors: [...colors, colors.first], // 👈 loop close
    );
  }

  @override
  Widget build(BuildContext context) {
    final progress = value.clamp(0.0, 1.0);
    final percent = "${(progress * 100).toInt()}%";

    String displayText = switch (textMode) {
      ProgressTextModes.percentOnly => percent,
      ProgressTextModes.textOnly => text ?? "",
      ProgressTextModes.textWithPercent => "${text ?? ""} $percent",
    };

    final circle = Transform.scale(
      scale: scale,
      child: CustomPaint(
        size: const Size(80, 80),
        painter: GradientCircularProgressWidget(
          progress: progress,
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          progressColor: progressColor,
          gradient: _safeGradient(),
        ),
      ),
    );

    if (showText && textPosition == ProgressTextPositions.below) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circle,
          SizedBox(height: spaceBetween),
          Text(
            displayText,
            textAlign: TextAlign.center,
            style: textStyle ??
                const TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      );
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        circle,
        if (showText && textPosition == ProgressTextPositions.center)
          Text(
            displayText,
            textAlign: TextAlign.center,
            style: textStyle ??
                const TextStyle(fontWeight: FontWeight.bold),
          ),
      ],
    );
  }
}
