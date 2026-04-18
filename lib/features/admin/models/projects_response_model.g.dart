// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectsResponseModelImpl _$$ProjectsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectsResponseModelImpl(
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => ProjectModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ProjectsResponseModelImplToJson(
        _$ProjectsResponseModelImpl instance) =>
    <String, dynamic>{
      'projects': instance.projects,
      'total': instance.total,
      'page': instance.page,
      'limit': instance.limit,
    };
