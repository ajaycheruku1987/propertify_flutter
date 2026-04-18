// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_admin_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectsAdminResponseImpl _$$ProjectsAdminResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectsAdminResponseImpl(
      items: (json['items'] as List<dynamic>?)
          ?.map(
              (e) => ProjectsAdminViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectsAdminResponseImplToJson(
        _$ProjectsAdminResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.items,
      'meta': instance.meta,
    };

_$ProjectsAdminViewModelImpl _$$ProjectsAdminViewModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProjectsAdminViewModelImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      propertyType: json['property_type'] as String?,
      projectName: json['project_name'] as String?,
      area: (json['area'] as num?)?.toDouble(),
      areaUnit: json['area_unit'] as String?,
      reraNumber: json['rera_number'] as String?,
      noOfUnits: (json['no_of_units'] as num?)?.toInt(),
      type: json['type'] as String?,
      description: json['description'] as String?,
      specifications: json['specifications'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      location: json['location'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      publicFacilities: json['public_facilities'] as String?,
      imageUrls: (json['image_urls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      brochureUrl: json['brochure_url'] as String?,
      createdAt: json['created_at'] as String?,
      owner: json['owner'] == null
          ? null
          : ProjectOwner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProjectsAdminViewModelImplToJson(
        _$ProjectsAdminViewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'property_type': instance.propertyType,
      'project_name': instance.projectName,
      'area': instance.area,
      'area_unit': instance.areaUnit,
      'rera_number': instance.reraNumber,
      'no_of_units': instance.noOfUnits,
      'type': instance.type,
      'description': instance.description,
      'specifications': instance.specifications,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'location': instance.location,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'public_facilities': instance.publicFacilities,
      'image_urls': instance.imageUrls,
      'brochure_url': instance.brochureUrl,
      'created_at': instance.createdAt,
      'owner': instance.owner,
    };

_$ProjectOwnerImpl _$$ProjectOwnerImplFromJson(Map<String, dynamic> json) =>
    _$ProjectOwnerImpl(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      username: json['username'] as String?,
      profilepic: json['profilepic'] as String?,
    );

Map<String, dynamic> _$$ProjectOwnerImplToJson(_$ProjectOwnerImpl instance) =>
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

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      page: (json['page'] as num?)?.toInt(),
      pageSize: (json['page_size'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      hasNext: json['has_next'] as bool?,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'page_size': instance.pageSize,
      'total': instance.total,
      'has_next': instance.hasNext,
    };
