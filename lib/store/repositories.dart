//import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api/api_config.dart';
import '../api/api_repository.dart';
import '../api/api_transformer.dart';
import '../utils/logger.dart';
import '../utils/persist_store.dart';

class Repositories extends StatelessWidget {
  final Widget child;
  final ApiConfig config;
  const Repositories({Key? key, required this.config, required this.child})
      : super(key: key);

  Dio createApiClient(ApiConfig config, PersistStore store) {
    final options = config.getDioOptions(config);
    Dio dio = Dio(options);
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      // Do something before request is sent
      options.baseUrl = config.serverUrl;
      if (config.token != null) {
        logger.d('request: ${options.uri} token: ${config.token}');
        if (config.isTokenExpired()) {
          dio.post('/token/refresh/',
              data: {'refresh': config.refreshToken}).then((response) {
            final json = response.data;
            final token = json['access'] as String;
            store.storeApiTokens(token).then((value) {
              config.updateTokens(token);
              logger.d('token refresh success');
              options.headers['Authorization'] = 'Bearer $token';
              options.headers['Cache-Control'] = 'no-store';
              handler.next(options);
            });
          }, onError: (err) {
            logger.e(
                'token refresh error: $err, refreshToken: ${config.refreshToken}');
            handler.reject(err, true);
          });
        }
        options.headers['Authorization'] = 'Bearer ${config.token}';
      }

      //TODO: remove hardcode
      options.headers['apikey'] = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtxdmtwdHp3aGFyb3VucWxveW5iIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NjgxNzM0NzMsImV4cCI6MTk4Mzc0OTQ3M30.Jwm6fnp-PuGO2ZAJayR-s4uS-JLa9oPjfupEs5ZrZkw';

      // final deviceInfo = config.deviceInfo;
      // final packageInfo = config.packageInfo;
      // if (deviceInfo != null) {
      //   if (deviceInfo is AndroidDeviceInfo) {
      //     options.headers['device_type'] = 'android';
      //     options.headers['device_model'] = deviceInfo.model;
      //   }
      //   if (deviceInfo is IosDeviceInfo) {
      //     options.headers['device_type'] = 'ios';
      //     options.headers['device_model'] = deviceInfo.utsname.machine;
      //   }
      //   if (deviceInfo is WebBrowserInfo) {
      //     options.headers['device_type'] = 'web';
      //   }
      // }
      // if (packageInfo != null) {
      //   options.headers['app_version'] = packageInfo.version;
      // }
      // logger.d(BlocProvider.of<AppBloc>(context));
      return handler.next(options);

      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // If you want to reject the request with a error message,
      // you can reject a `DioError` object eg: return `dio.reject(dioError)`
    }, onError: (DioError e, handler) {
      // Do something with response error
      logger.e('request: ${e.requestOptions.baseUrl}${e.requestOptions.path}');
      logger.e('headers: ${e.requestOptions.headers.entries}');
      logger.e('payload: ${e.requestOptions.data}');
      return handler.next(e); //continue
      // If you want to resolve the request with some custom data，
      // you can resolve a `Response` object eg: return `dio.resolve(response)`.
    }));
    //..transformer = ApiTransformer();
    if (!kDebugMode) {
      dio.transformer = ApiTransformer();
    }
    return dio;
  }

  @override
  Widget build(BuildContext context) {
    final persistStore = context.read<PersistStore>();
    final Dio apiClient = createApiClient(config, persistStore);
    return RepositoryProvider(
      lazy: false,
      create: (BuildContext context) => ApiRepository(config, apiClient),
      child: child,
    );
  }
}
