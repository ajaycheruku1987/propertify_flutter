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
      promotedAt: json['promoted_at'] as String?,
      promotedUntil: json['promoted_until'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      isFavourited: json['is_favourited'] as bool?,
      isLiked: json['is_liked'] as bool?,
      likesCount: (json['likes_count'] as num?)?.toInt(),
      commentsCount: (json['comments_count'] as num?)?.toInt(),
      viewsCount: (json['views_count'] as num?)?.toInt(),
      plotArea: _toString(json['plot_area']),
      areaUnit: _toString(json['area_unit']),
      facing: _toString(json['facing']),
      roadWidth: _toString(json['road_width']),
      postedBy: _toString(json['posted_by']),
      approvalStatus: _toString(json['approval_status']),
      dimensions: _toString(json['dimensions']),
      isCornerPlot: json['is_corner_plot'] as bool?,
      isGatedCommunity: json['is_gated_community'] as bool?,
      mainCategory: _toString(json['main_category']),
      subCategory: _toString(json['sub_category']),
      isNegotiable: json['is_negotiable'] as bool?,
      securityDeposit: _toString(json['security_deposit']),
      propertyStatus: _toString(json['property_status']),
      contactViaPhone: json['contact_via_phone'] as bool?,
      contactViaWhatsApp: json['contact_via_whatsapp'] as bool?,
      carpetArea: _toString(json['carpet_area']),
      carpetAreaUnit: _toString(json['carpet_area_unit']),
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
      'promoted_at': instance.promotedAt,
      'promoted_until': instance.promotedUntil,
      'owner': instance.owner,
      'is_favourited': instance.isFavourited,
      'is_liked': instance.isLiked,
      'likes_count': instance.likesCount,
      'comments_count': instance.commentsCount,
      'views_count': instance.viewsCount,
      'plot_area': instance.plotArea,
      'area_unit': instance.areaUnit,
      'facing': instance.facing,
      'road_width': instance.roadWidth,
      'posted_by': instance.postedBy,
      'approval_status': instance.approvalStatus,
      'dimensions': instance.dimensions,
      'is_corner_plot': instance.isCornerPlot,
      'is_gated_community': instance.isGatedCommunity,
      'main_category': instance.mainCategory,
      'sub_category': instance.subCategory,
      'is_negotiable': instance.isNegotiable,
      'security_deposit': instance.securityDeposit,
      'property_status': instance.propertyStatus,
      'contact_via_phone': instance.contactViaPhone,
      'contact_via_whatsapp': instance.contactViaWhatsApp,
      'carpet_area': instance.carpetArea,
      'carpet_area_unit': instance.carpetAreaUnit,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      id: json['id'] as String?,
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'],
      username: json['username'] as String?,
      profileImage: json['profilepic'] as String?,
      memberSince: json['member_since'] as String?,
      postsCount: (json['posts_count'] as num?)?.toInt(),
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
      'profilepic': instance.profileImage,
      'member_since': instance.memberSince,
      'posts_count': instance.postsCount,
    };
