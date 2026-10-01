// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_post_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AddPostResponse _$AddPostResponseFromJson(Map<String, dynamic> json) {
  return _AddPostResponse.fromJson(json);
}

/// @nodoc
mixin _$AddPostResponse {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "property_type")
  String? get propertyType => throw _privateConstructorUsedError;
  @JsonKey(name: "listing_type")
  String? get listingType => throw _privateConstructorUsedError;
  @JsonKey(name: "price")
  int? get price => throw _privateConstructorUsedError;
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  @JsonKey(name: "is_featured")
  bool? get isFeatured => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  int? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "is_promoted")
  bool? get isPromoted => throw _privateConstructorUsedError;
  @JsonKey(name: "promoted_until")
  dynamic get promotedUntil => throw _privateConstructorUsedError;
  @JsonKey(name: "owner")
  Owner? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: "plot_area", fromJson: _toString)
  String? get plotArea => throw _privateConstructorUsedError;
  @JsonKey(name: "area_unit", fromJson: _toString)
  String? get areaUnit => throw _privateConstructorUsedError;
  @JsonKey(name: "facing", fromJson: _toString)
  String? get facing => throw _privateConstructorUsedError;
  @JsonKey(name: "road_width", fromJson: _toString)
  String? get roadWidth => throw _privateConstructorUsedError;
  @JsonKey(name: "posted_by", fromJson: _toString)
  String? get postedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "approval_status", fromJson: _toString)
  String? get approvalStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "dimensions", fromJson: _toString)
  String? get dimensions => throw _privateConstructorUsedError;
  @JsonKey(name: "is_corner_plot")
  bool? get isCornerPlot => throw _privateConstructorUsedError;
  @JsonKey(name: "is_gated_community")
  bool? get isGatedCommunity => throw _privateConstructorUsedError;
  @JsonKey(name: "main_category", fromJson: _toString)
  String? get mainCategory => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_category", fromJson: _toString)
  String? get subCategory => throw _privateConstructorUsedError;
  @JsonKey(name: "is_negotiable")
  bool? get isNegotiable => throw _privateConstructorUsedError;
  @JsonKey(name: "security_deposit", fromJson: _toString)
  String? get securityDeposit => throw _privateConstructorUsedError;
  @JsonKey(name: "property_status", fromJson: _toString)
  String? get propertyStatus => throw _privateConstructorUsedError;
  @JsonKey(name: "contact_via_phone")
  bool? get contactViaPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "contact_via_whatsapp")
  bool? get contactViaWhatsApp => throw _privateConstructorUsedError;
  @JsonKey(name: "carpet_area", fromJson: _toString)
  String? get carpetArea => throw _privateConstructorUsedError;
  @JsonKey(name: "carpet_area_unit", fromJson: _toString)
  String? get carpetAreaUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddPostResponseCopyWith<AddPostResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPostResponseCopyWith<$Res> {
  factory $AddPostResponseCopyWith(
          AddPostResponse value, $Res Function(AddPostResponse) then) =
      _$AddPostResponseCopyWithImpl<$Res, AddPostResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "property_type") String? propertyType,
      @JsonKey(name: "listing_type") String? listingType,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "image_urls") List<String>? imageUrls,
      @JsonKey(name: "is_featured") bool? isFeatured,
      @JsonKey(name: "rating") int? rating,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "is_promoted") bool? isPromoted,
      @JsonKey(name: "promoted_until") dynamic promotedUntil,
      @JsonKey(name: "owner") Owner? owner,
      @JsonKey(name: "plot_area", fromJson: _toString) String? plotArea,
      @JsonKey(name: "area_unit", fromJson: _toString) String? areaUnit,
      @JsonKey(name: "facing", fromJson: _toString) String? facing,
      @JsonKey(name: "road_width", fromJson: _toString) String? roadWidth,
      @JsonKey(name: "posted_by", fromJson: _toString) String? postedBy,
      @JsonKey(name: "approval_status", fromJson: _toString)
      String? approvalStatus,
      @JsonKey(name: "dimensions", fromJson: _toString) String? dimensions,
      @JsonKey(name: "is_corner_plot") bool? isCornerPlot,
      @JsonKey(name: "is_gated_community") bool? isGatedCommunity,
      @JsonKey(name: "main_category", fromJson: _toString) String? mainCategory,
      @JsonKey(name: "sub_category", fromJson: _toString) String? subCategory,
      @JsonKey(name: "is_negotiable") bool? isNegotiable,
      @JsonKey(name: "security_deposit", fromJson: _toString)
      String? securityDeposit,
      @JsonKey(name: "property_status", fromJson: _toString)
      String? propertyStatus,
      @JsonKey(name: "contact_via_phone") bool? contactViaPhone,
      @JsonKey(name: "contact_via_whatsapp") bool? contactViaWhatsApp,
      @JsonKey(name: "carpet_area", fromJson: _toString) String? carpetArea,
      @JsonKey(name: "carpet_area_unit", fromJson: _toString)
      String? carpetAreaUnit});

  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$AddPostResponseCopyWithImpl<$Res, $Val extends AddPostResponse>
    implements $AddPostResponseCopyWith<$Res> {
  _$AddPostResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? propertyType = freezed,
    Object? listingType = freezed,
    Object? price = freezed,
    Object? imageUrls = freezed,
    Object? isFeatured = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isPromoted = freezed,
    Object? promotedUntil = freezed,
    Object? owner = freezed,
    Object? plotArea = freezed,
    Object? areaUnit = freezed,
    Object? facing = freezed,
    Object? roadWidth = freezed,
    Object? postedBy = freezed,
    Object? approvalStatus = freezed,
    Object? dimensions = freezed,
    Object? isCornerPlot = freezed,
    Object? isGatedCommunity = freezed,
    Object? mainCategory = freezed,
    Object? subCategory = freezed,
    Object? isNegotiable = freezed,
    Object? securityDeposit = freezed,
    Object? propertyStatus = freezed,
    Object? contactViaPhone = freezed,
    Object? contactViaWhatsApp = freezed,
    Object? carpetArea = freezed,
    Object? carpetAreaUnit = freezed,
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
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      listingType: freezed == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isPromoted: freezed == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      promotedUntil: freezed == promotedUntil
          ? _value.promotedUntil
          : promotedUntil // ignore: cast_nullable_to_non_nullable
              as dynamic,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      plotArea: freezed == plotArea
          ? _value.plotArea
          : plotArea // ignore: cast_nullable_to_non_nullable
              as String?,
      areaUnit: freezed == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      facing: freezed == facing
          ? _value.facing
          : facing // ignore: cast_nullable_to_non_nullable
              as String?,
      roadWidth: freezed == roadWidth
          ? _value.roadWidth
          : roadWidth // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalStatus: freezed == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      isCornerPlot: freezed == isCornerPlot
          ? _value.isCornerPlot
          : isCornerPlot // ignore: cast_nullable_to_non_nullable
              as bool?,
      isGatedCommunity: freezed == isGatedCommunity
          ? _value.isGatedCommunity
          : isGatedCommunity // ignore: cast_nullable_to_non_nullable
              as bool?,
      mainCategory: freezed == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      isNegotiable: freezed == isNegotiable
          ? _value.isNegotiable
          : isNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityDeposit: freezed == securityDeposit
          ? _value.securityDeposit
          : securityDeposit // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyStatus: freezed == propertyStatus
          ? _value.propertyStatus
          : propertyStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      contactViaPhone: freezed == contactViaPhone
          ? _value.contactViaPhone
          : contactViaPhone // ignore: cast_nullable_to_non_nullable
              as bool?,
      contactViaWhatsApp: freezed == contactViaWhatsApp
          ? _value.contactViaWhatsApp
          : contactViaWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool?,
      carpetArea: freezed == carpetArea
          ? _value.carpetArea
          : carpetArea // ignore: cast_nullable_to_non_nullable
              as String?,
      carpetAreaUnit: freezed == carpetAreaUnit
          ? _value.carpetAreaUnit
          : carpetAreaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get owner {
    if (_value.owner == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_value.owner!, (value) {
      return _then(_value.copyWith(owner: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddPostResponseImplCopyWith<$Res>
    implements $AddPostResponseCopyWith<$Res> {
  factory _$$AddPostResponseImplCopyWith(_$AddPostResponseImpl value,
          $Res Function(_$AddPostResponseImpl) then) =
      __$$AddPostResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "user_id") String? userId,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "city") String? city,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "property_type") String? propertyType,
      @JsonKey(name: "listing_type") String? listingType,
      @JsonKey(name: "price") int? price,
      @JsonKey(name: "image_urls") List<String>? imageUrls,
      @JsonKey(name: "is_featured") bool? isFeatured,
      @JsonKey(name: "rating") int? rating,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "is_promoted") bool? isPromoted,
      @JsonKey(name: "promoted_until") dynamic promotedUntil,
      @JsonKey(name: "owner") Owner? owner,
      @JsonKey(name: "plot_area", fromJson: _toString) String? plotArea,
      @JsonKey(name: "area_unit", fromJson: _toString) String? areaUnit,
      @JsonKey(name: "facing", fromJson: _toString) String? facing,
      @JsonKey(name: "road_width", fromJson: _toString) String? roadWidth,
      @JsonKey(name: "posted_by", fromJson: _toString) String? postedBy,
      @JsonKey(name: "approval_status", fromJson: _toString)
      String? approvalStatus,
      @JsonKey(name: "dimensions", fromJson: _toString) String? dimensions,
      @JsonKey(name: "is_corner_plot") bool? isCornerPlot,
      @JsonKey(name: "is_gated_community") bool? isGatedCommunity,
      @JsonKey(name: "main_category", fromJson: _toString) String? mainCategory,
      @JsonKey(name: "sub_category", fromJson: _toString) String? subCategory,
      @JsonKey(name: "is_negotiable") bool? isNegotiable,
      @JsonKey(name: "security_deposit", fromJson: _toString)
      String? securityDeposit,
      @JsonKey(name: "property_status", fromJson: _toString)
      String? propertyStatus,
      @JsonKey(name: "contact_via_phone") bool? contactViaPhone,
      @JsonKey(name: "contact_via_whatsapp") bool? contactViaWhatsApp,
      @JsonKey(name: "carpet_area", fromJson: _toString) String? carpetArea,
      @JsonKey(name: "carpet_area_unit", fromJson: _toString)
      String? carpetAreaUnit});

  @override
  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$$AddPostResponseImplCopyWithImpl<$Res>
    extends _$AddPostResponseCopyWithImpl<$Res, _$AddPostResponseImpl>
    implements _$$AddPostResponseImplCopyWith<$Res> {
  __$$AddPostResponseImplCopyWithImpl(
      _$AddPostResponseImpl _value, $Res Function(_$AddPostResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? city = freezed,
    Object? address = freezed,
    Object? propertyType = freezed,
    Object? listingType = freezed,
    Object? price = freezed,
    Object? imageUrls = freezed,
    Object? isFeatured = freezed,
    Object? rating = freezed,
    Object? createdAt = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isPromoted = freezed,
    Object? promotedUntil = freezed,
    Object? owner = freezed,
    Object? plotArea = freezed,
    Object? areaUnit = freezed,
    Object? facing = freezed,
    Object? roadWidth = freezed,
    Object? postedBy = freezed,
    Object? approvalStatus = freezed,
    Object? dimensions = freezed,
    Object? isCornerPlot = freezed,
    Object? isGatedCommunity = freezed,
    Object? mainCategory = freezed,
    Object? subCategory = freezed,
    Object? isNegotiable = freezed,
    Object? securityDeposit = freezed,
    Object? propertyStatus = freezed,
    Object? contactViaPhone = freezed,
    Object? contactViaWhatsApp = freezed,
    Object? carpetArea = freezed,
    Object? carpetAreaUnit = freezed,
  }) {
    return _then(_$AddPostResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      listingType: freezed == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int?,
      imageUrls: freezed == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isFeatured: freezed == isFeatured
          ? _value.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isPromoted: freezed == isPromoted
          ? _value.isPromoted
          : isPromoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      promotedUntil: freezed == promotedUntil
          ? _value.promotedUntil
          : promotedUntil // ignore: cast_nullable_to_non_nullable
              as dynamic,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
      plotArea: freezed == plotArea
          ? _value.plotArea
          : plotArea // ignore: cast_nullable_to_non_nullable
              as String?,
      areaUnit: freezed == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
      facing: freezed == facing
          ? _value.facing
          : facing // ignore: cast_nullable_to_non_nullable
              as String?,
      roadWidth: freezed == roadWidth
          ? _value.roadWidth
          : roadWidth // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      approvalStatus: freezed == approvalStatus
          ? _value.approvalStatus
          : approvalStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      dimensions: freezed == dimensions
          ? _value.dimensions
          : dimensions // ignore: cast_nullable_to_non_nullable
              as String?,
      isCornerPlot: freezed == isCornerPlot
          ? _value.isCornerPlot
          : isCornerPlot // ignore: cast_nullable_to_non_nullable
              as bool?,
      isGatedCommunity: freezed == isGatedCommunity
          ? _value.isGatedCommunity
          : isGatedCommunity // ignore: cast_nullable_to_non_nullable
              as bool?,
      mainCategory: freezed == mainCategory
          ? _value.mainCategory
          : mainCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      isNegotiable: freezed == isNegotiable
          ? _value.isNegotiable
          : isNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      securityDeposit: freezed == securityDeposit
          ? _value.securityDeposit
          : securityDeposit // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyStatus: freezed == propertyStatus
          ? _value.propertyStatus
          : propertyStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      contactViaPhone: freezed == contactViaPhone
          ? _value.contactViaPhone
          : contactViaPhone // ignore: cast_nullable_to_non_nullable
              as bool?,
      contactViaWhatsApp: freezed == contactViaWhatsApp
          ? _value.contactViaWhatsApp
          : contactViaWhatsApp // ignore: cast_nullable_to_non_nullable
              as bool?,
      carpetArea: freezed == carpetArea
          ? _value.carpetArea
          : carpetArea // ignore: cast_nullable_to_non_nullable
              as String?,
      carpetAreaUnit: freezed == carpetAreaUnit
          ? _value.carpetAreaUnit
          : carpetAreaUnit // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddPostResponseImpl implements _AddPostResponse {
  const _$AddPostResponseImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "user_id") this.userId,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "city") this.city,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "property_type") this.propertyType,
      @JsonKey(name: "listing_type") this.listingType,
      @JsonKey(name: "price") this.price,
      @JsonKey(name: "image_urls") final List<String>? imageUrls,
      @JsonKey(name: "is_featured") this.isFeatured,
      @JsonKey(name: "rating") this.rating,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "longitude") this.longitude,
      @JsonKey(name: "is_promoted") this.isPromoted,
      @JsonKey(name: "promoted_until") this.promotedUntil,
      @JsonKey(name: "owner") this.owner,
      @JsonKey(name: "plot_area", fromJson: _toString) this.plotArea,
      @JsonKey(name: "area_unit", fromJson: _toString) this.areaUnit,
      @JsonKey(name: "facing", fromJson: _toString) this.facing,
      @JsonKey(name: "road_width", fromJson: _toString) this.roadWidth,
      @JsonKey(name: "posted_by", fromJson: _toString) this.postedBy,
      @JsonKey(name: "approval_status", fromJson: _toString)
      this.approvalStatus,
      @JsonKey(name: "dimensions", fromJson: _toString) this.dimensions,
      @JsonKey(name: "is_corner_plot") this.isCornerPlot,
      @JsonKey(name: "is_gated_community") this.isGatedCommunity,
      @JsonKey(name: "main_category", fromJson: _toString) this.mainCategory,
      @JsonKey(name: "sub_category", fromJson: _toString) this.subCategory,
      @JsonKey(name: "is_negotiable") this.isNegotiable,
      @JsonKey(name: "security_deposit", fromJson: _toString)
      this.securityDeposit,
      @JsonKey(name: "property_status", fromJson: _toString)
      this.propertyStatus,
      @JsonKey(name: "contact_via_phone") this.contactViaPhone,
      @JsonKey(name: "contact_via_whatsapp") this.contactViaWhatsApp,
      @JsonKey(name: "carpet_area", fromJson: _toString) this.carpetArea,
      @JsonKey(name: "carpet_area_unit", fromJson: _toString)
      this.carpetAreaUnit})
      : _imageUrls = imageUrls;

  factory _$AddPostResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddPostResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "user_id")
  final String? userId;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "city")
  final String? city;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "property_type")
  final String? propertyType;
  @override
  @JsonKey(name: "listing_type")
  final String? listingType;
  @override
  @JsonKey(name: "price")
  final int? price;
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
  @JsonKey(name: "is_featured")
  final bool? isFeatured;
  @override
  @JsonKey(name: "rating")
  final int? rating;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "latitude")
  final double? latitude;
  @override
  @JsonKey(name: "longitude")
  final double? longitude;
  @override
  @JsonKey(name: "is_promoted")
  final bool? isPromoted;
  @override
  @JsonKey(name: "promoted_until")
  final dynamic promotedUntil;
  @override
  @JsonKey(name: "owner")
  final Owner? owner;
  @override
  @JsonKey(name: "plot_area", fromJson: _toString)
  final String? plotArea;
  @override
  @JsonKey(name: "area_unit", fromJson: _toString)
  final String? areaUnit;
  @override
  @JsonKey(name: "facing", fromJson: _toString)
  final String? facing;
  @override
  @JsonKey(name: "road_width", fromJson: _toString)
  final String? roadWidth;
  @override
  @JsonKey(name: "posted_by", fromJson: _toString)
  final String? postedBy;
  @override
  @JsonKey(name: "approval_status", fromJson: _toString)
  final String? approvalStatus;
  @override
  @JsonKey(name: "dimensions", fromJson: _toString)
  final String? dimensions;
  @override
  @JsonKey(name: "is_corner_plot")
  final bool? isCornerPlot;
  @override
  @JsonKey(name: "is_gated_community")
  final bool? isGatedCommunity;
  @override
  @JsonKey(name: "main_category", fromJson: _toString)
  final String? mainCategory;
  @override
  @JsonKey(name: "sub_category", fromJson: _toString)
  final String? subCategory;
  @override
  @JsonKey(name: "is_negotiable")
  final bool? isNegotiable;
  @override
  @JsonKey(name: "security_deposit", fromJson: _toString)
  final String? securityDeposit;
  @override
  @JsonKey(name: "property_status", fromJson: _toString)
  final String? propertyStatus;
  @override
  @JsonKey(name: "contact_via_phone")
  final bool? contactViaPhone;
  @override
  @JsonKey(name: "contact_via_whatsapp")
  final bool? contactViaWhatsApp;
  @override
  @JsonKey(name: "carpet_area", fromJson: _toString)
  final String? carpetArea;
  @override
  @JsonKey(name: "carpet_area_unit", fromJson: _toString)
  final String? carpetAreaUnit;

  @override
  String toString() {
    return 'AddPostResponse(id: $id, userId: $userId, title: $title, description: $description, city: $city, address: $address, propertyType: $propertyType, listingType: $listingType, price: $price, imageUrls: $imageUrls, isFeatured: $isFeatured, rating: $rating, createdAt: $createdAt, latitude: $latitude, longitude: $longitude, isPromoted: $isPromoted, promotedUntil: $promotedUntil, owner: $owner, plotArea: $plotArea, areaUnit: $areaUnit, facing: $facing, roadWidth: $roadWidth, postedBy: $postedBy, approvalStatus: $approvalStatus, dimensions: $dimensions, isCornerPlot: $isCornerPlot, isGatedCommunity: $isGatedCommunity, mainCategory: $mainCategory, subCategory: $subCategory, isNegotiable: $isNegotiable, securityDeposit: $securityDeposit, propertyStatus: $propertyStatus, contactViaPhone: $contactViaPhone, contactViaWhatsApp: $contactViaWhatsApp, carpetArea: $carpetArea, carpetAreaUnit: $carpetAreaUnit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPostResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isPromoted, isPromoted) ||
                other.isPromoted == isPromoted) &&
            const DeepCollectionEquality()
                .equals(other.promotedUntil, promotedUntil) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.plotArea, plotArea) ||
                other.plotArea == plotArea) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.facing, facing) || other.facing == facing) &&
            (identical(other.roadWidth, roadWidth) ||
                other.roadWidth == roadWidth) &&
            (identical(other.postedBy, postedBy) ||
                other.postedBy == postedBy) &&
            (identical(other.approvalStatus, approvalStatus) ||
                other.approvalStatus == approvalStatus) &&
            (identical(other.dimensions, dimensions) ||
                other.dimensions == dimensions) &&
            (identical(other.isCornerPlot, isCornerPlot) ||
                other.isCornerPlot == isCornerPlot) &&
            (identical(other.isGatedCommunity, isGatedCommunity) ||
                other.isGatedCommunity == isGatedCommunity) &&
            (identical(other.mainCategory, mainCategory) ||
                other.mainCategory == mainCategory) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.isNegotiable, isNegotiable) ||
                other.isNegotiable == isNegotiable) &&
            (identical(other.securityDeposit, securityDeposit) ||
                other.securityDeposit == securityDeposit) &&
            (identical(other.propertyStatus, propertyStatus) ||
                other.propertyStatus == propertyStatus) &&
            (identical(other.contactViaPhone, contactViaPhone) ||
                other.contactViaPhone == contactViaPhone) &&
            (identical(other.contactViaWhatsApp, contactViaWhatsApp) ||
                other.contactViaWhatsApp == contactViaWhatsApp) &&
            (identical(other.carpetArea, carpetArea) ||
                other.carpetArea == carpetArea) &&
            (identical(other.carpetAreaUnit, carpetAreaUnit) ||
                other.carpetAreaUnit == carpetAreaUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        title,
        description,
        city,
        address,
        propertyType,
        listingType,
        price,
        const DeepCollectionEquality().hash(_imageUrls),
        isFeatured,
        rating,
        createdAt,
        latitude,
        longitude,
        isPromoted,
        const DeepCollectionEquality().hash(promotedUntil),
        owner,
        plotArea,
        areaUnit,
        facing,
        roadWidth,
        postedBy,
        approvalStatus,
        dimensions,
        isCornerPlot,
        isGatedCommunity,
        mainCategory,
        subCategory,
        isNegotiable,
        securityDeposit,
        propertyStatus,
        contactViaPhone,
        contactViaWhatsApp,
        carpetArea,
        carpetAreaUnit
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPostResponseImplCopyWith<_$AddPostResponseImpl> get copyWith =>
      __$$AddPostResponseImplCopyWithImpl<_$AddPostResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddPostResponseImplToJson(
      this,
    );
  }
}

abstract class _AddPostResponse implements AddPostResponse {
  const factory _AddPostResponse(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "user_id") final String? userId,
      @JsonKey(name: "title") final String? title,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "city") final String? city,
      @JsonKey(name: "address") final String? address,
      @JsonKey(name: "property_type") final String? propertyType,
      @JsonKey(name: "listing_type") final String? listingType,
      @JsonKey(name: "price") final int? price,
      @JsonKey(name: "image_urls") final List<String>? imageUrls,
      @JsonKey(name: "is_featured") final bool? isFeatured,
      @JsonKey(name: "rating") final int? rating,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "latitude") final double? latitude,
      @JsonKey(name: "longitude") final double? longitude,
      @JsonKey(name: "is_promoted") final bool? isPromoted,
      @JsonKey(name: "promoted_until") final dynamic promotedUntil,
      @JsonKey(name: "owner") final Owner? owner,
      @JsonKey(name: "plot_area", fromJson: _toString) final String? plotArea,
      @JsonKey(name: "area_unit", fromJson: _toString) final String? areaUnit,
      @JsonKey(name: "facing", fromJson: _toString) final String? facing,
      @JsonKey(name: "road_width", fromJson: _toString) final String? roadWidth,
      @JsonKey(name: "posted_by", fromJson: _toString) final String? postedBy,
      @JsonKey(name: "approval_status", fromJson: _toString)
      final String? approvalStatus,
      @JsonKey(name: "dimensions", fromJson: _toString)
      final String? dimensions,
      @JsonKey(name: "is_corner_plot") final bool? isCornerPlot,
      @JsonKey(name: "is_gated_community") final bool? isGatedCommunity,
      @JsonKey(name: "main_category", fromJson: _toString)
      final String? mainCategory,
      @JsonKey(name: "sub_category", fromJson: _toString)
      final String? subCategory,
      @JsonKey(name: "is_negotiable") final bool? isNegotiable,
      @JsonKey(name: "security_deposit", fromJson: _toString)
      final String? securityDeposit,
      @JsonKey(name: "property_status", fromJson: _toString)
      final String? propertyStatus,
      @JsonKey(name: "contact_via_phone") final bool? contactViaPhone,
      @JsonKey(name: "contact_via_whatsapp") final bool? contactViaWhatsApp,
      @JsonKey(name: "carpet_area", fromJson: _toString)
      final String? carpetArea,
      @JsonKey(name: "carpet_area_unit", fromJson: _toString)
      final String? carpetAreaUnit}) = _$AddPostResponseImpl;

  factory _AddPostResponse.fromJson(Map<String, dynamic> json) =
      _$AddPostResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "city")
  String? get city;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "property_type")
  String? get propertyType;
  @override
  @JsonKey(name: "listing_type")
  String? get listingType;
  @override
  @JsonKey(name: "price")
  int? get price;
  @override
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls;
  @override
  @JsonKey(name: "is_featured")
  bool? get isFeatured;
  @override
  @JsonKey(name: "rating")
  int? get rating;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "latitude")
  double? get latitude;
  @override
  @JsonKey(name: "longitude")
  double? get longitude;
  @override
  @JsonKey(name: "is_promoted")
  bool? get isPromoted;
  @override
  @JsonKey(name: "promoted_until")
  dynamic get promotedUntil;
  @override
  @JsonKey(name: "owner")
  Owner? get owner;
  @override
  @JsonKey(name: "plot_area", fromJson: _toString)
  String? get plotArea;
  @override
  @JsonKey(name: "area_unit", fromJson: _toString)
  String? get areaUnit;
  @override
  @JsonKey(name: "facing", fromJson: _toString)
  String? get facing;
  @override
  @JsonKey(name: "road_width", fromJson: _toString)
  String? get roadWidth;
  @override
  @JsonKey(name: "posted_by", fromJson: _toString)
  String? get postedBy;
  @override
  @JsonKey(name: "approval_status", fromJson: _toString)
  String? get approvalStatus;
  @override
  @JsonKey(name: "dimensions", fromJson: _toString)
  String? get dimensions;
  @override
  @JsonKey(name: "is_corner_plot")
  bool? get isCornerPlot;
  @override
  @JsonKey(name: "is_gated_community")
  bool? get isGatedCommunity;
  @override
  @JsonKey(name: "main_category", fromJson: _toString)
  String? get mainCategory;
  @override
  @JsonKey(name: "sub_category", fromJson: _toString)
  String? get subCategory;
  @override
  @JsonKey(name: "is_negotiable")
  bool? get isNegotiable;
  @override
  @JsonKey(name: "security_deposit", fromJson: _toString)
  String? get securityDeposit;
  @override
  @JsonKey(name: "property_status", fromJson: _toString)
  String? get propertyStatus;
  @override
  @JsonKey(name: "contact_via_phone")
  bool? get contactViaPhone;
  @override
  @JsonKey(name: "contact_via_whatsapp")
  bool? get contactViaWhatsApp;
  @override
  @JsonKey(name: "carpet_area", fromJson: _toString)
  String? get carpetArea;
  @override
  @JsonKey(name: "carpet_area_unit", fromJson: _toString)
  String? get carpetAreaUnit;
  @override
  @JsonKey(ignore: true)
  _$$AddPostResponseImplCopyWith<_$AddPostResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Owner _$OwnerFromJson(Map<String, dynamic> json) {
  return _Owner.fromJson(json);
}

/// @nodoc
mixin _$Owner {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  dynamic get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  dynamic get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  dynamic get dateOfBirth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OwnerCopyWith<Owner> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) then) =
      _$OwnerCopyWithImpl<$Res, Owner>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "first_name") dynamic firstName,
      @JsonKey(name: "last_name") dynamic lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "date_of_birth") dynamic dateOfBirth});
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res, $Val extends Owner>
    implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OwnerImplCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$$OwnerImplCopyWith(
          _$OwnerImpl value, $Res Function(_$OwnerImpl) then) =
      __$$OwnerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "first_name") dynamic firstName,
      @JsonKey(name: "last_name") dynamic lastName,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "date_of_birth") dynamic dateOfBirth});
}

/// @nodoc
class __$$OwnerImplCopyWithImpl<$Res>
    extends _$OwnerCopyWithImpl<$Res, _$OwnerImpl>
    implements _$$OwnerImplCopyWith<$Res> {
  __$$OwnerImplCopyWithImpl(
      _$OwnerImpl _value, $Res Function(_$OwnerImpl) _then)
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
  }) {
    return _then(_$OwnerImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OwnerImpl implements _Owner {
  const _$OwnerImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "date_of_birth") this.dateOfBirth});

  factory _$OwnerImpl.fromJson(Map<String, dynamic> json) =>
      _$$OwnerImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "first_name")
  final dynamic firstName;
  @override
  @JsonKey(name: "last_name")
  final dynamic lastName;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "date_of_birth")
  final dynamic dateOfBirth;

  @override
  String toString() {
    return 'Owner(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phoneNumber: $phoneNumber, dateOfBirth: $dateOfBirth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OwnerImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      email,
      phoneNumber,
      const DeepCollectionEquality().hash(dateOfBirth));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      __$$OwnerImplCopyWithImpl<_$OwnerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OwnerImplToJson(
      this,
    );
  }
}

abstract class _Owner implements Owner {
  const factory _Owner(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "first_name") final dynamic firstName,
      @JsonKey(name: "last_name") final dynamic lastName,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      @JsonKey(name: "date_of_birth") final dynamic dateOfBirth}) = _$OwnerImpl;

  factory _Owner.fromJson(Map<String, dynamic> json) = _$OwnerImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "first_name")
  dynamic get firstName;
  @override
  @JsonKey(name: "last_name")
  dynamic get lastName;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "date_of_birth")
  dynamic get dateOfBirth;
  @override
  @JsonKey(ignore: true)
  _$$OwnerImplCopyWith<_$OwnerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
