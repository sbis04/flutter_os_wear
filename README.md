# Flutter OS (Android WearOS app)

This is an app for WearOS devices which is inspired from the Medium article written by [Matt Sullivan](https://medium.com/@mjohnsullivan), ["Experimenting with Flutter on Wear OS"](https://medium.com/@mjohnsullivan/experimenting-with-flutter-on-wear-os-f789d843f2ef). This article really helped me to understand, how to manage the screen size of the app properly and inheriting it to different classes.

In this app, I tried to optimize the [relax](https://github.com/erinmorrissey/relax) app created by Erin Morrissey (made as a Flutter Create Submission 2019), to run on WearOS devices.

The wear app has two modes:

1) Normal Mode
2) Ambient Mode (which is the battery saving mode)

You can checkout some snaps of the app below.

## Screenshots



## App in Action



## Plugin

The plugin used in this project is ["wear"](https://pub.dev/packages/wear).

Add this to your package's pubspec.yaml file to use wear:
```
dependencies:
  wear: ^0.0.3
```
Import using:
```dart
import 'package:wear/wear.dart';
```

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
