// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedStateImpl _$$FeedStateImplFromJson(Map<String, dynamic> json) =>
    _$FeedStateImpl(
      postDetails: json['postDetails'] == null
          ? null
          : FeedPostsResponseModel.fromJson(
              json['postDetails'] as Map<String, dynamic>),
      similarProperties: (json['similarProperties'] as List<dynamic>?)
              ?.map((e) =>
                  FeedPostsResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      similarPostsByCategory: (json['similarPostsByCategory'] as List<dynamic>?)
              ?.map((e) =>
                  FeedPostsResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      feedsList: (json['feedsList'] as List<dynamic>?)
              ?.map((e) =>
                  FeedPostsResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      myPropertiesList: (json['myPropertiesList'] as List<dynamic>?)
              ?.map((e) =>
                  FeedPostsResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      favouritesList: (json['favouritesList'] as List<dynamic>?)
              ?.map((e) =>
                  FeedPostsResponseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      likedPostIds: (json['likedPostIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
      currentOffset: (json['currentOffset'] as num?)?.toInt() ?? 0,
      hasMoreData: json['hasMoreData'] as bool? ?? false,
      feedComments: (json['feedComments'] as List<dynamic>?)
              ?.map((e) => FeedCommentModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      myPropertiesOffset: (json['myPropertiesOffset'] as num?)?.toInt() ?? 0,
      hasMoreMyProperties: json['hasMoreMyProperties'] as bool? ?? false,
    );

Map<String, dynamic> _$$FeedStateImplToJson(_$FeedStateImpl instance) =>
    <String, dynamic>{
      'postDetails': instance.postDetails,
      'similarProperties': instance.similarProperties,
      'similarPostsByCategory': instance.similarPostsByCategory,
      'feedsList': instance.feedsList,
      'myPropertiesList': instance.myPropertiesList,
      'favouritesList': instance.favouritesList,
      'likedPostIds': instance.likedPostIds.toList(),
      'currentOffset': instance.currentOffset,
      'hasMoreData': instance.hasMoreData,
      'feedComments': instance.feedComments,
      'myPropertiesOffset': instance.myPropertiesOffset,
      'hasMoreMyProperties': instance.hasMoreMyProperties,
    };
