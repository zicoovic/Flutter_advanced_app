import 'package:flutter/material.dart';

enum LanguageType {
  english,
  arabic,
}

const String arabic = 'AR';
const String english = 'EN';
const String assetPathLocalisation = 'assets/translations';

const Locale arabicLocal = Locale('ar', 'SA');
const Locale englishLocal = Locale('en', 'US');

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
