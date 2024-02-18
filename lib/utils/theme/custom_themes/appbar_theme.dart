import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: PColors.transparent,
      surfaceTintColor: PColors.transparent,
      iconTheme: IconThemeData(color: PColors.black, size: 24),
      actionsIconTheme: IconThemeData(color: PColors.black, size: 24),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: PColors.black));
  static const darkAppBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: PColors.transparent,
      surfaceTintColor: PColors.transparent,
      iconTheme: IconThemeData(color: PColors.black, size: 24),
      actionsIconTheme: IconThemeData(color: PColors.white, size: 24),
      titleTextStyle: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w600, color: PColors.white));
}
