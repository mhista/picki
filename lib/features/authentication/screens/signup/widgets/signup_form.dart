import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/authentication/controllers/signup/signup_controller.dart';
import 'package:pickafrika/utils/validators/validation.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import 'terms_and_conditions_checkbox.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          // first and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      PValidator.validateEmptyText('First Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: PTexts.firstname,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: PSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      PValidator.validateEmptyText('Last Name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: PTexts.lastname,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                PValidator.validateEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: PTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => PValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: PTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // PhoneNumber
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => PValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: PTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // Password
          Obx(
            () => TextFormField(
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              validator: (value) => PValidator.validatePassword(value),
              expands: false,
              decoration: InputDecoration(
                  labelText: PTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                          !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: PSizes.spaceBtwSections,
          ),
          // Terms and condition
          const PTermsAndConditions(),
          const SizedBox(
            height: PSizes.spaceBtwSections,
          ),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                child: const Text(PTexts.createAccount),
                onPressed: () => controller.signup()),
          ),
        ],
      ),
    );
  }
}
