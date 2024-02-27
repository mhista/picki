import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class CouponCodeField extends StatelessWidget {
  const CouponCodeField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);

    return PRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? PColors.dark : PColors.white,
      padding: const EdgeInsets.only(
          top: PSizes.sm, bottom: PSizes.sm, right: PSizes.sm, left: PSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Enter Promo code here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? PColors.white.withOpacity(0.5)
                    : PColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(
                  color: Colors.grey.withOpacity(0.1),
                ),
              ),
              onPressed: () {},
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
