import 'package:get/get.dart';

class Messanges extends Translations {
  final Map<String, Map<String, String>>? languages;
  Messanges({required this.languages});

  @override
  Map<String, Map<String, String>> get keys {
    return languages!;
  }
}
