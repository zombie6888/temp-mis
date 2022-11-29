

import 'package:mis/store/appointment/appointment_event.dart';
import 'package:mis/store/appointment/appointment_state.dart';

import '../../api/api_repository.dart';
import '../base_bloc.dart';

class AppointmentBloc extends BaseBloc<AppointmentEvent, AppointmentState> {
  AppointmentBloc({required ApiRepository repository}) : super(const AppointmentState()) {
    final api = repository.appointment;
    on<FetchDoctorsEvent>((event, emit) async {
      emit(state.copyWith(
          status: AppointmentRequestStatus.sending, action: AppointmentAction.fetchDoctors));
      try {
        final doctors = await api.getDoctors();
        emit(state.copyWith(
            status: AppointmentRequestStatus.success,
            doctors: doctors,
            ));
      } catch (e) {
        emit(state.copyWith(
            status: AppointmentRequestStatus.error, failedEvent: event));
        handleError(e, 'fetch doctors');
      }
    });    
  }
}