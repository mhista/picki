import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class PSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: PSizes.appBarHeight,
      left: PSizes.defaultSpace,
      bottom: PSizes.defaultSpace,
      right: PSizes.defaultSpace);
  static const EdgeInsetsGeometry carouselPadding = EdgeInsets.only(
      top: PSizes.borderRadiusLg,
      left: PSizes.defaultSpace,
      bottom: PSizes.defaultSpace,
      right: PSizes.defaultSpace);
  static const EdgeInsetsGeometry successScreenPadding = EdgeInsets.only(
      top: PSizes.appBarHeight * 1.5,
      left: PSizes.defaultSpace,
      bottom: PSizes.defaultSpace,
      right: PSizes.defaultSpace);
}
