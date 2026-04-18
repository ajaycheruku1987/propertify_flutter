// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_ad_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BannerAdModelImpl _$$BannerAdModelImplFromJson(Map<String, dynamic> json) =>
    _$BannerAdModelImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      planName: json['plan_name'] as String?,
      planDays: (json['plan_days'] as num?)?.toInt(),
      amount: (json['amount'] as num?)?.toDouble(),
      termsAccepted: json['terms_accepted'] as bool?,
      createdAt: json['created_at'] as String?,
      expiresAt: json['expires_at'] as String?,
      approved: json['approved'] as bool?,
      isPaid: json['is_paid'] as bool?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BannerAdModelImplToJson(_$BannerAdModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'image_urls': instance.imageUrls,
      'description': instance.description,
      'plan_name': instance.planName,
      'plan_days': instance.planDays,
      'amount': instance.amount,
      'terms_accepted': instance.termsAccepted,
      'created_at': instance.createdAt,
      'expires_at': instance.expiresAt,
      'approved': instance.approved,
      'is_paid': instance.isPaid,
      'owner': instance.owner,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      username: json['username'] as String?,
      profileImage: json['profilepic'] as String?,
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'username': instance.username,
      'profilepic': instance.profileImage,
    };
