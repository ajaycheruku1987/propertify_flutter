// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RequestModelImpl _$$RequestModelImplFromJson(Map<String, dynamic> json) =>
    _$RequestModelImpl(
      id: json['id'] as String?,
      category: json['category'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      budget: (json['budget'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      termsAgreed: json['terms_agreed'] as bool?,
      phoneNumber: json['phone_number'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      owner: json['owner'] == null
          ? null
          : RequestOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RequestModelImplToJson(_$RequestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'state': instance.state,
      'city': instance.city,
      'address': instance.address,
      'description': instance.description,
      'budget': instance.budget,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'terms_agreed': instance.termsAgreed,
      'phone_number': instance.phoneNumber,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'owner': instance.owner,
    };

_$RequestOwnerImpl _$$RequestOwnerImplFromJson(Map<String, dynamic> json) =>
    _$RequestOwnerImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      username: json['username'] as String?,
      profilepic: json['profilepic'] as String?,
    );

Map<String, dynamic> _$$RequestOwnerImplToJson(_$RequestOwnerImpl instance) =>
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
