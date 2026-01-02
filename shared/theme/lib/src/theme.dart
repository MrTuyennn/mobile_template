import 'package:assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:theme/src/text_theme.dart';

import 'colors.dart';

class AppTheme {
  AppTheme._({required this.themeData});

  factory AppTheme.light({bool isTablet = false}) {
    final appColors = AppColors.light();
    final appTextTheme = isTablet
        ? AppTextTheme.lightTablet()
        : AppTextTheme.light();
    final themeData = ThemeData(
      extensions: [appColors, appTextTheme],
      colorScheme: ColorScheme.fromSeed(seedColor: appColors.blue),
      fontFamily: FontFamily.quicksand,
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: appColors.textDisabled,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(fontFamily: FontFamily.quicksand),
      ),
    );
    return AppTheme._(themeData: themeData);
  }

  factory AppTheme.dark({bool isTablet = false}) {
    final appColors = AppColors.dark();
    final appTextTheme = isTablet
        ? AppTextTheme.darkTablet()
        : AppTextTheme.dark();
    final themeData = ThemeData(
      extensions: [appColors, appTextTheme],
      colorScheme: ColorScheme.fromSeed(
        seedColor: appColors.blue,
        brightness: Brightness.dark,
      ),
      fontFamily: FontFamily.quicksand,
      useMaterial3: true,
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: TextStyle(fontFamily: FontFamily.quicksand),
      ),
    );
    return AppTheme._(themeData: themeData);
  }

  final ThemeData themeData;
}
