import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveHelper {
  static bool isMobilePhone() {
    if (!kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isMobile(context) {
    final size = ScreenUtil().screenWidth;
    if (size < 650 || !kIsWeb) {
      return true;
    } else {
      return false;
    }
  }

  static bool isTab(context) {
    final size = ScreenUtil().screenWidth;
    if (size < 1300 && size >= 650) {
      return true;
    } else {
      return false;
    }
  }
}
