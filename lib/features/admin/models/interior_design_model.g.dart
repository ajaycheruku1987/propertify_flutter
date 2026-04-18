// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interior_design_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InteriorDesignModelImpl _$$InteriorDesignModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InteriorDesignModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      budgetPrice: json['budget_price'] as String?,
      address: json['address'] as String?,
      postedBy: json['posted_by'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$InteriorDesignModelImplToJson(
        _$InteriorDesignModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'budget_price': instance.budgetPrice,
      'address': instance.address,
      'posted_by': instance.postedBy,
      'created_at': instance.createdAt,
    };
