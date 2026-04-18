// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'callback_request_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CallbackRequestResponseModelImpl _$$CallbackRequestResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CallbackRequestResponseModelImpl(
      id: json['id'] as String?,
      salesProjectId: json['sales_project_id'] as String?,
      requestedByUserId: json['requested_by_user_id'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      preferredTime: json['preferred_time'] as String?,
      message: json['message'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$CallbackRequestResponseModelImplToJson(
        _$CallbackRequestResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sales_project_id': instance.salesProjectId,
      'requested_by_user_id': instance.requestedByUserId,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'preferred_time': instance.preferredTime,
      'message': instance.message,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
