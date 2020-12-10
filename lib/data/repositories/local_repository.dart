import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository {
  Future<String> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name') ?? null;
  }

  setUser(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', value);
  }
}
