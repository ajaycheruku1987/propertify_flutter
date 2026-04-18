// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_reviews_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceReviewsResponseModelImpl _$$ServiceReviewsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ServiceReviewsResponseModelImpl(
      rating: (json['rating'] as num?)?.toInt(),
      review: json['review'] as String?,
      id: json['id'] as String?,
      serviceId: json['service_id'] as String?,
      userId: json['user_id'] as String?,
      createdAt: json['created_at'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ServiceReviewsResponseModelImplToJson(
        _$ServiceReviewsResponseModelImpl instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'review': instance.review,
      'id': instance.id,
      'service_id': instance.serviceId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'user': instance.user,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      profilepic: json['profilepic'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profilepic': instance.profilepic,
    };
