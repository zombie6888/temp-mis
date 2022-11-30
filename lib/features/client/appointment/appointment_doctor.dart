import 'package:flutter/material.dart';
import 'package:mis/features/client/appointment/doctor_item.dart';
import 'package:mis/models/doctor.dart';
import 'package:mis/ui/layouts/content_layout.dart';

class AppointmentDoctors extends StatelessWidget {
  final List<Doctor> doctors;
  const AppointmentDoctors({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return ContentLayout(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return DoctorItem(doctor: doctor);
        },
        itemCount: doctors.length,
        separatorBuilder: (_, __) => const SizedBox(height: 20),
      ),
    );
  }
}
