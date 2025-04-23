import 'package:ecommerce_app/features/onboard/domain/repositories/onboarding_repository_interface.dart';
import 'package:ecommerce_app/features/onboard/domain/services/onboarding_service_interface.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class OnboardingService implements OnboardingServiceInterface {
  final OnboardingRepositoryInterface onboardingRepositoryInterface;
  OnboardingService({required this.onboardingRepositoryInterface});
  @override
  Future<Response> getOnBoardingList() async {
    return await onboardingRepositoryInterface.getList();
  }
}
