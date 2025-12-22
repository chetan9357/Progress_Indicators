# 🚀 Progress Indicators

A powerful and flexible Flutter library that provides **custom linear and circular progress indicators**
with support for **gradient colors, text & percentage overlays, and smooth animations**.

This package is ideal for:
- File download / upload progress
- API loading indicators
- Task completion UI
- Modern, animated app experiences

---

## ✨ Features

✅ Custom Linear Progress Bar  
✅ Custom Circular Progress Indicator (CustomPainter based)  
✅ Gradient or solid color support  
✅ Text & percentage display:
- `66%`
- `Downloading`
- `Downloading... 66%`  
✅ Text position:
- Center
- Below indicator  
✅ Smooth animation (wrapper-based, best practice)  
✅ No platform-specific code (Android + iOS supported)  
✅ Production-ready & pub.dev style architecture  

---

## 📦 Package Structure

```text
lib/
├── widgets/
│   ├── circular/
│   │   ├── custom_circular_progress.dart
│   │   ├── gradient_circular_progress_widget.dart
│   │   └── animated_circular_progress.dart
│   │
│   ├── linear/
│   │   ├── custom_linear_progress.dart
│   │   └── animated_linear_progress.dart
│
└── progress_indicators.dart
```
## 📥 Installation
### Add this to your pubspec.yaml:
```
dependencies:
  progress_indicators:
    path:
      url: '.../progress_indicators/progress_indicators' ## your path
```
### Using GitHub (recommended during development)
```
dependencies:
  progress_indicators:
    git:
      url: https://github.com/YOUR_USERNAME/progress_indicators.git
```
### Import the library:
```
import 'package:progress_indicators/progress_indicators.dart';
```

## 🟦 Linear Progress Usage
### 🔹 Static Linear Progress
```
CustomLinearProgress(
  value: 0.6,
  text: "Downloading...",
  textMode: ProgressTextMode.textWithPercent,
  textPosition: ProgressTextPosition.below,
);
```
### 🔹 Gradient Linear Progress
```
CustomLinearProgress(
  value: 0.8,
  gradient: const LinearGradient(
    colors: [Colors.green, Colors.yellow, Colors.red],
  ),
  text: "Downloading...",
  textMode: ProgressTextMode.textWithPercent,
);
```
### 🔹 Animated Linear Progress
```
AnimatedLinearProgress(
  value: downloadProgress,
  height: 30,
  gradient: const LinearGradient(
    colors: [Colors.green, Colors.blue],
  ),
  text: "Downloading...",
  textMode: ProgressTextMode.textWithPercent,
  textPosition: ProgressTextPosition.below,
);
```
## 🔵 Circular Progress Usage
### 🔹 Static Circular Progress
```
CustomCircularProgress(
  value: 0.5,
  progressColor: Colors.blue,
  text: "50%",
);
```
### 🔹 Gradient Circular Progress
```
CustomCircularProgress(
  value: 0.75,
  gradient: const LinearGradient(
    colors: [Colors.red, Colors.yellow],
  ),
  text: "Downloading...",
  textMode: ProgressTextModes.textWithPercent,
);
```
### 🔹 Animated Circular Progress
```
AnimatedCircularProgress(
  value: downloadProgress,
  scale: 0.6,
  gradient: const LinearGradient(
    colors: [Colors.red, Colors.orange],
  ),
  text: "Downloading...",
  textMode: ProgressTextModes.textWithPercent,
  textPosition: ProgressTextPositions.below,
);
```
## 🎞 Demo

https://github.com/user-attachments/assets/fef79db6-6b80-4129-af26-623bf4e0bd05

o (Video)

### Recommended demo content:
- Animated linear progress
- Animated circular progress
- Gradient + text overlay
- Download progress from 0% → 100%

## ⚙️ Animation Details
- Uses TweenAnimationBuilder
- Smooth default curve: Curves.easeOutCubic
- No AnimationController boilerplate
- Clean separation between UI & animation
### Users can customize:
- Animation duration
- Animation curve

## 🧪 Ideal Use Cases
- 📥 File download progress
- 📤 Upload indicators
- 🔄 API loading
- 📊 Task completion
- 🎮 Game progress UI
## 📜 License
```
Copyright (c) 2025 Excelsior Technologies

Permission is hereby granted, free of charge, to any person obtaining a copy  
of this software and associated documentation files (the "Software"), to deal  
in the Software without restriction, including without limitation the rights  
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell  
copies of the Software, and to permit persons to whom the Software is  
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all  
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED **"AS IS"**, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
```
