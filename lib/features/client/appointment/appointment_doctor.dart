import 'package:flutter/material.dart';
import 'package:mis/features/client/appointment/doctor_item.dart';
import 'package:mis/models/doctor.dart';
import 'package:mis/ui/layouts/content_layout.dart';
import 'package:mis/utils/screen_utils.dart';
import 'package:provider/provider.dart';

class AppointmentDoctors extends StatelessWidget {
  final List<Doctor> doctors;
  const AppointmentDoctors({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    final textStyle = Provider.of<ScreenUtils>(context).text;
    return ContentLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 14, top: 7),
            child: Text("Выберите специальность врача", style: textStyle.t20400()),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                final doctor = doctors[index];
                return DoctorItem(doctor: doctor);
              },
              itemCount: doctors.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
            ),
          ),
        ],
      ),
    );
  }
}
