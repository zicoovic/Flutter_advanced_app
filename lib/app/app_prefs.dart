import 'package:shared_preferences/shared_preferences.dart';

import '../persentation/resources/language_manager.dart';

const String prefsKeyLanguage = 'prefs_key_language';
const String prefsKeyOnBoardingScreenViewed =
    'prefs_Key_OnBoarding_Screen_View';
const String prefsKeyIsUserLoggedIn = 'prefs_Key_Is_User_Logged_In';

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

  // on boarding

  Future<void> setOnBoardingScreenViewed() async =>
      _sharedPreferences.setBool(prefsKeyOnBoardingScreenViewed, true);
  Future<bool> isOnBoardingScreenViewed() async =>
      _sharedPreferences.getBool(prefsKeyOnBoardingScreenViewed) ?? false;

  //login
  Future<void> setUserLoggedIn() async =>
      _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  Future<bool> isUserLoggedIn() async =>
      _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
}
