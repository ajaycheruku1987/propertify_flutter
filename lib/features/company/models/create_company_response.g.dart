// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_company_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateCompanyResponseImpl _$$CreateCompanyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateCompanyResponseImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      companyName: json['company_name'] as String?,
      category: json['category'] as String?,
      about: json['about'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      gstNumber: json['gst_number'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      twitterUrl: json['twitter_url'] as String?,
      websiteUrl: json['website_url'] as String?,
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CreateCompanyResponseImplToJson(
        _$CreateCompanyResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'company_name': instance.companyName,
      'category': instance.category,
      'about': instance.about,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'gst_number': instance.gstNumber,
      'facebook_url': instance.facebookUrl,
      'instagram_url': instance.instagramUrl,
      'twitter_url': instance.twitterUrl,
      'website_url': instance.websiteUrl,
      'image_url': instance.imageUrl,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'owner': instance.owner,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      username: json['username'] as String?,
      profilepic: json['profilepic'] as String?,
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'date_of_birth': instance.dateOfBirth,
      'username': instance.username,
      'profilepic': instance.profilepic,
    };
