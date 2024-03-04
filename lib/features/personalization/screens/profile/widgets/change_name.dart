import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/features/personalization/controllers/update_name_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/constants/text_strings.dart';

import '../../../../../utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: PAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //HEADINGS
            Text(
              'Use real name for easy verification. This name will appear on several pages',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: PSizes.spaceBtwInputFields,
            ),

            // Form
            Form(
              key: controller.updateUserFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: PSizes.spaceBtwSections),
                child: Column(
                  children: [
                    // Email
                    TextFormField(
                      controller: controller.firstName,
                      // initialValue: controller.firstName.text,
                      expands: false,
                      validator: (value) =>
                          PValidator.validateEmptyText('First name', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: PTexts.firstname),
                    ),
                    const SizedBox(
                      height: PSizes.spaceBtwInputFields,
                    ),

                    //Password

                    TextFormField(
                      controller: controller.lastName,
                      // initialValue: controller.lastName.text,
                      expands: false,
                      validator: (value) =>
                          PValidator.validateEmptyText('Last name', value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Iconsax.user),
                          labelText: PTexts.lastname,
                          suffixIcon: Icon(Icons.add)),
                    ),

                    const SizedBox(
                      height: PSizes.spaceBtwInputFields,
                    ),
                    // SignInButton
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.updateUserName(),
                        child: const Text('Save'),
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
