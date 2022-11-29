// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: json['id'] as int,
      createdAt: json['created_at'] as String,
      userId: json['user_id'] as String?,
      name: json['Name'] as String,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'user_id': instance.userId,
      'Name': instance.name,
    };
