import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightThemeChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: PColors.primary,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      checkmarkColor: PColors.white);
  static ChipThemeData darkThemeChipTheme = const ChipThemeData(
      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: PColors.white),
      selectedColor: PColors.primary,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      checkmarkColor: PColors.white);
}
