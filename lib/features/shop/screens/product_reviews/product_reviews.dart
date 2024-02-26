import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../../common/widgets/products/ratinga/ratings_indicator.dart';
import 'widgets/overall_progress_rating.dart';
import 'widgets/user_review_card.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: const PAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(PSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Ratings and reviews are verified and are from peaople who use the same type of device you use'),
            const SizedBox(
              height: PSizes.spaceBtwItems,
            ),

            // OVERALL PRODUCT RATING
            const OverallProductRating(),
            const PRatingBarIndicator(
              rating: 3.5,
            ),
            Text(
              '11,300',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: PSizes.spaceBtwSections,
            ),
            const UserReviewCard(),
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}
