# Flutter OS (Android Wear OS app)

<p align="center">
  <img src="https://github.com/sbis04/flutter_os_wear/blob/master/screenshots/wear_cover.png">
</p>

### **Checkout my Medium article ["Flutter: Building Wear OS app"](https://medium.com/flutter-community/flutter-building-wearos-app-fedf0f06d1b4).**

First of all I want to state that it is not an OS, it is just an app.

This is an app for Wear OS devices which is inspired from the Medium article written by [Matt Sullivan](https://medium.com/@mjohnsullivan), ["Experimenting with Flutter on Wear OS"](https://medium.com/@mjohnsullivan/experimenting-with-flutter-on-wear-os-f789d843f2ef). This article really helped me to understand, how to manage the screen size of the app properly and inheriting it to different classes.

In this app, I tried to optimize the [relax](https://github.com/erinmorrissey/relax) app created by Erin Morrissey (made as a Flutter Create Submission 2019, which got nominated for Visual Beauty), to run on Wear OS devices.

The wear app has two modes:
1) Normal Mode
2) Ambient Mode (which is the battery saving mode)

You can checkout some snaps of the app below.

## Screenshots

<p align="left">
  <img src="https://github.com/sbis04/flutter_os_wear/blob/master/screenshots/flt_1.png">
</p>

## App in Action

<p align="left">
  <img src="https://github.com/sbis04/flutter_os_wear/blob/master/screenshots/final_watch.gif">
</p>

## Plugin

The plugin used in this project is ["wear"](https://pub.dev/packages/wear).

Add this to your package's pubspec.yaml file to use wear:
```yaml
dependencies:
  wear: ^0.0.3
```
Import using:
```dart
import 'package:wear/wear.dart';
```

# Set Up (Important)

Matt has already discussed, in his GitHub project of [flutter_wear_plugin](https://github.com/mjohnsullivan/flutter_wear_plugin), how to set up the project for Flutter Wear OS apps. But, I faced a lot of difficulty while following the steps. So, I recommend that you clone my project or Matt's example project and then work on it, after deleting the UI files which you don't require, because in this way you do not need to set up the whole project which consumes a huge amount of time and you will face a lot of challenges.

I am again stating the set up process below (not recommended):

## App Gradle File

Change the min SDK version to API 23:

```
minSdkVersion 23
```

Then, add the following dependencies to the Android Gradle file for the app:

```
dependencies {
    // Wear libraries
    implementation 'com.android.support:wear:27.1.1'
    implementation 'com.google.android.support:wearable:2.3.0'
    compileOnly 'com.google.android.wearable:wearable:2.3.0'
}
```

## Manifest File

Add the following to your AndroidManifest.xml file:

```xml
<!-- Required for ambient mode support -->
<uses-permission android:name="android.permission.WAKE_LOCK" />

<!-- Flags the app as a Wear app -->
<uses-feature android:name="android.hardware.type.watch" />

<!-- Flags that the app doesn't require a companion phone app -->
<application>
<meta-data
    android:name="com.google.android.wearable.standalone"
    android:value="true" />
</application>
```

## Update Android's MainActivity

The ambient mode widget needs some initialization in Android's MainActivity code. Update your code as follows:

```kotlin
class MainActivity: FlutterActivity(), AmbientMode.AmbientCallbackProvider {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    // Wire up the activity for ambient callbacks
    AmbientMode.attachAmbientSupport(this)
  }

  override fun getAmbientCallback(): AmbientMode.AmbientCallback {
    return FlutterAmbientCallback(getChannel(flutterView))
  }
}
```

# Conclusion

After creating this project, I admit that Flutter is not optimized for Wear OS devices till now as many of the simple things are not working on Wear OS like all material Icons which are included in Flutter are not displaying on Wear OS devices, instead a Placeholder image is getting displayed. For this reason, I had to download the material Icons for the [Material Design website](https://material.io/tools/icons) and add it to assets.

Though after facing a lot of difficulties I have finally done this project.

If you like the project please give star ⭐️.

# License

Copyright (c) 2019 Souvik Biswas

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.