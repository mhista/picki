import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

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
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: true,
                  onChanged: (vaalue) {},
                ),
              ),
              const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '${PTexts.iAgreeTo} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '${PTexts.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: isDark ? PColors.white : PColors.primary,
                            decorationColor:
                                isDark ? PColors.white : PColors.primary,
                            decoration: TextDecoration.underline)),
                    TextSpan(
                        text: '${PTexts.and} ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: '${PTexts.termsOfUse} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: isDark ? PColors.white : PColors.primary,
                            decorationColor:
                                isDark ? PColors.white : PColors.primary,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: PSizes.spaceBtwSections,
          ),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text(PTexts.createAccount),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
