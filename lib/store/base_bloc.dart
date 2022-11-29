import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/logger.dart';

class BlocError {
  Object error;
  String action;
  BlocError(this.error, this.action) {
    if (error is DioError) {
      final e = error as DioError;
      logger.e('$action error: ${e.response ?? ''}, ${e.message}');
    } else {
      final message = error.toString();
      logger.e('$action error: $message');
    }
  }
}

class BaseBloc<E, T> extends Bloc<E, T> {
  BaseBloc(T initialState) : super(initialState);

  void handleError(Object e, String action) {
    BlocError(e, action);
  }
}




