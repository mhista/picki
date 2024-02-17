import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightThemeChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: TColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      checkmarkColor: TColors.white);
  static ChipThemeData darkThemeChipTheme = const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: TColors.white),
      selectedColor: TColors.primary,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      checkmarkColor: TColors.white);
}
