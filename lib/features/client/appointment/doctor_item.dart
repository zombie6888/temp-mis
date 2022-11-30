import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mis/models/doctor.dart';
import 'package:mis/ui/styles.dart';

class DoctorItemData {
  final SvgPicture image;
  final String speciality;
  DoctorItemData(this.image, this.speciality);
}

final Map<int, DoctorItemData> itemData = {
  1: DoctorItemData(SvgPicture.asset('assets/icons/doctors/heart.svg'), 'МРТ'),
  2: DoctorItemData(
      SvgPicture.asset('assets/icons/doctors/medical-kit.svg'), 'УЗИ'),
  3: DoctorItemData(
      SvgPicture.asset('assets/icons/doctors/terapevt.svg'), 'Терапевт'),
  4: DoctorItemData(
      SvgPicture.asset('assets/icons/doctors/medicine.svg'), 'Процедуры')
};

class DoctorItem extends StatelessWidget {
  final Doctor doctor;
  const DoctorItem({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final item = itemData[doctor.id];
    if(item == null) {
      return const SizedBox.shrink();
    }
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(color: CustomColors.brandLight, borderRadius: BorderRadius.circular(6)),
          child: Row(
        children: [
          item.image,
          Expanded(child: Center(child: Padding(
            padding: const EdgeInsets.only(right: 27.0),
            child: Text(item.speciality),
          )))
        ],
      )),
    );
  }
}
