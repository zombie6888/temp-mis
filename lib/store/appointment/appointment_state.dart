import 'package:flutter/foundation.dart';
import '../../models/doctor.dart';
import 'appointment_event.dart';

enum AppointmentRequestStatus { idle, sending, success, error }

enum AppointmentAction {
  init,
  fetchDoctors  
}

@immutable
class AppointmentState {
  final List<Doctor> doctors;

  final AppointmentRequestStatus status;
  final AppointmentEvent? failedEvent;
  final AppointmentAction action;

  const AppointmentState(
      {this.doctors = const <Doctor>[],
      this.status = AppointmentRequestStatus.idle,
      this.action = AppointmentAction.init,      
      this.failedEvent});

  AppointmentState copyWith(
      {List<Doctor>? doctors,
      AppointmentRequestStatus? status,    
      AppointmentEvent? failedEvent,
      AppointmentAction? action}) {
    return AppointmentState(
        doctors: doctors ?? this.doctors,        
        status: status ?? this.status,      
        failedEvent: failedEvent ?? this.failedEvent,
        action: action ?? this.action);
  }
}
