import 'package:flutter/material.dart';

enum ProgressTextPosition {
  center,
  below,
}

enum ProgressTextMode {
  percentOnly,
  textOnly,
  textWithPercent,
}

class CustomLinearProgress extends StatelessWidget {
  /// Progress value (0.0 → 1.0)
  final double value;

  /// Height of progress bar
  final double height;

  /// Background color
  final Color backgroundColor;

  /// Solid progress color
  final Color progressColor;

  /// Gradient progress
  final LinearGradient? gradient;

  /// Border radius
  final double radius;

  /// Show text or not
  final bool showText;

  /// Downloading / custom text
  final String? text;

  /// Text display mode
  final ProgressTextMode textMode;

  /// Text position (center / below)
  final ProgressTextPosition textPosition;

  /// Text style
  final TextStyle? textStyle;

  const CustomLinearProgress({
    super.key,
    required this.value,
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
    final progress = value.clamp(0.0, 1.0);
    final percent = "${(progress * 100).toInt()}%";

    String displayText = "";
    switch (textMode) {
      case ProgressTextMode.percentOnly:
        displayText = percent;
        break;
      case ProgressTextMode.textOnly:
        displayText = text ?? "";
        break;
      case ProgressTextMode.textWithPercent:
        displayText = "${text ?? ""} $percent";
        break;
    }

    final progressBar = LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.center,
          children: [
            /// Background
            Container(
              width: constraints.maxWidth,
              height: height,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),

            /// Progress
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: constraints.maxWidth * progress,
                height: height,
                decoration: BoxDecoration(
                  color: gradient == null ? progressColor : null,
                  gradient: gradient,
                  borderRadius: BorderRadius.circular(radius),
                ),
              ),
            ),

            /// CENTER TEXT
            if (showText && textPosition == ProgressTextPosition.center)
              Text(
                displayText,
                style: textStyle ??
                    TextStyle(
                      fontSize: height,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
              ),
          ],
        );
      },
    );

    /// BELOW TEXT
    if (showText && textPosition == ProgressTextPosition.below) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          progressBar,
          const SizedBox(height: 6),
          Text(
            displayText,
            style: textStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      );
    }

    return progressBar;
  }
}
