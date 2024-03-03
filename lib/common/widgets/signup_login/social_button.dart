import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/authentication/controllers/login/login_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';

class PSocialButton extends StatelessWidget {
  const PSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: PColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(PImages.facebook),
              height: PSizes.iconMd,
            ),
          ),
        ),
        const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: PColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.signInWithGoogle(),
            icon: const Image(
              image: AssetImage(PImages.google),
              height: PSizes.iconMd,
            ),
          ),
        ),
      ],
    );
  }
}
