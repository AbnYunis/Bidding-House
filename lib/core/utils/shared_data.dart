import 'package:shared_preferences/shared_preferences.dart';

class SharedData {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveUserImage({required String userImage}) async {
    await prefs?.setString('userImage', userImage);
  }

  static String? getUserImage() {
    return prefs?.getString('userImage');
  }

  static Future<bool>? removeData(String key) {
    return prefs?.remove(key);
  }
}
