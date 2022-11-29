import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:package_info_plus/package_info_plus.dart';

class ApiConfig with ChangeNotifier {
  String? _serverUrl;
  String? _token;
  String? _refreshToken;
  // BaseDeviceInfo? _deviceInfo;
  // PackageInfo? _packageInfo;

  ApiConfig(this._serverUrl, {String? token}) : _token = token;

  updateTokens(String? token, [String? refreshToken]) {
    _token = token;
    if (refreshToken != null) {
      _refreshToken = refreshToken;
    }
    notifyListeners();
  }

  bool isTokenExpired() {
    final token = _token;
    if (token != null) {
      return JwtDecoder.isExpired(token);
    }
    return true;
  }

  bool isAuthorized() => _token != null;

  int? getUserId() {
    final token = _token;
    if (token != null) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      if (decodedToken.containsKey('user_id')) {
        return decodedToken['user_id'];
      }
    }
    return null;
  }

  BaseOptions getDioOptions(ApiConfig config) => BaseOptions(
      baseUrl: config.serverUrl,
      connectTimeout: 15000,
      receiveTimeout: 15000,
      contentType: 'application/json',
      responseType: ResponseType.json);

  setServerUrl(String url) {
    _serverUrl = url;
    notifyListeners();
  }

  // Future<void> setDeviceInfo() async {
  //   final deviceInfoPlugin = DeviceInfoPlugin();
  //   final deviceInfo = await deviceInfoPlugin.deviceInfo;
  //   _deviceInfo = deviceInfo;
  //   notifyListeners();
  // }

  // Future<void> setPackageInfo() async {
  //   final packageInfo = await PackageInfo.fromPlatform();
  //   _packageInfo = packageInfo;
  //   notifyListeners();
  // }

  get serverUrl {
    return _serverUrl;
  }

  // get deviceInfo {
  //   return _deviceInfo;
  // }

  // get packageInfo {
  //   return _packageInfo;
  // }

  get token {
    return _token;
  }

  get refreshToken {
    return _token;
  }
}
