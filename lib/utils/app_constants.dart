import 'package:ecommerce_app/features/localization/domain/models/language_model.dart';
import 'package:ecommerce_app/utils/images.dart';

enum TextSizes { small, medium, large }

enum OrderStatus { processing, shipped, delivered }

enum PaymentMethod {
  paypal,
  googlePlay,
  applePlay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}

class AppConstants {
  static const String appName = "E-Commerce";
  static const double appVersion = 1.0;
  static const String fontFamily = "Roboto";

  static const String baseUrl = 'https://your-api-url.com';

  ///Shared Key

  static const String theme = "e_commerce_theme";
  static const String apiKey = "37c80fce-0883-4b33-a2d3-11ac0f9c5fec";
  static const String token = 'e_commerce_token';
  static const String languageCode = "e_commerce_language_code";

  ///Language

  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: Images.english,
      languageName: "English",
      countryCode: "US",
      languageCode: "en",
    ),
    // LanguageModel(
    //   imageUrl: Images.khmer,
    //   languageName: "Khmer",
    //   countryCode: "KH",
    //   languageCode: "kh",
    // ),
  ];
}
