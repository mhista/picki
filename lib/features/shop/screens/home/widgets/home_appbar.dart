import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/features/personalization/controllers/user_controller.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../common/widgets/shimmer/shimmer.dart';

class PHomeAppbar extends StatelessWidget {
  const PHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: PColors.grey),
          ),
          const SizedBox(
            height: PSizes.spaceBtwItems - 10,
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              // display a shimmer loader while user profile is loading
              return const PShimmerEffect(
                width: 100,
                height: 15,
                radius: 5,
              );
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .apply(color: PColors.white),
              );
            }
          }),
        ],
      ),
      actions: const [
        PCartCounterIcon(
          // onPressed: () {},
          iconColor: PColors.white,
        )
      ],
    );
  }
}
