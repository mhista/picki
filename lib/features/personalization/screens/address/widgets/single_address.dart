import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/features/personalization/controllers/address_controller.dart';
import 'package:pickafrika/features/personalization/models/address_model.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.address, this.onTap});
  final AddressModel address;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    final isDark = PHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        Obx(() {
          final selectedAddressId = controller.selectedAddress.value.id;
          final selectedAddress = selectedAddressId == address.id;
          return GestureDetector(
            onTap: onTap,
            child: PRoundedContainer(
              padding: const EdgeInsets.all(PSizes.md),
              width: double.infinity,
              showBorder: true,
              backgroundColor: selectedAddress
                  ? PColors.primary.withOpacity(0.5)
                  : Colors.transparent,
              borderColor: selectedAddress
                  ? Colors.transparent
                  : isDark
                      ? PColors.darkerGrey
                      : PColors.grey,
              margin: const EdgeInsets.only(bottom: PSizes.spaceBtwItems),
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    right: 5,
                    child: Icon(
                      selectedAddress ? Iconsax.tick_circle5 : null,
                      color: selectedAddress
                          ? isDark
                              ? PColors.light
                              : PColors.dark
                          : null,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        address.name,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: PSizes.sm / 2,
                      ),
                      Text(
                        address.formattedPhoneNo,
                        overflow: TextOverflow.ellipsis,
                        // style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: PSizes.sm / 2,
                      ),
                      Text(
                        address.toString(),
                        softWrap: true,
                      ),
                      const SizedBox(
                        height: PSizes.sm / 2,
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
