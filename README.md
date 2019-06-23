# Flutter OS (Android WearOS app)

First of all I want to state that it is not an OS, it is just an app.

This is an app for WearOS devices which is inspired from the Medium article written by [Matt Sullivan](https://medium.com/@mjohnsullivan), ["Experimenting with Flutter on Wear OS"](https://medium.com/@mjohnsullivan/experimenting-with-flutter-on-wear-os-f789d843f2ef). This article really helped me to understand, how to manage the screen size of the app properly and inheriting it to different classes.

In this app, I tried to optimize the [relax](https://github.com/erinmorrissey/relax) app created by Erin Morrissey (made as a Flutter Create Submission 2019, which got nominated for Visual Beauty), to run on WearOS devices.

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

# Set Up (Important)

Matt has already discussed, in his GitHub project of [flutter_wear_plugin](https://github.com/mjohnsullivan/flutter_wear_plugin), how to set up the project for Flutter WearOS apps. But, I faced a lot of difficulty while following the steps. So, I recommend that you clone my project or Matt's example project and then work on it, after deleting the UI files which you don't require, because in this way you do not need to set up the whole project which consumes a huge amount of time and you will face a lot of challenges.

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

After creating this project, I admit that Flutter is not optimized for WearOS devices till now as many of the simple things are not working on WearOS like all material Icons which are included in Flutter are not displaying on WearOS devices, instead a Placeholder image is getting displayed. For this reason, I had to download the material Icons for the Material Design website and add it to assets.

Though after facing a lot of difficulties I have finally done this project.

If you like the project please give star ⭐️. 

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
