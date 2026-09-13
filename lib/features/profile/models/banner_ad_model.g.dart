// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerAdModelImpl _$$BannerAdModelImplFromJson(Map<String, dynamic> json) =>
    _$BannerAdModelImpl(
      amount: (json['amount'] as num?)?.toDouble(),
      approved: json['approved'] as bool?,
      createdAt: json['created_at'] as String?,
      description: json['description'] as String?,
      expiresAt: json['expires_at'] as String?,
      id: json['id'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isPaid: json['is_paid'] as bool?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      planDays: (json['plan_days'] as num?)?.toInt(),
      planName: json['plan_name'] as String?,
      termsAccepted: json['terms_accepted'] as bool?,
      userId: json['user_id'] as String?,
    );

Map<String, dynamic> _$$BannerAdModelImplToJson(_$BannerAdModelImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'approved': instance.approved,
      'created_at': instance.createdAt,
      'description': instance.description,
      'expires_at': instance.expiresAt,
      'id': instance.id,
      'image_urls': instance.imageUrls,
      'is_paid': instance.isPaid,
      'owner': instance.owner,
      'plan_days': instance.planDays,
      'plan_name': instance.planName,
      'terms_accepted': instance.termsAccepted,
      'user_id': instance.userId,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      id: json['id'] as String?,
      lastName: json['last_name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profileImage: json['profilepic'] as String?,
      username: json['username'] as String?,
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'email': instance.email,
      'first_name': instance.firstName,
      'id': instance.id,
      'last_name': instance.lastName,
      'phone_number': instance.phoneNumber,
      'profilepic': instance.profileImage,
      'username': instance.username,
    };
