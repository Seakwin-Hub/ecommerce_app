import 'package:ecommerce_app/features/onboard/domain/models/onboarding_model.dart';
import 'package:ecommerce_app/features/onboard/domain/repositories/onboarding_repository_interface.dart';
import 'package:ecommerce_app/utils/images.dart';
import 'package:get/get.dart';

class OnboardingRepository implements OnboardingRepositoryInterface {
  @override
  Future<Response> getList({int? offset}) async {
    try {
      List<OnboardingModel> onBoardingList = [
        OnboardingModel('on_boarding_subTitle1'.tr, Images.selectProduct,
            'on_boarding_title1'.tr),
        OnboardingModel('on_boarding_subTitle2'.tr, Images.selectPayment,
            'on_boarding_title2'.tr),
        OnboardingModel('on_boarding_subTitle3'.tr, Images.deliveryAnimate,
            'on_boarding_title3'.tr),
      ];
      Response response = Response(statusCode: 200, body: onBoardingList);
      return response;
    } catch (e) {
      return const Response(
          statusCode: 404, statusText: 'Onboarding Not Found');
    }
  }

  @override
  Future add(value) {
    throw UnimplementedError();
  }

  @override
  Future delete(int? id) {
    throw UnimplementedError();
  }

  @override
  Future get(String? id) {
    throw UnimplementedError();
  }

  @override
  Future update(Map<String, dynamic> body, int? id) {
    throw UnimplementedError();
  }
}
