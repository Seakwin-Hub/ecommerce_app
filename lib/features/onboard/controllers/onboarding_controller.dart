import 'package:ecommerce_app/features/onboard/domain/models/onboarding_model.dart';
import 'package:ecommerce_app/features/onboard/domain/services/onboarding_service_interface.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController implements GetxService {
  final OnboardingServiceInterface onboardingServiceInterface;
  OnboardingController({required this.onboardingServiceInterface});

  List<OnboardingModel> _onboardingList = [];
  List<OnboardingModel> get onboardingList => _onboardingList;

  int _seletedIndex = 0;
  int get seletedIndex => _seletedIndex;

  void changeSelectIndex(int index) {
    _seletedIndex = index;
    update();
  }

  void getOnBoardingList() async {
    Response response = await onboardingServiceInterface.getOnBoardingList();
    if (response.statusCode == 200) {
      _onboardingList = [];
      _onboardingList.addAll(response.body);
      // _onboardingList.add(OnboardingModel('', '', ''));
    }
    update();
  }
}
