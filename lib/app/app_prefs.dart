import 'package:shared_preferences/shared_preferences.dart';

import '../persentation/resources/language_manager.dart';

const String prefsKeyLanguage = 'prefs_key_language';

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(prefsKeyLanguage);

    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.english.getValue();
    }
  }
}
