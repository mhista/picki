import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/features/shop/controllers/order_controller.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/cloud_helper_function.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../../common/loaders/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/image_strings.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyAnimationWidget = AnimationLoaderWidget(
            text: 'Whoops! No order yet',
            animation: PImages.lottie2,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );
          // HELPER FUNCTION: HANDLE LOADER, NO RECORD, OR ERROR MESSAGE
          final response = KCloudHelperFunction.checkMultiRecordState(
              snapshot: snapshot, noDataFound: emptyAnimationWidget);
          if (response != null) return response;
          final orders = snapshot.data!;
          return ListView.separated(
              separatorBuilder: (_, __) => const SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
              itemCount: orders.length,
              itemBuilder: (_, int index) {
                final order = orders[index];
                return PRoundedContainer(
                    padding: const EdgeInsets.all(PSizes.md),
                    showBorder: true,
                    backgroundColor: isDark ? PColors.dark : PColors.light,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ROW
                        Row(
                          children: [
                            // ICON
                            const Icon(Iconsax.ship),
                            const SizedBox(
                              width: PSizes.spaceBtwItems / 2,
                            ),

                            // STATUS & DATE
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    order.status.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: PColors.primary,
                                            fontWeightDelta: 1),
                                  ),
                                  Text(
                                    order.formattedOrderDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall,
                                  )
                                ],
                              ),
                            ),
                            // ICON
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.arrow_right_34,
                                  size: PSizes.iconSm,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems,
                        ),

                        // STATUS AND DATE
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  // ICON
                                  const Icon(Iconsax.tag),
                                  const SizedBox(
                                    width: PSizes.spaceBtwItems / 2,
                                  ),

                                  // STATUS & DATE
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                          order.id,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                  // ICON
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  // ICON
                                  const Icon(Iconsax.calendar),
                                  const SizedBox(
                                    width: PSizes.spaceBtwItems / 2,
                                  ),

                                  // SHIPPING STATUS & DATE
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Shipping Date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(
                                          order.formattedDeliveryOrderDate,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        )
                                      ],
                                    ),
                                  ),
                                  // ICON
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ));
              });
        });
  }
}
