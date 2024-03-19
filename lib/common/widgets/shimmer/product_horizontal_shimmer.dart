import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/shimmer/shimmer.dart';

import '../../../../utils/constants/sizes.dart';

class HorizontalCardShimmer extends StatelessWidget {
  const HorizontalCardShimmer({super.key, this.itemCount = 4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    // card with side paddings, edges, radius and shadow
    return Container(
      margin: const EdgeInsets.only(bottom: PSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (_, __) => const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // image
                  PShimmerEffect(height: 120, width: 120),
                  SizedBox(
                    width: PSizes.spaceBtwItems,
                  ),

                  // text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: PSizes.spaceBtwItems / 2,
                      ),
                      PShimmerEffect(height: 15, width: 160),
                      SizedBox(
                        height: PSizes.spaceBtwItems / 2,
                      ),
                      PShimmerEffect(height: 15, width: 160),
                      SizedBox(
                        height: PSizes.spaceBtwItems / 2,
                      ),
                      PShimmerEffect(height: 15, width: 160),
                      Spacer(),
                    ],
                  )
                ],
              ),
          separatorBuilder: (_, __) => const SizedBox(
                width: PSizes.spaceBtwItems,
              ),
          itemCount: itemCount),
    );
  }
}
