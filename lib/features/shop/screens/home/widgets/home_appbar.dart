import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appBar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class PHomeAppbar extends StatelessWidget {
  const PHomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PTexts.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: PColors.grey),
          ),
          Text(
            PTexts.homeAppBarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: PColors.white),
          ),
        ],
      ),
      actions: const [
        PCartCounterIcon(
          // onPressed: () {},
          iconColor: PColors.white,
        )
      ],
    );
  }
}
