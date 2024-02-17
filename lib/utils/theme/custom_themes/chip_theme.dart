import 'package:flutter/material.dart';

class TChipTheme{
  TChipTheme._();

  static ChipThemeData lightThemeChipTheme = ChipThemeData(
      disabledColor: Colors.grey.withOpacity(0.4),
      labelStyle: const TextStyle(color: Colors.black),
      selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    checkmarkColor: Colors.white
  );
  static ChipThemeData darkThemeChipTheme = const ChipThemeData(

      disabledColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.white),
      selectedColor: Colors.blue,
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      checkmarkColor: Colors.white
  );

}