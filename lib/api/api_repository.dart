import 'package:dio/dio.dart';
import 'package:mis/api/appointment_data_source.dart';

import 'api_config.dart';

class ApiRepository {
  final Dio client;
  final ApiConfig config;

  final AppointmentDataSource appointment;

  ApiRepository(this.config, this.client)
      : appointment = AppointmentDataSource(client);
  //   cart = CartDataSource(client),
  //   public = PublicDataSource(client),
  //   delivery = DeliveryDataSource(client),
  //   users = UsersDataSource(client),
  //   checkout = CheckoutDataSource(client),
  //   filters = FiltersDataSource(client);
}
