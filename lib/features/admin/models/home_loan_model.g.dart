// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_loan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HomeLoanModelImpl _$$HomeLoanModelImplFromJson(Map<String, dynamic> json) =>
    _$HomeLoanModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      budgetPrice: json['budget_price'] as String?,
      address: json['address'] as String?,
      postedBy: json['posted_by'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$HomeLoanModelImplToJson(_$HomeLoanModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'budget_price': instance.budgetPrice,
      'address': instance.address,
      'posted_by': instance.postedBy,
      'created_at': instance.createdAt,
    };
