
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static const IS_AUTHENTICATED = "isAuth";
  static const API_TOKEN = "apiToken";

  static setAuthentication(bool data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(IS_AUTHENTICATED, data);
  }

  static Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(IS_AUTHENTICATED) ?? false;
  }

  static setApiToken(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(API_TOKEN, data);
  }

  static Future<bool> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(API_TOKEN) ?? false;
  }

}