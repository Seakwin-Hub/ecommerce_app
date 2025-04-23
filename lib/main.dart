import 'package:ecommerce_app/common/theme/controllers/theme_controller.dart';
import 'package:ecommerce_app/common/theme/dark_theme.dart';
import 'package:ecommerce_app/common/theme/light_theme.dart';
import 'package:ecommerce_app/features/onboard/screen/onboarding_screen.dart';

import 'package:ecommerce_app/helper/get_di.dart' as di;
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:ecommerce_app/common/models/messanges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Map<String, Map<String, String>> languages = await di.init();
  final brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;
  Get.find<ThemeController>().setTheme(isDarkMode);

  runApp(MyApp(
    languages: languages,
  ));
}

class MyApp extends StatefulWidget {
  final Map<String, Map<String, String>>? languages;
  const MyApp({super.key, required this.languages});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: Size(375, 812),
      builder: (context, child) {
        return GetBuilder<ThemeController>(
          builder: (themeController) {
            return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: AppConstants.appName,
                translations: Messanges(languages: widget.languages),
                locale: Locale(
                  AppConstants.languages[0].languageCode!,
                  AppConstants.languages[0].countryCode,
                ),
                theme: themeController.darkTheme ? dark() : light(),
                fallbackLocale: Locale(
                  AppConstants.languages[0].languageCode!,
                  AppConstants.languages[0].countryCode,
                ),

                ///Navigate Without Context
                navigatorKey: Get.key,
                home: OnboardingScreen());
          },
        );
      },
    );
  }
}
