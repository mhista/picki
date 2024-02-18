import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../signup/signup.dart';

class PLoginForm extends StatelessWidget {
  const PLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: PSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: PTexts.email),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputFields,
            ),

            //Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: PTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputFields / 2,
            ),
            // Remeber me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remeber me
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const Text(PTexts.remember)
                  ],
                ),
                // forget password
                TextButton(
                  onPressed: () {},
                  child: const Text(PTexts.forgetPassword),
                )
              ],
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            // SignInButton
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(PTexts.signIn),
              ),
            ),

            const SizedBox(height: PSizes.spaceBtwItems),
            // create account buttons
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(PTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
