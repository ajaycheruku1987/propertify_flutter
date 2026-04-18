// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_loans_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeLoansResponseModelImpl _$$HomeLoansResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HomeLoansResponseModelImpl(
      homeLoans: (json['home_loans'] as List<dynamic>?)
          ?.map((e) => HomeLoanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HomeLoansResponseModelImplToJson(
        _$HomeLoansResponseModelImpl instance) =>
    <String, dynamic>{
      'home_loans': instance.homeLoans,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
