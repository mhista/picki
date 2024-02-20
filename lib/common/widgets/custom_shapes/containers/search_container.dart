import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helper_functions.dart';

class PSearchContainer extends StatelessWidget {
  const PSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: PSizes.defaultSpace),
        child: Container(
          width: PDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(PSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? isDark
                    ? PColors.dark
                    : PColors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(PSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: PColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: PColors.darkGrey,
              ),
              const SizedBox(
                width: (PSizes.spaceBtwItems),
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
