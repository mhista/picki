import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pickafrika/common/widgets/shimmer/category_shimmer.dart';
import 'package:pickafrika/features/shop/controllers/category_controller.dart';
import 'package:pickafrika/features/shop/screens/sub_category/sub_categories.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/images/image_text_widgets/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';

class PHomeCategories extends StatelessWidget {
  const PHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const CategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white, overflow: TextOverflow.ellipsis),
          ),
        );
      } else {
        return SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return PVerticalImageText(
                // overlayColor: isDark ? PColors.white : PColors.dark,
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(
                      category: category,
                    )),
              );
            },
          ),
        );
      }
    });
  }
}
