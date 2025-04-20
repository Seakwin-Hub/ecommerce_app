import 'package:ecommerce_app/common/theme/custom_theme.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/material.dart';

ThemeData dark() => ThemeData(
      useMaterial3: true,
      fontFamily: AppConstants.fontFamily,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: CustomThemeStyle.textThemeCustom(Colors.black),
      chipTheme: CustomThemeStyle.chipTheme(Colors.grey, Colors.white),
      appBarTheme: CustomThemeStyle.appBarTheme(),
      checkboxTheme: CustomThemeStyle.checkboxTheme(),
      bottomSheetTheme: CustomThemeStyle.bottomSheetTheme(Colors.black),
      elevatedButtonTheme: CustomThemeStyle.elevationButtonTheme(),
      outlinedButtonTheme:
          CustomThemeStyle.outlinedButtonTheme(Colors.white, Colors.blueAccent),
      inputDecorationTheme: CustomThemeStyle.inputDecorationTheme(
          Colors.black, Colors.black12,
          isDark: true),
    );
