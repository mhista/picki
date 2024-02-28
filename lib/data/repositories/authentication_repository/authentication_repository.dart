import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pickafrika/features/authentication/screens/login/login.dart';
import 'package:pickafrika/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // VARIABLES
  final deviceStorage = GetStorage();

  // CALLED FROM THE main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // FUNCTION TO SHOW REDIRECT SCREEN
  screenRedirect() async {
    if (kDebugMode) {
      print(
          '---------------------------- GET STORAGE AUTH REPO ----------------------------');
      print(deviceStorage.read('isFirstTime'));
    }
    // LOCAL STORAGE
    await deviceStorage.writeIfNull('isFirstTime', true);
    await deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  //  ------------------------------- Email and Password signin --------------------------

  // SIGNIN EMAIL AUTHENTICATION
  // REGISTER EMAIL AUTHENTICATION
  // REAUTHENTICATION
  // EMAIL VERIFICATION
  // FORGET PASSWORD

  //  ---------------------------------- FEDERATED IDENTITY AND SOCIAL SIGN IN---------------

  // GOOGLE AUTHENTICATION
  // FACEBOOK AUTHENTICATION

  //  ---------------------------------------OTHER VERIFICATION ---------------
  // LOGOUT USER
  // DELETE USER
}
