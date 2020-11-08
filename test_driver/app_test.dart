import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';

import 'app_test_key.dart';

void main() {
  group('Auth screen test', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Onboarding to signin and back again', () async {
      await driver.waitFor(signinButton);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(signinButton);
      await Future.delayed(const Duration(seconds: 2));
      await driver.waitFor(backLoginButton);
      await driver.tap(backLoginButton);
      await Future.delayed(const Duration(seconds: 1));
    });

    test('Onboarding to register and back again', () async {
      await driver.waitFor(signupButton);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(signupButton);
      await Future.delayed(const Duration(seconds: 2));
      await driver.waitFor(backRegisterButton);
      await driver.tap(backRegisterButton);
      await Future.delayed(const Duration(seconds: 1));
    });

    test('Onboarding to signin to register and back again', () async {
      await driver.waitFor(signinButton);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(signinButton);
      await Future.delayed(const Duration(seconds: 2));
      await driver.waitFor(registerOnLoginButton);
      await driver.tap(registerOnLoginButton);
      await Future.delayed(const Duration(seconds: 2));
      await driver.waitFor(backRegisterButton);
      await driver.tap(backRegisterButton);
    });

    test('Onboarding to register to signin and back again', () async {
      await driver.waitFor(signupButton);
      await Future.delayed(const Duration(seconds: 1));
      await driver.tap(signupButton);
      await Future.delayed(const Duration(seconds: 2));
      await driver.waitFor(loginOnRegisteRButton);
      await driver.tap(loginOnRegisteRButton);
      await Future.delayed(const Duration(seconds: 2));
      await driver.waitFor(backLoginButton);
      await driver.tap(backLoginButton);
    });
  });
}
