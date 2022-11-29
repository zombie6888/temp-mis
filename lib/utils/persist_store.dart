import 'package:shared_preferences/shared_preferences.dart';

class PersistStore {
  SharedPreferences prefs;
  PersistStore(this.prefs);

  Future<void> storeApiTokens(String token, [String? refreshToken]) async {
    await prefs.setString('token', token);
    if(refreshToken != null) {
       await prefs.setString('refreshToken', refreshToken);
    }
  }

  Future<bool> clearApiTokens() async {
    return await prefs.remove('token') && await prefs.remove('refreshToken');
  }

  String? get apiToken => prefs.getString('token');
  String? get apiRefreshToken => prefs.getString('refreshToken'); 
}