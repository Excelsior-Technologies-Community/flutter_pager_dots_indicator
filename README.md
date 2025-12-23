# Pager Dots Indicator

A highly customizable **Pager Dots Indicator** for Flutter with  
✨ multiple animations  
✨ multiple dot shapes  
✨ click / tap navigation  
✨ library-ready clean API  

Perfect for **PageView**, **Onboarding screens**, **Carousels**, and **Sliders**.

---

## ✨ Features

✅ Multiple indicator styles  
- Basic  
- Expanding  
- Worm  
- Slide  

✅ Multiple dot shapes  
- Circle  
- Square  
- Rounded Square  
- Pill  
- Diamond  
- Triangle 🔺  
- Star ⭐  
- Linear (Bar) ━━━  

✅ Tap on dots to navigate pages  
✅ Smooth animations  
✅ Fully customizable  

---

## 📸 Preview
![pager_dots_indicators](https://github.com/user-attachments/assets/f16a0d96-be0c-480d-9c93-5a5091017622)

---

## 📦 Installation
### Add this to your pubspec.yaml:
```yaml
dependencies:
  pager_dots_indicator:
    path:
      url: '.../flutter_pager_dots_indicator/pager_dots_indicator' ## your path
```
### Using GitHub (recommended during development):
```yaml
dependencies:
  pager_dots_indicator:
    git:
      url: https://github.com/YOUR_USERNAME/pager_dots_indicator.git
```
### Import the package:
```dart
import 'package:pager_dots_indicator/pager_dots_indicator.dart';
```
---

## 🚀 Basic Usage
```dart
PagerDotsIndicator(
  itemCount: 5,
  position: currentPage,
)
```

## 🎯 With PageView (Recommended)
```dart
final PageController controller = PageController();
double currentPage = 0;

@override
void initState() {
  super.initState();
  controller.addListener(() {
    setState(() {
      currentPage = controller.page ?? 0;
    });
  });
}
```
```dart
PagerDotsIndicator(
  itemCount: 5,
  position: currentPage,
  onDotClicked: (index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  },
)
```

## ⚙️ Full Customization Example
```dart
PagerDotsIndicator(
  itemCount: 5,
  position: currentPage,
  type: PagerIndicatorType.expanding,
  dotShape: DotShape.triangle,
  dotSize: 18,
  spacing: 16,
  activeColor: Colors.blue,
  inactiveColor: Colors.grey,
  onDotClicked: (index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  },
)
```

---
## 📚 Public API
| Property        | Description              |
| --------------- | ------------------------ |
| `itemCount`     | Total number of pages    |
| `position`      | Current page position    |
| `type`          | Indicator animation type |
| `dotShape`      | Shape of dots            |
| `dotSize`       | Size of dots             |
| `spacing`       | Space between dots       |
| `activeColor`   | Active dot color         |
| `inactiveColor` | Inactive dot color       |
| `onDotClicked`  | Tap callback             |

---

## 🏗 Folder Structure
``` css
lib/
 ├─ pager_dots_indicator.dart
 └─ src/
     └─ pager_indicator/
         ├─ pager_dots_indicator.dart
         ├─ indicator_type.dart
         ├─ dot_shape.dart
         ├─ dot_widget.dart
         ├─ custom_dot_painter.dart
         └─ indicators/
             ├─ basic_dots.dart
             ├─ expanding_dots.dart
             ├─ worm_dots.dart
             └─ slide_dots.dart
```

---
## 📄 License
```text
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
