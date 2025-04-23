import 'package:ecommerce_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Lottie.asset(
              Images.selectProduct,
              width: 300.w,
              height: 160.h,
            ),
            Lottie.asset(
              Images.selectPayment,
              width: 300.w,
              height: 160.h,
            ),
            Lottie.asset(
              Images.deliveryAnimate,
              width: 300.w,
              height: 160.h,
            ),
          ],
        ),
      ),
    );
  }
}
