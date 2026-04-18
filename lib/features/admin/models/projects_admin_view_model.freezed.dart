// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_admin_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectsAdminResponse _$ProjectsAdminResponseFromJson(
    Map<String, dynamic> json) {
  return _ProjectsAdminResponse.fromJson(json);
}

/// @nodoc
mixin _$ProjectsAdminResponse {
  @JsonKey(name: "items")
  List<ProjectsAdminViewModel>? get items => throw _privateConstructorUsedError;
  @JsonKey(name: "meta")
  Meta? get meta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectsAdminResponseCopyWith<ProjectsAdminResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsAdminResponseCopyWith<$Res> {
  factory $ProjectsAdminResponseCopyWith(ProjectsAdminResponse value,
          $Res Function(ProjectsAdminResponse) then) =
      _$ProjectsAdminResponseCopyWithImpl<$Res, ProjectsAdminResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "items") List<ProjectsAdminViewModel>? items,
      @JsonKey(name: "meta") Meta? meta});

  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class _$ProjectsAdminResponseCopyWithImpl<$Res,
        $Val extends ProjectsAdminResponse>
    implements $ProjectsAdminResponseCopyWith<$Res> {
  _$ProjectsAdminResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? meta = freezed,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectsAdminViewModel>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetaCopyWith<$Res>? get meta {
    if (_value.meta == null) {
      return null;
    }

    return $MetaCopyWith<$Res>(_value.meta!, (value) {
      return _then(_value.copyWith(meta: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectsAdminResponseImplCopyWith<$Res>
    implements $ProjectsAdminResponseCopyWith<$Res> {
  factory _$$ProjectsAdminResponseImplCopyWith(
          _$ProjectsAdminResponseImpl value,
          $Res Function(_$ProjectsAdminResponseImpl) then) =
      __$$ProjectsAdminResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "items") List<ProjectsAdminViewModel>? items,
      @JsonKey(name: "meta") Meta? meta});

  @override
  $MetaCopyWith<$Res>? get meta;
}

/// @nodoc
class __$$ProjectsAdminResponseImplCopyWithImpl<$Res>
    extends _$ProjectsAdminResponseCopyWithImpl<$Res,
        _$ProjectsAdminResponseImpl>
    implements _$$ProjectsAdminResponseImplCopyWith<$Res> {
  __$$ProjectsAdminResponseImplCopyWithImpl(_$ProjectsAdminResponseImpl _value,
      $Res Function(_$ProjectsAdminResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
    Object? meta = freezed,
  }) {
    return _then(_$ProjectsAdminResponseImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ProjectsAdminViewModel>?,
      meta: freezed == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as Meta?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectsAdminResponseImpl implements _ProjectsAdminResponse {
  const _$ProjectsAdminResponseImpl(
      {@JsonKey(name: "items") final List<ProjectsAdminViewModel>? items,
      @JsonKey(name: "meta") this.meta})
      : _items = items;

  factory _$ProjectsAdminResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectsAdminResponseImplFromJson(json);

  final List<ProjectsAdminViewModel>? _items;
  @override
  @JsonKey(name: "items")
  List<ProjectsAdminViewModel>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "meta")
  final Meta? meta;

  @override
  String toString() {
    return 'ProjectsAdminResponse(items: $items, meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsAdminResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_items), meta);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsAdminResponseImplCopyWith<_$ProjectsAdminResponseImpl>
      get copyWith => __$$ProjectsAdminResponseImplCopyWithImpl<
          _$ProjectsAdminResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectsAdminResponseImplToJson(
      this,
    );
  }
}

abstract class _ProjectsAdminResponse implements ProjectsAdminResponse {
  const factory _ProjectsAdminResponse(
      {@JsonKey(name: "items") final List<ProjectsAdminViewModel>? items,
      @JsonKey(name: "meta") final Meta? meta}) = _$ProjectsAdminResponseImpl;

  factory _ProjectsAdminResponse.fromJson(Map<String, dynamic> json) =
      _$ProjectsAdminResponseImpl.fromJson;

  @override
  @JsonKey(name: "items")
  List<ProjectsAdminViewModel>? get items;
  @override
  @JsonKey(name: "meta")
  Meta? get meta;
  @override
  @JsonKey(ignore: true)
  _$$ProjectsAdminResponseImplCopyWith<_$ProjectsAdminResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectsAdminViewModel _$ProjectsAdminViewModelFromJson(
    Map<String, dynamic> json) {
  return _ProjectsAdminViewModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectsAdminViewModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "property_type")
  String? get propertyType => throw _privateConstructorUsedError;
  @JsonKey(name: "project_name")
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: "area")
  double? get area => throw _privateConstructorUsedError;
  @JsonKey(name: "area_unit")
  String? get areaUnit => throw _privateConstructorUsedError;
  @JsonKey(name: "rera_number")
  String? get reraNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "no_of_units")
  int? get noOfUnits => throw _privateConstructorUsedError;
  @JsonKey(name: "type")
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "specifications")
  String? get specifications => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: "location")
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "public_facilities")
  String? get publicFacilities => throw _privateConstructorUsedError;
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  @JsonKey(name: "brochure_url")
  String? get brochureUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "owner")
  ProjectOwner? get owner => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectsAdminViewModelCopyWith<ProjectsAdminViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsAdminViewModelCopyWith<$Res> {
  factory $ProjectsAdminViewModelCopyWith(ProjectsAdminViewModel value,
          $Res Function(ProjectsAdminViewModel) then) =
      _$ProjectsAdminViewModelCopyWithImpl<$Res, ProjectsAdminViewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "property_type") String? propertyType,
      @JsonKey(name: "project_name") String? projectName,
      @JsonKey(name: "area") double? area,
      @JsonKey(name: "area_unit") String? areaUnit,
      @JsonKey(name: "rera_number") String? reraNumber,
      @JsonKey(name: "no_of_units") int? noOfUnits,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "specifications") String? specifications,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "public_facilities") String? publicFacilities,
      @JsonKey(name: "image_urls") List<String>? imageUrls,
      @JsonKey(name: "brochure_url") String? brochureUrl,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "owner") ProjectOwner? owner});

  $ProjectOwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$ProjectsAdminViewModelCopyWithImpl<$Res,
        $Val extends ProjectsAdminViewModel>
    implements $ProjectsAdminViewModelCopyWith<$Res> {
  _$ProjectsAdminViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? propertyType = freezed,
    Object? projectName = freezed,
    Object? area = freezed,
    Object? areaUnit = freezed,
    Object? reraNumber = freezed,
    Object? noOfUnits = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? specifications = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? publicFacilities = freezed,
    Object? imageUrls = freezed,
    Object? brochureUrl = freezed,
    Object? createdAt = freezed,
    Object? owner = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      areaUnit: freezed == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      reraNumber: freezed == reraNumber
          ? _value.reraNumber
          : reraNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfUnits: freezed == noOfUnits
          ? _value.noOfUnits
          : noOfUnits // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      publicFacilities: freezed == publicFacilities
          ? _value.publicFacilities
          : publicFacilities // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      brochureUrl: freezed == brochureUrl
          ? _value.brochureUrl
          : brochureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as ProjectOwner?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProjectOwnerCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $ProjectOwnerCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectsAdminViewModelImplCopyWith<$Res>
    implements $ProjectsAdminViewModelCopyWith<$Res> {
  factory _$$ProjectsAdminViewModelImplCopyWith(
          _$ProjectsAdminViewModelImpl value,
          $Res Function(_$ProjectsAdminViewModelImpl) then) =
      __$$ProjectsAdminViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "property_type") String? propertyType,
      @JsonKey(name: "project_name") String? projectName,
      @JsonKey(name: "area") double? area,
      @JsonKey(name: "area_unit") String? areaUnit,
      @JsonKey(name: "rera_number") String? reraNumber,
      @JsonKey(name: "no_of_units") int? noOfUnits,
      @JsonKey(name: "type") String? type,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "specifications") String? specifications,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "state") String? state,
      @JsonKey(name: "location") String? location,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "public_facilities") String? publicFacilities,
      @JsonKey(name: "image_urls") List<String>? imageUrls,
      @JsonKey(name: "brochure_url") String? brochureUrl,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "owner") ProjectOwner? owner});

  @override
  $ProjectOwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$ProjectsAdminViewModelImplCopyWithImpl<$Res>
    extends _$ProjectsAdminViewModelCopyWithImpl<$Res,
        _$ProjectsAdminViewModelImpl>
    implements _$$ProjectsAdminViewModelImplCopyWith<$Res> {
  __$$ProjectsAdminViewModelImplCopyWithImpl(
      _$ProjectsAdminViewModelImpl _value,
      $Res Function(_$ProjectsAdminViewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? propertyType = freezed,
    Object? projectName = freezed,
    Object? area = freezed,
    Object? areaUnit = freezed,
    Object? reraNumber = freezed,
    Object? noOfUnits = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? specifications = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? publicFacilities = freezed,
    Object? imageUrls = freezed,
    Object? brochureUrl = freezed,
    Object? createdAt = freezed,
    Object? owner = freezed,
  }) {
    return _then(_$ProjectsAdminViewModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as double?,
      areaUnit: freezed == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      reraNumber: freezed == reraNumber
          ? _value.reraNumber
          : reraNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfUnits: freezed == noOfUnits
          ? _value.noOfUnits
          : noOfUnits // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      publicFacilities: freezed == publicFacilities
          ? _value.publicFacilities
          : publicFacilities // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      brochureUrl: freezed == brochureUrl
          ? _value.brochureUrl
          : brochureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as ProjectOwner?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectsAdminViewModelImpl implements _ProjectsAdminViewModel {
  const _$ProjectsAdminViewModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "property_type") this.propertyType,
      @JsonKey(name: "project_name") this.projectName,
      @JsonKey(name: "area") this.area,
      @JsonKey(name: "area_unit") this.areaUnit,
      @JsonKey(name: "rera_number") this.reraNumber,
      @JsonKey(name: "no_of_units") this.noOfUnits,
      @JsonKey(name: "type") this.type,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "specifications") this.specifications,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "state") this.state,
      @JsonKey(name: "location") this.location,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "longitude") this.longitude,
      @JsonKey(name: "public_facilities") this.publicFacilities,
      @JsonKey(name: "image_urls") final List<String>? imageUrls,
      @JsonKey(name: "brochure_url") this.brochureUrl,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "owner") this.owner})
      : _imageUrls = imageUrls;

  factory _$ProjectsAdminViewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectsAdminViewModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "property_type")
  final String? propertyType;
  @override
  @JsonKey(name: "project_name")
  final String? projectName;
  @override
  @JsonKey(name: "area")
  final double? area;
  @override
  @JsonKey(name: "area_unit")
  final String? areaUnit;
  @override
  @JsonKey(name: "rera_number")
  final String? reraNumber;
  @override
  @JsonKey(name: "no_of_units")
  final int? noOfUnits;
  @override
  @JsonKey(name: "type")
  final String? type;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "specifications")
  final String? specifications;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "state")
  final String? state;
  @override
  @JsonKey(name: "location")
  final String? location;
  @override
  @JsonKey(name: "latitude")
  final double? latitude;
  @override
  @JsonKey(name: "longitude")
  final double? longitude;
  @override
  @JsonKey(name: "public_facilities")
  final String? publicFacilities;
  final List<String>? _imageUrls;
  @override
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "brochure_url")
  final String? brochureUrl;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "owner")
  final ProjectOwner? owner;

  @override
  String toString() {
    return 'ProjectsAdminViewModel(id: $id, userId: $userId, propertyType: $propertyType, projectName: $projectName, area: $area, areaUnit: $areaUnit, reraNumber: $reraNumber, noOfUnits: $noOfUnits, type: $type, description: $description, specifications: $specifications, address: $address, city: $city, state: $state, location: $location, latitude: $latitude, longitude: $longitude, publicFacilities: $publicFacilities, imageUrls: $imageUrls, brochureUrl: $brochureUrl, createdAt: $createdAt, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsAdminViewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.reraNumber, reraNumber) ||
                other.reraNumber == reraNumber) &&
            (identical(other.noOfUnits, noOfUnits) ||
                other.noOfUnits == noOfUnits) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.specifications, specifications) ||
                other.specifications == specifications) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.publicFacilities, publicFacilities) ||
                other.publicFacilities == publicFacilities) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.brochureUrl, brochureUrl) ||
                other.brochureUrl == brochureUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        propertyType,
        projectName,
        area,
        areaUnit,
        reraNumber,
        noOfUnits,
        type,
        description,
        specifications,
        address,
        city,
        state,
        location,
        latitude,
        longitude,
        publicFacilities,
        const DeepCollectionEquality().hash(_imageUrls),
        brochureUrl,
        createdAt,
        owner
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsAdminViewModelImplCopyWith<_$ProjectsAdminViewModelImpl>
      get copyWith => __$$ProjectsAdminViewModelImplCopyWithImpl<
          _$ProjectsAdminViewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectsAdminViewModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectsAdminViewModel implements ProjectsAdminViewModel {
  const factory _ProjectsAdminViewModel(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "user_id") final String? userId,
          @JsonKey(name: "property_type") final String? propertyType,
          @JsonKey(name: "project_name") final String? projectName,
          @JsonKey(name: "area") final double? area,
          @JsonKey(name: "area_unit") final String? areaUnit,
          @JsonKey(name: "rera_number") final String? reraNumber,
          @JsonKey(name: "no_of_units") final int? noOfUnits,
          @JsonKey(name: "type") final String? type,
          @JsonKey(name: "description") final String? description,
          @JsonKey(name: "specifications") final String? specifications,
          @JsonKey(name: "address") final String? address,
          @JsonKey(name: "city") final String? city,
          @JsonKey(name: "state") final String? state,
          @JsonKey(name: "location") final String? location,
          @JsonKey(name: "latitude") final double? latitude,
          @JsonKey(name: "longitude") final double? longitude,
          @JsonKey(name: "public_facilities") final String? publicFacilities,
          @JsonKey(name: "image_urls") final List<String>? imageUrls,
          @JsonKey(name: "brochure_url") final String? brochureUrl,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "owner") final ProjectOwner? owner}) =
      _$ProjectsAdminViewModelImpl;

  factory _ProjectsAdminViewModel.fromJson(Map<String, dynamic> json) =
      _$ProjectsAdminViewModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "property_type")
  String? get propertyType;
  @override
  @JsonKey(name: "project_name")
  String? get projectName;
  @override
  @JsonKey(name: "area")
  double? get area;
  @override
  @JsonKey(name: "area_unit")
  String? get areaUnit;
  @override
  @JsonKey(name: "rera_number")
  String? get reraNumber;
  @override
  @JsonKey(name: "no_of_units")
  int? get noOfUnits;
  @override
  @JsonKey(name: "type")
  String? get type;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "specifications")
  String? get specifications;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "state")
  String? get state;
  @override
  @JsonKey(name: "location")
  String? get location;
  @override
  @JsonKey(name: "latitude")
  double? get latitude;
  @override
  @JsonKey(name: "longitude")
  double? get longitude;
  @override
  @JsonKey(name: "public_facilities")
  String? get publicFacilities;
  @override
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls;
  @override
  @JsonKey(name: "brochure_url")
  String? get brochureUrl;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "owner")
  ProjectOwner? get owner;
  @override
  @JsonKey(ignore: true)
  _$$ProjectsAdminViewModelImplCopyWith<_$ProjectsAdminViewModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ProjectOwner _$ProjectOwnerFromJson(Map<String, dynamic> json) {
  return _ProjectOwner.fromJson(json);
}

/// @nodoc
mixin _$ProjectOwner {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  String? get dateOfBirth => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "profilepic")
  String? get profilepic => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectOwnerCopyWith<ProjectOwner> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectOwnerCopyWith<$Res> {
  factory $ProjectOwnerCopyWith(
          ProjectOwner value, $Res Function(ProjectOwner) then) =
      _$ProjectOwnerCopyWithImpl<$Res, ProjectOwner>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "date_of_birth") String? dateOfBirth,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "profilepic") String? profilepic});
}

/// @nodoc
class _$ProjectOwnerCopyWithImpl<$Res, $Val extends ProjectOwner>
    implements $ProjectOwnerCopyWith<$Res> {
  _$ProjectOwnerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? username = freezed,
    Object? profilepic = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectOwnerImplCopyWith<$Res>
    implements $ProjectOwnerCopyWith<$Res> {
  factory _$$ProjectOwnerImplCopyWith(
          _$ProjectOwnerImpl value, $Res Function(_$ProjectOwnerImpl) then) =
      __$$ProjectOwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "date_of_birth") String? dateOfBirth,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "profilepic") String? profilepic});
}

/// @nodoc
class __$$ProjectOwnerImplCopyWithImpl<$Res>
    extends _$ProjectOwnerCopyWithImpl<$Res, _$ProjectOwnerImpl>
    implements _$$ProjectOwnerImplCopyWith<$Res> {
  __$$ProjectOwnerImplCopyWithImpl(
      _$ProjectOwnerImpl _value, $Res Function(_$ProjectOwnerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? dateOfBirth = freezed,
    Object? username = freezed,
    Object? profilepic = freezed,
  }) {
    return _then(_$ProjectOwnerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectOwnerImpl implements _ProjectOwner {
  const _$ProjectOwnerImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "date_of_birth") this.dateOfBirth,
      @JsonKey(name: "username") this.username,
      @JsonKey(name: "profilepic") this.profilepic});

  factory _$ProjectOwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectOwnerImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "date_of_birth")
  final String? dateOfBirth;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "profilepic")
  final String? profilepic;

  @override
  String toString() {
    return 'ProjectOwner(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth, username: $username, profilepic: $profilepic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectOwnerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilepic, profilepic) ||
                other.profilepic == profilepic));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      phoneNumber, dateOfBirth, username, profilepic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectOwnerImplCopyWith<_$ProjectOwnerImpl> get copyWith =>
      __$$ProjectOwnerImplCopyWithImpl<_$ProjectOwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectOwnerImplToJson(
      this,
    );
  }
}

abstract class _ProjectOwner implements ProjectOwner {
  const factory _ProjectOwner(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "first_name") final String? firstName,
          @JsonKey(name: "last_name") final String? lastName,
          @JsonKey(name: "email") final String? email,
          @JsonKey(name: "phone_number") final String? phoneNumber,
          @JsonKey(name: "date_of_birth") final String? dateOfBirth,
          @JsonKey(name: "username") final String? username,
          @JsonKey(name: "profilepic") final String? profilepic}) =
      _$ProjectOwnerImpl;

  factory _ProjectOwner.fromJson(Map<String, dynamic> json) =
      _$ProjectOwnerImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "date_of_birth")
  String? get dateOfBirth;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "profilepic")
  String? get profilepic;
  @override
  @JsonKey(ignore: true)
  _$$ProjectOwnerImplCopyWith<_$ProjectOwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return _Meta.fromJson(json);
}

/// @nodoc
mixin _$Meta {
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "has_next")
  bool? get hasNext => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetaCopyWith<Meta> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetaCopyWith<$Res> {
  factory $MetaCopyWith(Meta value, $Res Function(Meta) then) =
      _$MetaCopyWithImpl<$Res, Meta>;
  @useResult
  $Res call(
      {@JsonKey(name: "page") int? page,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "has_next") bool? hasNext});
}

/// @nodoc
class _$MetaCopyWithImpl<$Res, $Val extends Meta>
    implements $MetaCopyWith<$Res> {
  _$MetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? total = freezed,
    Object? hasNext = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetaImplCopyWith<$Res> implements $MetaCopyWith<$Res> {
  factory _$$MetaImplCopyWith(
          _$MetaImpl value, $Res Function(_$MetaImpl) then) =
      __$$MetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "page") int? page,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "has_next") bool? hasNext});
}

/// @nodoc
class __$$MetaImplCopyWithImpl<$Res>
    extends _$MetaCopyWithImpl<$Res, _$MetaImpl>
    implements _$$MetaImplCopyWith<$Res> {
  __$$MetaImplCopyWithImpl(_$MetaImpl _value, $Res Function(_$MetaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? total = freezed,
    Object? hasNext = freezed,
  }) {
    return _then(_$MetaImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      hasNext: freezed == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetaImpl implements _Meta {
  const _$MetaImpl(
      {@JsonKey(name: "page") this.page,
      @JsonKey(name: "page_size") this.pageSize,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "has_next") this.hasNext});

  factory _$MetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetaImplFromJson(json);

  @override
  @JsonKey(name: "page")
  final int? page;
  @override
  @JsonKey(name: "page_size")
  final int? pageSize;
  @override
  @JsonKey(name: "total")
  final int? total;
  @override
  @JsonKey(name: "has_next")
  final bool? hasNext;

  @override
  String toString() {
    return 'Meta(page: $page, pageSize: $pageSize, total: $total, hasNext: $hasNext)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetaImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, pageSize, total, hasNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      __$$MetaImplCopyWithImpl<_$MetaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetaImplToJson(
      this,
    );
  }
}

abstract class _Meta implements Meta {
  const factory _Meta(
      {@JsonKey(name: "page") final int? page,
      @JsonKey(name: "page_size") final int? pageSize,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "has_next") final bool? hasNext}) = _$MetaImpl;

  factory _Meta.fromJson(Map<String, dynamic> json) = _$MetaImpl.fromJson;

  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(name: "page_size")
  int? get pageSize;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "has_next")
  bool? get hasNext;
  @override
  @JsonKey(ignore: true)
  _$$MetaImplCopyWith<_$MetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
