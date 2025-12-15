import 'package:flutter/material.dart';
import 'package:progress_indicators/widgets/circular/animated_circular_progress.dart';
import 'package:progress_indicators/widgets/circular/custom_circular_progress.dart';
import 'package:progress_indicators/widgets/linear/animated_linear_progress.dart';
import 'package:progress_indicators/widgets/linear/custom_linear_progress.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Example(),
    );
  }
}

class Example extends StatefulWidget {
  const Example({super.key});

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  final ValueNotifier<double> downloadProgress = ValueNotifier(0.0);

  @override
  void initState() {
    super.initState();
    startFakeDownload(); // demo
  }

  void startFakeDownload() async {
    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 80));
      downloadProgress.value = i / 100; // 0.0 → 1.0
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ValueListenableBuilder<double>(
              valueListenable: downloadProgress,
              builder: (context, value, _) {
                return CustomLinearProgress(
                  value: value,
                  height: 30,
                  progressColor: Colors.green,
                  text: 'downloading...',
                  radius: 20,
                  textPosition: ProgressTextPosition.center,
                  textMode: ProgressTextMode.textWithPercent,
                  textStyle: TextStyle(fontSize: 20),
                );
              },
            ),

            SizedBox(height: 50),
            ValueListenableBuilder<double>(
              valueListenable: downloadProgress,
              builder: (context, value, _) {
                return CustomCircularProgress(
                  value: value,
                  scale: 1,
                  textMode: ProgressTextModes.percentOnly,
                  textPosition: ProgressTextPositions.center,
                  spaceBetween: 6,
                  strokeWidth: 20,
                );
              },
            ),
            SizedBox(height: 50),
            ValueListenableBuilder<double>(
              valueListenable: downloadProgress,
              builder: (context, value, _) {
                return AnimatedLinearProgress(
                  value: value,
                  height: 30,
                  radius: 20,
                  duration: Duration(seconds: 5),
                  curve: Curves.bounceInOut,
                  gradient: const LinearGradient(
                    colors: [Colors.green, Colors.red],
                  ),
                  text: "uploading...",
                  textMode: ProgressTextMode.textWithPercent,
                  textPosition: ProgressTextPosition.below,
                );
              },
            ),
            SizedBox(height: 50),
            ValueListenableBuilder<double>(
              valueListenable: downloadProgress,
              builder: (context, value, _) {
                return AnimatedCircularProgress(
                  value: value,
                  text: "uploading...",
                  scale: 1,
                  strokeWidth: 20,
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceIn,
                  textMode: ProgressTextModes.textWithPercent,
                  textPosition: ProgressTextPositions.below,
                  gradient: const LinearGradient(
                    colors: [Colors.red, Colors.yellow],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
