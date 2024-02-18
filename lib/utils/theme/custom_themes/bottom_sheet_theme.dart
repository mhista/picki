import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetThemeData = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: PColors.white,
      modalBackgroundColor: PColors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
  static BottomSheetThemeData darkBottomSheetThemeData = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: PColors.black,
      modalBackgroundColor: PColors.black,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
}
