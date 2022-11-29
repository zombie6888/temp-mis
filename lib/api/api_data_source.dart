import 'package:dio/dio.dart';
abstract class DataSource {}

abstract class ApiDataSource extends DataSource {
  final Dio api;
  ApiDataSource(this.api);
}