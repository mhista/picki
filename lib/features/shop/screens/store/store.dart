import 'package:flutter/material.dart';
import 'package:pickafrika/common/widgets/appbar/appBar.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:pickafrika/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:pickafrika/common/widgets/layouts/gid_layout.dart';
import 'package:pickafrika/common/widgets/product.carts/cart_menu_icon.dart';
import 'package:pickafrika/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/constants/enums.dart';
import 'package:pickafrika/utils/constants/image_strings.dart';
import 'package:pickafrika/utils/constants/sizes.dart';
import 'package:pickafrika/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/images/circular_images.dart';
import '../../../../common/widgets/texts/brand_text_title_with_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';

class Store extends StatelessWidget {
  const Store({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: PAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            PCartCounterIcon(
              onPressed: () {},
              iconColor: isDark ? PColors.light : PColors.dark,
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: isDark ? PColors.black : PColors.white,
                  expandedHeight: 400,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(PSizes.defaultSpace),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const PSearchContainer(
                          text: 'Search In Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwSections,
                        ),

                        // featured brands
                        PSectionHeading(
                          title: 'Featured Brands',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: PSizes.spaceBtwItems / 2,
                        ),
                        PGridLayout(
                            mainAxisExtent: 75,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: PRoundedContainer(
                                  padding: const EdgeInsets.all(PSizes.sm),
                                  showBorder: true,
                                  backgroundColor: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: PCircularImage(
                                          imageUrl: PImages.clothIcon,
                                          isNetworkImage: false,
                                          backgroundColor: PColors.transparent,
                                          overLayColor: isDark
                                              ? PColors.white
                                              : PColors.dark,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: PSizes.spaceBtwItems / 2,
                                      ),

                                      // TEXT
                                      Expanded(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const BrandTitleTextWithVerifiedIcon(
                                                title: 'Nike',
                                                brandTextSize: TextSizes.large,
                                              ),
                                              Text(
                                                '256 Products',
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium,
                                              )
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  // TABS
                  bottom: TabBar(
                      isScrollable: true,
                      indicatorColor: PColors.primary,
                      unselectedLabelColor: PColors.darkGrey,
                      labelColor: isDark ? PColors.white : PColors.primary,
                      tabs: const [
                        Tab(
                          child: Text('Furniture'),
                        ),
                        Tab(
                          child: Text('Sports'),
                        ),
                        Tab(
                          child: Text('Electronics'),
                        ),
                        Tab(
                          child: Text('Clothes'),
                        ),
                        Tab(
                          child: Text('Cosmetics'),
                        )
                      ]),
                )
              ];
            },
            body: Container()),
      ),
    );
  }
}
