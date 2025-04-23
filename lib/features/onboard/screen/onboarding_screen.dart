import 'package:ecommerce_app/common/theme/controllers/theme_controller.dart';
import 'package:ecommerce_app/features/onboard/controllers/onboarding_controller.dart';
import 'package:ecommerce_app/helper/device_utils.dart';
import 'package:ecommerce_app/helper/function_helper.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    Get.find<OnboardingController>().getOnBoardingList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<OnboardingController>(
                builder: (onBoardingController) {
              return Stack(
                children: [
                  PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: onBoardingController.onboardingList.length,
                    controller: _controller,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(
                          Dimensions.defaultSpace.w,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                              onBoardingController
                                  .onboardingList[index].imageUrl,
                              width: FunctionHelper.screenWidth() * 0.8,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              onBoardingController.onboardingList[index].title,
                              style: robotoBold.copyWith(
                                fontSize: Dimensions.fontSizeExtraLarge.sp,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: Dimensions.spaceBtwItems.h,
                            ),
                            Text(
                              onBoardingController
                                  .onboardingList[index].description,
                              style: robotoMedium.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Positioned(
                    right: Dimensions.defaultSpace.w,
                    top: DeviceUtils.getAppBarHeight(),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'skip'.tr,
                        style: robotoRegular.copyWith(
                          fontSize: Dimensions.fontSizeLarge.sp,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: DeviceUtils.getBottomNavigationBarHeight() + 25.w,
                    left: Dimensions.defaultSpace.w,
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: onBoardingController.onboardingList.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Get.find<ThemeController>().darkTheme
                              ? AppColors.light
                              : AppColors.dark,
                          dotHeight: 8),
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
