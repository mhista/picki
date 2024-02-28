import 'package:flutter/material.dart';
import 'package:pickafrika/utils/constants/sizes.dart';

import '../../../utils/constants/colors.dart';

class PSettingsMenuTile extends StatelessWidget {
  const PSettingsMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle = '',
      this.trailing,
      this.onTap,
      this.addSubtitle = true,
      this.addSpacing = false});
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool addSubtitle;
  final bool addSpacing;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 28,
            color: PColors.primary,
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: addSubtitle
              ? Text(
                  subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                )
              : null,
          trailing: trailing,
          onTap: onTap,
        ),
        if (addSpacing)
          const SizedBox(
            height: PSizes.spaceBtwItems,
          )
      ],
    );
  }
}
