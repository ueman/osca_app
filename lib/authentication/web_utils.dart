import 'package:osca_dart/web/osca_web_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebUtils {
  static Future<bool> checkAndsaveFedAuthCookie(String cookie) async {
    final api = OscaWebApi(cookie);
    final couldConnect = await api.canConnect();
    if (!couldConnect) {
      return false;
    }
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString('fedAuth', cookie);
    await preferences.setString('fedAuthSaveDate', DateTime.now().toString());
    return true;
  }

  static Future<String> getFedAuthCookie() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('fedAuth')) {
      return preferences.getString('fedAuth');
    }
    return null;
  }

  static Future<DateTime> getFedAuthCookieSaveDate() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('fedAuthSaveDate')) {
      return DateTime.parse(preferences.getString('fedAuthSaveDate'));
    }
    return null;
  }
}
