import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/shimmer/shimmer.dart';

import '../../../utils/constants/sizes.dart';

class VerticalProductShimmer extends StatelessWidget {
  const VerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return PGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // IMAGE
                  PShimmerEffect(height: 180, width: 180),
                  SizedBox(
                    height: PSizes.spaceBtwItems,
                  ),
                  // TEXT
                  PShimmerEffect(height: 160, width: 15),
                  SizedBox(
                    height: PSizes.spaceBtwItems / 2,
                  ),
                  PShimmerEffect(height: 110, width: 15),
                ],
              ),
            ));
  }
}
