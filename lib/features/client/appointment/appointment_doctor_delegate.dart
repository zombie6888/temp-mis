import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mis/features/client/appointment/appointment_doctor.dart';
import 'package:mis/store/appointment/appointment_bloc.dart';
import 'package:mis/store/appointment/appointment_event.dart';
import 'package:mis/store/appointment/appointment_state.dart';

class AppointmentDoctorDelegate extends StatefulWidget {
  const AppointmentDoctorDelegate({super.key});

  @override
  State<AppointmentDoctorDelegate> createState() =>
      _AppointmentDoctorDelegateState();
}

class _AppointmentDoctorDelegateState extends State<AppointmentDoctorDelegate> {
  @override
  void initState() {
    context.read<AppointmentBloc>().add(FetchDoctorsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppointmentBloc, AppointmentState>(
        listener: (context, state) {
      final test = state.doctors;
    }, builder: (context, state) {
      return AppointmentDoctors(
        doctors: state.doctors,
      );
    });
  }
}
