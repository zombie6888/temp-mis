import 'package:json_annotation/json_annotation.dart';
part 'doctor.g.dart';

@JsonSerializable()
class Doctor {
  final int id;
  @JsonKey(name: "created_at")
  final String createdAt; 
  @JsonKey(name: "user_id")
  final String? userId;
  @JsonKey(name: "Name")
  final String name;

  factory Doctor.fromJson(Map<String, dynamic> json) =>
      _$DoctorFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorToJson(this);

  Doctor({
    required this.id,
    required this.createdAt,
    required this.userId,
    required this.name,
  });
}
