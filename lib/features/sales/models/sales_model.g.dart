// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SalesModelImpl _$$SalesModelImplFromJson(Map<String, dynamic> json) =>
    _$SalesModelImpl(
      salerecords: (json['items'] as List<dynamic>?)
          ?.map((e) => SaleRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SalesModelImplToJson(_$SalesModelImpl instance) =>
    <String, dynamic>{
      'items': instance.salerecords,
      'meta': instance.meta,
    };

_$SaleRecordImpl _$$SaleRecordImplFromJson(Map<String, dynamic> json) =>
    _$SaleRecordImpl(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      propertyType: json['property_type'] as String?,
      projectName: json['project_name'] as String?,
      area: (json['area'] as num?)?.toInt(),
      areaUnit: json['area_unit'] as String?,
      noOfUnits: (json['no_of_units'] as num?)?.toInt(),
      reraNumber: json['rera_number'] as String?,
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
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      possessionDate: json['possession_date'] as String?,
      minPrice: json['min_price'] as num?,
      maxPrice: json['max_price'] as num?,
      saleSpecification: json['sale_specification'] as String?,
    );

Map<String, dynamic> _$$SaleRecordImplToJson(_$SaleRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'property_type': instance.propertyType,
      'project_name': instance.projectName,
      'area': instance.area,
      'area_unit': instance.areaUnit,
      'no_of_units': instance.noOfUnits,
      'rera_number': instance.reraNumber,
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
      'possession_date': instance.possessionDate,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'sale_specification': instance.saleSpecification,
    };

_$OwnerImpl _$$OwnerImplFromJson(Map<String, dynamic> json) => _$OwnerImpl(
      id: json['id'] as String?,
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: json['date_of_birth'],
      username: json['username'] as String?,
      profilepic: json['profilepic'],
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
