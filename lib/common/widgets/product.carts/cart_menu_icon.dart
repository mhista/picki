import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';

class PCartCounterIcon extends StatelessWidget {
  const PCartCounterIcon(
      {super.key, required this.onPressed, required this.iconColor});
  final VoidCallback onPressed;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 3,
          top: 5,
          child: Badge(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            backgroundColor: PColors.dark.withOpacity(0.7),
            textColor: PColors.white,
            label: const Text(
              '2',
              style: TextStyle(fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
