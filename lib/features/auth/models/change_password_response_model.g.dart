// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChangePasswordResponseModelImpl _$$ChangePasswordResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChangePasswordResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ChangePasswordResponseModelImplToJson(
        _$ChangePasswordResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
