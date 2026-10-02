# app_settings

[![pub package](https://img.shields.io/pub/v/app_settings.svg)](https://pub.dartlang.org/packages/app_settings)

A Flutter plugin for opening iOS and Android phone settings from an app.

## Features

- Supports **Swift Package Manager (SPM)** for iOS integration.
- Opens various settings pages (e.g., location, Wi-Fi, etc.) for both Android and iOS.

## Installation

First, add `app_settings` as a [dependency in your pubspec.yaml file](https://pub.dev/packages/app_settings).

```dart
flutter pub add app_settings
```

Next, import 'app_settings.dart' into your Dart code.

```dart
import 'package:app_settings/app_settings.dart';
```

### iOS

***TIP: If using Objective-C for iOS in your project, you will need to add `use_frameworks!` to your `Runner project podfile` in order to use this Swift plugin:***

```pod
target 'Runner' do
  use_frameworks!
```

If you prefer using **Swift Package Manager (SPM)**, make sure to enable swift support in your project.
See also [Flutter SPM integration](https://docs.flutter.dev/packages-and-plugins/swift-package-manager/for-app-developers).

```sh
  flutter config --enable-swift-package-manager 
```



## Usage

Open the settings of the application using `AppSettings.openAppSettings()`.
By default, `AppSettingsType.settings` is used as the type, which opens the general application settings.
If the given type is not supported on the current platform, the general settings are opened instead.

`AppSettingsType.wifi` opens Wi-Fi settings on Android and attempts to open the
Wi-Fi page on iOS. iOS uses an undocumented Settings URL, so the destination is
not guaranteed across iOS versions. If iOS reports that the Wi-Fi URL cannot
be opened, the plugin attempts to open the top-level device Settings screen
instead (also via an undocumented URL). If neither URL opens, the call throws
a platform exception. Some iOS versions and simulators may reject both URLs.

**Android** If `asAnotherTask` is set to true, the settings page is opened in a different Activity.

```dart
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: () => AppSettings.openAppSettings(type: AppSettingsType.location),
    child: const Text('Open Location Settings'),
  );
}
```

### Android Q Settings Panels

To open a Settings Panel on Android Q and higher,
call `AppSettings.openAppSettingsPanel()` with a given type.

```dart
Widget build(BuildContext context) {
  return ElevatedButton(
    onPressed: () => AppSettings.openAppSettingsPanel(AppSettingsPanelType.volume),
    child: const Text('Open Volume Settings Panel'),
  );
}
```

Settings panels are not supported on other platforms.
