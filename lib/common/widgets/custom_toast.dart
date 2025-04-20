import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomToast extends StatelessWidget {
  final String text;
  final bool isError;
  final Color textColor;
  final double borderRadius;
  const CustomToast({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    this.borderRadius = 30,
    required this.isError,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.only(bottom: 40.h),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF334257),
              borderRadius: BorderRadius.circular(borderRadius.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            margin: EdgeInsets.only(
              right: Dimensions.paddingSizeLarge.w,
              left: Dimensions.paddingSizeLarge.w,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isError
                      ? CupertinoIcons.multiply_circle_fill
                      : Icons.check_circle,
                ),
                SizedBox(
                  width: Dimensions.paddingSizeSmall.w,
                ),
                Flexible(
                  child: Text(
                    text,
                    style: robotoRegular.copyWith(color: textColor),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
