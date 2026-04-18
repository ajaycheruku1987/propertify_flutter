// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_posts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedPostsResponseModelImpl _$$FeedPostsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FeedPostsResponseModelImpl(
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
      latitude: (json['latitude'] as num?)?.toInt(),
      longitude: (json['longitude'] as num?)?.toInt(),
      isPromoted: json['is_promoted'] as bool?,
      promotedUntil: json['promoted_until'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      isFavourited: json['is_favourited'] as bool?,
      isLiked: json['is_liked'] as bool?,
      likesCount: (json['likes_count'] as num?)?.toInt(),
      commentsCount: (json['comments_count'] as num?)?.toInt(),
      viewsCount: (json['views_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$FeedPostsResponseModelImplToJson(
        _$FeedPostsResponseModelImpl instance) =>
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
      'is_favourited': instance.isFavourited,
      'is_liked': instance.isLiked,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'views_count': instance.viewsCount,
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
