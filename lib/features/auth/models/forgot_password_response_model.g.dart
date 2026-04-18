// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForgotPasswordResponseModelImpl _$$ForgotPasswordResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ForgotPasswordResponseModelImpl(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$ForgotPasswordResponseModelImplToJson(
        _$ForgotPasswordResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
