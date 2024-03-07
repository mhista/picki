import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/personalization/controllers/user_controller.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../shimmer/shimmer.dart';
import '../images/circular_images.dart';

class PUserProfileTile extends StatelessWidget {
  const PUserProfileTile({
    super.key,
    this.onPressed,
  });
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
        final networkImage = controller.user.value.profilePicture;
        final image = networkImage.isNotEmpty ? networkImage : PImages.appLogo;
        return controller.imageUploading.value
            ? const PShimmerEffect(
                height: 58,
                width: 58,
                radius: 58,
              )
            : PCircularImage(
                isNetworkImage: networkImage.isNotEmpty,
                imageUrl: image,
                width: 58,
                height: 58,
                // backgroundColor: Colors.transparent,
              );
      }),
      title: Obx(() {
        return Text(
          controller.user.value.fullName,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: PColors.white),
        );
      }),
      subtitle: Text(
        controller.user.value.email,
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: PColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: PColors.white,
        ),
      ),
    );
  }
}
