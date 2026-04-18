// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_requests_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationRequestsResponseModelImpl
    _$$VerificationRequestsResponseModelImplFromJson(
            Map<String, dynamic> json) =>
        _$VerificationRequestsResponseModelImpl(
          verificationRequests: (json['verification_requests']
                  as List<dynamic>?)
              ?.map((e) =>
                  VerificationRequestModel.fromJson(e as Map<String, dynamic>))
              .toList(),
          total: (json['total'] as num?)?.toInt(),
          page: (json['page'] as num?)?.toInt(),
          limit: (json['limit'] as num?)?.toInt(),
        );

Map<String, dynamic> _$$VerificationRequestsResponseModelImplToJson(
        _$VerificationRequestsResponseModelImpl instance) =>
    <String, dynamic>{
      'verification_requests': instance.verificationRequests,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
