// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackModelImpl _$$FeedbackModelImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackModelImpl(
      id: json['_id'] as String,
      category: json['category'] as String,
      subject: json['subject'] as String,
      description: json['description'] as String,
      user: json['user'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$FeedbackModelImplToJson(_$FeedbackModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'category': instance.category,
      'subject': instance.subject,
      'description': instance.description,
      'user': instance.user,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
