import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/shimmer/shimmer.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key, this.itemCount = 8});
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        itemBuilder: (_, __) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGE
              PShimmerEffect(
                height: 55,
                width: 55,
                radius: 55,
              ),
              SizedBox(
                height: PSizes.spaceBtwItems / 2,
              ),
              PShimmerEffect(height: 8, width: 55)
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          width: PSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
