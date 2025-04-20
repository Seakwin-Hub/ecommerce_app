import 'package:ecommerce_app/common/theme/custom_theme.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData light() => ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamily,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: CustomThemeStyle.textThemeCustom(Colors.white),
      chipTheme: CustomThemeStyle.chipTheme(
          Colors.grey.withValues(alpha: 0.4), Colors.black),
      appBarTheme: CustomThemeStyle.appBarTheme(),
      checkboxTheme: CustomThemeStyle.checkboxTheme(),
      bottomSheetTheme: CustomThemeStyle.bottomSheetTheme(Colors.white),
      elevatedButtonTheme: CustomThemeStyle.elevationButtonTheme(),
      outlinedButtonTheme:
          CustomThemeStyle.outlinedButtonTheme(Colors.black, Colors.blue),
      inputDecorationTheme: CustomThemeStyle.inputDecorationTheme(
          Colors.white, Colors.white,
          isDark: false),
    );
