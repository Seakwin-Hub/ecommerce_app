import 'package:ecommerce_app/common/widgets/custom_toast.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String? message,
    {bool isError = true, bool getXSnackBar = false}) {
  if (message != null && message.isNotEmpty) {
    if (getXSnackBar) {
      Get.showSnackbar(
        GetSnackBar(
          backgroundColor: isError ? Colors.red : Colors.green,
          message: message,
          maxWidth: 500.w,
          duration: Duration(seconds: 3),
          snackStyle: SnackStyle.FLOATING,
          margin: EdgeInsets.only(
            left: Dimensions.paddingSizeSmall.w,
            right: Dimensions.paddingSizeSmall.w,
            bottom: 100.h,
          ),
          borderRadius: Dimensions.radiusSmall.r,
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
        ),
      );
    } else {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        dismissDirection: DismissDirection.endToStart,
        elevation: 0,
        backgroundColor: Colors.transparent,
        padding: EdgeInsets.zero,
        content: CustomToast(text: message, isError: isError),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ));
    }
  }
}
