import 'package:flutter/material.dart';

import 'appointment_doctor_delegate.dart';

class AppointmentDoctorScreen extends StatelessWidget {
  const AppointmentDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return const Scaffold(
        body: AppointmentDoctorDelegate()
    );
  }
}
