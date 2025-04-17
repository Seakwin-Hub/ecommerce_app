import 'dart:convert';

import 'package:ecommerce_app/features/localization/domain/models/language_model.dart';
import 'package:ecommerce_app/utils/app_constants.dart';
import 'package:flutter/services.dart';

Future<Map<String, Map<String, String>>> init() async {
  ///Core

  ///Repository Interface

  ///Service Interface

  ///Controller

  /// Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValue = await rootBundle
        .loadString("assets/language/${languageModel.languageCode}.json");
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValue);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }

  return languages;
}
