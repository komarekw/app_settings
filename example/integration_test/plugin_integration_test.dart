// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:app_settings/app_settings.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('openAppSettings completes without throwing',
      (WidgetTester tester) async {
    await expectLater(AppSettings.openAppSettings(), completes);
  });

  testWidgets('openAppSettings reports Wi-Fi URL availability on iOS',
      (WidgetTester tester) async {
    try {
      await AppSettings.openAppSettings(type: AppSettingsType.wifi);
    } on PlatformException catch (error) {
      expect(error.code, 'settings_unavailable');
    }
  }, skip: !Platform.isIOS);
}
