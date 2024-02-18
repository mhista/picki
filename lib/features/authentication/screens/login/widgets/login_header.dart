import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class PLoginHeader extends StatelessWidget {
  const PLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 100,
          image: AssetImage(
            PImages.appLogo,
          ),
        ),
        Text(
          PTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: PSizes.sm,
        ),
        Text(
          PTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
