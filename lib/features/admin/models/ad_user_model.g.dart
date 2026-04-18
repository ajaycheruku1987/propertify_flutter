// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdUserModelImpl _$$AdUserModelImplFromJson(Map<String, dynamic> json) =>
    _$AdUserModelImpl(
      id: json['id'] as String?,
      phoneNumber: json['phone_number'] as String?,
      role: json['role'] as String?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$AdUserModelImplToJson(_$AdUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phone_number': instance.phoneNumber,
      'role': instance.role,
      'user_id': instance.userId,
    };
