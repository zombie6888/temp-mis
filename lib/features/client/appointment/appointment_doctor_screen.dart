import 'package:flutter/material.dart';
import 'package:mis/navigation/top_bar.dart';

import 'appointment_doctor_delegate.dart';

class AppointmentDoctorScreen extends StatelessWidget {
  const AppointmentDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return const Scaffold(
        appBar: TopBar(title: "Прием в клинике"),
        body: AppointmentDoctorDelegate()
    );
  }
}
