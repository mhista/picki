import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return ListView.separated(
        separatorBuilder: (_, __) => const SizedBox(
              height: PSizes.spaceBtwItems,
            ),
        itemCount: 6,
        itemBuilder: (_, int index) => PRoundedContainer(
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
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: PColors.primary, fontWeightDelta: 1),
                          ),
                          Text(
                            '07 Nov 2024',
                            style: Theme.of(context).textTheme.headlineSmall,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  '[#387819]',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipping Date',
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                Text(
                                  '03 Feb 2023',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
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
            )));
  }
}
