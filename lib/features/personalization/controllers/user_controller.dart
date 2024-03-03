import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pickafrika/data/repositories/user/user_repository.dart';
import 'package:pickafrika/features/authentication/models/user_model.dart';
import 'package:pickafrika/navigation_menu.dart';

import '../../../common/loaders/loaders.dart';
import '../../../utils/popups/fullscreen_loader.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  // Save user Record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      // CONVERT THE DISPLAY NAME TO FIRST AND LAST NAME
      if (userCredential != null) {
        final nameParts =
            UserModel.splitFullName(userCredential.user!.displayName ?? '');
        final username =
            UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // MAP DATA
        final user = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '');

        await userRepository.saveUser(user);
      }
    } catch (e) {
      PFullScreenLoader.stopLoading();
      PLoaders.errorSnackBar(title: "Ooops!", message: e.toString());
    }
  }
}
