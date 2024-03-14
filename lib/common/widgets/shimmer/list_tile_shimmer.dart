import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/shimmer/shimmer.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

class ListTileShimmer extends StatelessWidget {
  const ListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            PShimmerEffect(
              height: 50,
              width: 50,
              radius: 50,
            ),
            SizedBox(
              width: PSizes.spaceBtwItems,
            ),
            Column(
              children: [
                PShimmerEffect(height: 15, width: 100),
                SizedBox(
                  height: PSizes.spaceBtwItems / 2,
                ),
                PShimmerEffect(height: 12, width: 80)
              ],
            )
          ],
        )
      ],
    );
  }
}
