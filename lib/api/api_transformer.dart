import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

// Must be top-level function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

class ApiTransformer extends DefaultTransformer {
  ApiTransformer() : super(jsonDecodeCallback: parseJson);

  // @override
  // Future transformResponse(RequestOptions options, ResponseBody response) {
  //   // https://github.com/flutterchina/dio/issues/737
  //   // response.headers['content-type'] = ['application/json; charset=utf-8'];
  //   return super.transformResponse(options, response);
  // }
}