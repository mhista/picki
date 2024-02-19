import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/authentication/screens/signup/verify_email.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import 'terms_and_conditions_checkbox.dart';

class PSignupForm extends StatelessWidget {
  const PSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return Form(
      child: Column(
        children: [
          // first and last name
          Row(
            children: [
              Expanded(
                child: TextFormField(
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
            expands: false,
            decoration: const InputDecoration(
                labelText: PTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // PhoneNumber
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: PTexts.phoneNumber, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: PSizes.spaceBtwInputFields,
          ),
          // Password
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: PTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: Icon(Iconsax.eye_slash)),
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
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
            ),
          )
        ],
      ),
    );
  }
}
