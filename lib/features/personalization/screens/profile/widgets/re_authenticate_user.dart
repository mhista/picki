import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/personalization/controllers/user_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../utils/validators/validation.dart';

class ReAuthUserScreen extends StatelessWidget {
  const ReAuthUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      appBar: PAppBar(
        title: Text(
          'Re-Authenticate to delete account',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          children: [
            // Form
            Form(
              key: controller.reAuthFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: PSizes.spaceBtwSections),
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      validator: PValidator.validateEmail,
                      controller: controller.verifyEmail,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: PTexts.email),
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwInputFields,
                    ),

                    //Password
                    Obx(() {
                      return TextFormField(
                        obscureText: controller.hidePassword.value,
                        validator: (value) =>
                            PValidator.validateEmptyText('Password', value),
                        controller: controller.verifyPassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Iconsax.password_check),
                          labelText: PTexts.password,
                          suffixIcon: IconButton(
                            icon: Icon(controller.hidePassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye),
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: PSizes.spaceBtwInputFields / 2,
                    ),

                    const SizedBox(
                      height: PSizes.spaceBtwSections,
                    ),
                    // SignInButton
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            controller.reAuthenticateEmailAndPassword(),
                        child: const Text('Delete'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
