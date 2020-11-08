import 'package:flutter_driver/flutter_driver.dart';
import 'package:test_flutter/utils/app_keys.dart';

final splashImage = find.byValueKey(SPLASH_IMAGE_KEY);

// onboarding screen
final welcomeText = find.byValueKey(WELCOME_TEXT_KEY);
final signinButton = find.byValueKey(SIGN_IN_BUTTON);
final signupButton = find.byValueKey(SIGN_UP_BUTTON);

// login screen
final backLoginButton = find.byValueKey(BACK_LOGIN_BUTTON);
final registerOnLoginButton = find.byValueKey(REGISTER_ONLOGIN_BUTTON);

// register screen
final backRegisterButton = find.byValueKey(BACK_REGISTER_BUTTON);
final loginOnRegisteRButton = find.byValueKey(LOGIN_ONREGISTER_BUTTON);
