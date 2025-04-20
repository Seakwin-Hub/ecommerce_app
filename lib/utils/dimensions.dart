import 'package:get/get.dart';

class Dimensions {
  static double fontSizeOverSmall = Get.context!.width >= 1300 ? 10 : 8;
  static double fontSizeExtraSmanll = Get.context!.width >= 1300 ? 12 : 10;
  static double fontSizeSmall = Get.context!.width >= 1300 ? 14 : 12;
  static double fontSizeDefault = Get.context!.width >= 1300 ? 16 : 14;
  static double fontSizeLarge = Get.context!.width >= 1300 ? 18 : 16;
  static double fontSizeExtraLarge = Get.context!.width >= 1300 ? 20 : 18;
  static double fontSizeOverLarge = Get.context!.width >= 1300 ? 26 : 24;

  static const double paddingSizeExtraSmall = 5.0;
  static const double paddingSizeSmall = 10.0;
  static const double paddingSizeDefault = 15.0;
  static const double paddingSizeLarge = 20.0;
  static const double paddingSizeExtraLarge = 25.0;
  static const double paddingSizeExtremeLarge = 30.0;
  static const double paddingSizeExtraOverLarge = 35.0;

  static const double radiusSmall = 5.0;
  static const double radiusDefault = 10.0;
  static const double radiusLarge = 15.0;
  static const double radiusExtraLarge = 20.0;

  /// Padding and Margin Sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  /// Icon Sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  /// Font Sizes
  static const double fontSizeSm = 14.0;
  static const double fontSizeMd = 16.0;
  static const double fontSizeLg = 18.0;

  /// Button Sizes

  static const double buttonHeight = 18.0;
  static const double buttonRadius = 12.0;
  static const double buttonWidth = 120.0;
  static const double buttonElevation = 4.0;

  /// AppBar Heigt
  static const double appBarHeight = 56.0;

  /// Image Sizes
  static const double imageThumbSize = 80.0;

  /// Default Spacing between Section
  static const double defaultSpace = 24.0;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;

  /// Border Radius
  static const double borderRadiusSm = 4.0;
  static const double borderRadiusMd = 8.0;
  static const double borderRadiusLg = 12.0;

  /// Divider height
  static const double dividerHeight = 1.0;

  /// Product Item dimensions
  static const double productImageSize = 120.0;
  static const double productImageRadius = 16.0;
  static const double productImageHeight = 160.0;

  /// Input Field
  static const double inputFieldRadius = 12.0;
  static const double spaceBtwInputFields = 16.0;

  /// Card Sizes
  static const double cardRadiusSm = 10.0;
  static const double cardRadiusMd = 12.0;
  static const double cardRadiusLg = 16.0;
  static const double cardRadiusXs = 6.0;
  static const double cardElevation = 2.0;

  /// Image carousel height
  static const double imageCarouselHeight = 200.0;

  /// Loading indicator size
  static const double loadingIndicatorSize = 36.0;

  /// Grid view spacing
  static const double gridViewSpacing = 16.0;
}
