import 'dart:convert';

import 'package:news_app/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  PreferenceService._();

  factory PreferenceService.getInstance() => _instance;

  static final PreferenceService _instance = PreferenceService._();

  static const String LOGGED_IN_USER = 'logged_in_user';
  static const String SET_PREFERENCE = 'set_preference';

  Future<SharedPreferences> _getInstance() async {
    return SharedPreferences.getInstance();
  }

  Future<void> setAuthUser(User user) async {
    if (user != null) {
      (await _getInstance()).setString(
          PreferenceService.LOGGED_IN_USER, json.encode(User.toJson(user)));
    } else {
      (await _getInstance())
          .setString(PreferenceService.LOGGED_IN_USER, user.toString());
    }
  }

  Future<User> getAuthUser() async {
    final String user =
        (await _getInstance()).getString(PreferenceService.LOGGED_IN_USER);
    if (user == null) {
      return null;
    }
    return User.fromJson(json.decode(user));
  }
}
