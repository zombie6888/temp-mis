import '../models/doctor.dart';
import 'api_data_source.dart';

class AppointmentDataSource extends ApiDataSource {
  AppointmentDataSource(api) : super(api);

  // Future<Cart> getCart() async {
  //   final response = await api.get('cart/');
  //   final json = response.data;
  //   return Cart.fromJson(json);
  // }

  Future<List<Doctor>> getDoctors() async {
    final response = await api.get('Doctor');
    final json = response.data as List<dynamic>;
    return json.map((j) => Doctor.fromJson(j)).toList();
  }
}
