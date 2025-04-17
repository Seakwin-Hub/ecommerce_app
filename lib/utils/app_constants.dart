import 'package:ecommerce_app/features/localization/domain/models/language_model.dart';
import 'package:ecommerce_app/utils/images.dart';

class AppConstants {
  static const String appName = "E-Commerce";
  static const double appVersion = 1.0;

  static const String fontFamily = "Roboto";

  //Language

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: Images.english,
      languageCode: "en",
      languageName: "English",
      countryCode: "US",
    ),
    LanguageModel(
      imageUrl: Images.khmer,
      languageCode: "kh",
      languageName: "Khmer",
      countryCode: "KH",
    ),
  ];
}
