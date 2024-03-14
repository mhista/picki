import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/shimmer/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class BoxesShimmer extends StatelessWidget {
  const BoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(
              child: PShimmerEffect(height: 110, width: 150),
            ),
            SizedBox(
              width: PSizes.spaceBtwItems,
            ),
            Expanded(
              child: PShimmerEffect(height: 110, width: 150),
            ),
            SizedBox(
              width: PSizes.spaceBtwItems,
            ),
            Expanded(
              child: PShimmerEffect(height: 110, width: 150),
            ),
          ],
        )
      ],
    );
  }
}
