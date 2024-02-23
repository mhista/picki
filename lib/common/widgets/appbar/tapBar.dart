import 'package:flutter/material.dart';
import 'package:pickafrika/utils/constants/colors.dart';
import 'package:pickafrika/utils/device/device_utility.dart';

import '../../../utils/helpers/helper_functions.dart';

class PTabBar extends StatelessWidget implements PreferredSizeWidget {
  const PTabBar({super.key, required this.tabs});
  final List<Widget> tabs;

  // to add the background color to tabs, wrap with material widget.

  @override
  Widget build(BuildContext context) {
    final isDark = PHelperFunctions.isDarkMode(context);
    return Material(
      color: isDark ? PColors.black : PColors.white,
      child: TabBar(
        tabs: tabs,
        tabAlignment: TabAlignment.start,
        isScrollable: true,
        indicatorColor: PColors.primary,
        unselectedLabelColor: PColors.darkGrey,
        labelColor: isDark ? PColors.white : PColors.primary,
        padding: const EdgeInsets.only(right: 0),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(PDeviceUtils.getAppBarHeight());
}
