// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddPostResponseImpl _$$AddPostResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AddPostResponseImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      address: json['address'] as String?,
      propertyType: json['property_type'] as String?,
      listingType: json['listing_type'] as String?,
      price: (json['price'] as num?)?.toInt(),
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isFeatured: json['is_featured'] as bool?,
      rating: (json['rating'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      isPromoted: json['is_promoted'] as bool?,
      promotedUntil: json['promoted_until'],
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AddPostResponseImplToJson(
        _$AddPostResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'city': instance.city,
      'address': instance.address,
      'property_type': instance.propertyType,
      'listing_type': instance.listingType,
      'price': instance.price,
      'image_urls': instance.imageUrls,
      'is_featured': instance.isFeatured,
      'rating': instance.rating,
      'created_at': instance.createdAt,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'is_promoted': instance.isPromoted,
      'promoted_until': instance.promotedUntil,
      'owner': instance.owner,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      id: json['id'] as String?,
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'],
    );

Map<String, dynamic> _$$OwnerImplToJson(_$OwnerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'date_of_birth': instance.dateOfBirth,
    };
