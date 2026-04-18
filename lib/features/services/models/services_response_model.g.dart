// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'services_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServicesResponseModelImpl _$$ServicesResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ServicesResponseModelImpl(
      agentName: json['agent_name'] as String?,
      description: json['description'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      pincode: json['pincode'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      socialFacebook: json['social_facebook'] as String?,
      socialInstagram: json['social_instagram'] as String?,
      socialLinkedin: json['social_linkedin'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isVerified: json['is_verified'] as bool?,
      rating: json['rating'] as String?,
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      isPromoted: json['is_promoted'] as bool?,
      promotedUntil: json['promoted_until'] as String?,
      createdAt: json['created_at'] as String?,
      aadharCardImageUrl: json['aadhar_card_image_url'] as String?,
      aadharVerificationStatus: json['aadhar_verification_status'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      myReview: json['my_review'] == null
          ? null
          : MyReview.fromJson(json['my_review'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServicesResponseModelImplToJson(
        _$ServicesResponseModelImpl instance) =>
    <String, dynamic>{
      'agent_name': instance.agentName,
      'description': instance.description,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'pincode': instance.pincode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'social_facebook': instance.socialFacebook,
      'social_instagram': instance.socialInstagram,
      'social_linkedin': instance.socialLinkedin,
      'image_urls': instance.imageUrls,
      'id': instance.id,
      'user_id': instance.userId,
      'category': instance.category,
      'is_verified': instance.isVerified,
      'rating': instance.rating,
      'rating_count': instance.ratingCount,
      'is_promoted': instance.isPromoted,
      'promoted_until': instance.promotedUntil,
      'created_at': instance.createdAt,
      'aadhar_card_image_url': instance.aadharCardImageUrl,
      'aadhar_verification_status': instance.aadharVerificationStatus,
      'owner': instance.owner,
      'my_review': instance.myReview,
    };

_$MyReviewImpl _$$MyReviewImplFromJson(Map<String, dynamic> json) =>
    _$MyReviewImpl(
      rating: (json['rating'] as num?)?.toInt(),
      review: json['review'] as String?,
      id: json['id'] as String?,
      serviceId: json['service_id'] as String?,
      userId: json['user_id'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$MyReviewImplToJson(_$MyReviewImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'review': instance.review,
      'id': instance.id,
      'service_id': instance.serviceId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
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
