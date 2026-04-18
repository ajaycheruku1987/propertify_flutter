// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateRequestModel _$CreateRequestModelFromJson(Map<String, dynamic> json) {
  return _CreateRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CreateRequestModel {
  @JsonKey(name: "title")
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "description")
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "city")
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: "state")
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: "request_type")
  String get requestType => throw _privateConstructorUsedError; // Buy or Rent
  @JsonKey(name: "category")
  String get category => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_range")
  String get budgetRange => throw _privateConstructorUsedError;
  @JsonKey(name: "latitude")
  double? get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: "longitude")
  double? get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: "contact_number")
  String? get contactNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "preferred_contact_time")
  String? get preferredContactTime => throw _privateConstructorUsedError;
  @JsonKey(name: "urgency_level")
  String? get urgencyLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "additional_requirements")
  String? get additionalRequirements => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateRequestModelCopyWith<CreateRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateRequestModelCopyWith<$Res> {
  factory $CreateRequestModelCopyWith(
          CreateRequestModel value, $Res Function(CreateRequestModel) then) =
      _$CreateRequestModelCopyWithImpl<$Res, CreateRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "state") String state,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "request_type") String requestType,
      @JsonKey(name: "category") String category,
      @JsonKey(name: "budget_range") String budgetRange,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "contact_number") String? contactNumber,
      @JsonKey(name: "preferred_contact_time") String? preferredContactTime,
      @JsonKey(name: "urgency_level") String? urgencyLevel,
      @JsonKey(name: "additional_requirements")
      String? additionalRequirements});
}

/// @nodoc
class _$CreateRequestModelCopyWithImpl<$Res, $Val extends CreateRequestModel>
    implements $CreateRequestModelCopyWith<$Res> {
  _$CreateRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? city = null,
    Object? state = null,
    Object? address = null,
    Object? requestType = null,
    Object? category = null,
    Object? budgetRange = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? contactNumber = freezed,
    Object? preferredContactTime = freezed,
    Object? urgencyLevel = freezed,
    Object? additionalRequirements = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      requestType: null == requestType
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      budgetRange: null == budgetRange
          ? _value.budgetRange
          : budgetRange // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredContactTime: freezed == preferredContactTime
          ? _value.preferredContactTime
          : preferredContactTime // ignore: cast_nullable_to_non_nullable
              as String?,
      urgencyLevel: freezed == urgencyLevel
          ? _value.urgencyLevel
          : urgencyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalRequirements: freezed == additionalRequirements
          ? _value.additionalRequirements
          : additionalRequirements // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateRequestModelImplCopyWith<$Res>
    implements $CreateRequestModelCopyWith<$Res> {
  factory _$$CreateRequestModelImplCopyWith(_$CreateRequestModelImpl value,
          $Res Function(_$CreateRequestModelImpl) then) =
      __$$CreateRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "title") String title,
      @JsonKey(name: "description") String? description,
      @JsonKey(name: "city") String city,
      @JsonKey(name: "state") String state,
      @JsonKey(name: "address") String address,
      @JsonKey(name: "request_type") String requestType,
      @JsonKey(name: "category") String category,
      @JsonKey(name: "budget_range") String budgetRange,
      @JsonKey(name: "latitude") double? latitude,
      @JsonKey(name: "longitude") double? longitude,
      @JsonKey(name: "contact_number") String? contactNumber,
      @JsonKey(name: "preferred_contact_time") String? preferredContactTime,
      @JsonKey(name: "urgency_level") String? urgencyLevel,
      @JsonKey(name: "additional_requirements")
      String? additionalRequirements});
}

/// @nodoc
class __$$CreateRequestModelImplCopyWithImpl<$Res>
    extends _$CreateRequestModelCopyWithImpl<$Res, _$CreateRequestModelImpl>
    implements _$$CreateRequestModelImplCopyWith<$Res> {
  __$$CreateRequestModelImplCopyWithImpl(_$CreateRequestModelImpl _value,
      $Res Function(_$CreateRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? city = null,
    Object? state = null,
    Object? address = null,
    Object? requestType = null,
    Object? category = null,
    Object? budgetRange = null,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? contactNumber = freezed,
    Object? preferredContactTime = freezed,
    Object? urgencyLevel = freezed,
    Object? additionalRequirements = freezed,
  }) {
    return _then(_$CreateRequestModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      requestType: null == requestType
          ? _value.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      budgetRange: null == budgetRange
          ? _value.budgetRange
          : budgetRange // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      contactNumber: freezed == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredContactTime: freezed == preferredContactTime
          ? _value.preferredContactTime
          : preferredContactTime // ignore: cast_nullable_to_non_nullable
              as String?,
      urgencyLevel: freezed == urgencyLevel
          ? _value.urgencyLevel
          : urgencyLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      additionalRequirements: freezed == additionalRequirements
          ? _value.additionalRequirements
          : additionalRequirements // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateRequestModelImpl implements _CreateRequestModel {
  const _$CreateRequestModelImpl(
      {@JsonKey(name: "title") required this.title,
      @JsonKey(name: "description") this.description,
      @JsonKey(name: "city") required this.city,
      @JsonKey(name: "state") required this.state,
      @JsonKey(name: "address") required this.address,
      @JsonKey(name: "request_type") required this.requestType,
      @JsonKey(name: "category") required this.category,
      @JsonKey(name: "budget_range") required this.budgetRange,
      @JsonKey(name: "latitude") this.latitude,
      @JsonKey(name: "longitude") this.longitude,
      @JsonKey(name: "contact_number") this.contactNumber,
      @JsonKey(name: "preferred_contact_time") this.preferredContactTime,
      @JsonKey(name: "urgency_level") this.urgencyLevel,
      @JsonKey(name: "additional_requirements") this.additionalRequirements});

  factory _$CreateRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "title")
  final String title;
  @override
  @JsonKey(name: "description")
  final String? description;
  @override
  @JsonKey(name: "city")
  final String city;
  @override
  @JsonKey(name: "state")
  final String state;
  @override
  @JsonKey(name: "address")
  final String address;
  @override
  @JsonKey(name: "request_type")
  final String requestType;
// Buy or Rent
  @override
  @JsonKey(name: "category")
  final String category;
  @override
  @JsonKey(name: "budget_range")
  final String budgetRange;
  @override
  @JsonKey(name: "latitude")
  final double? latitude;
  @override
  @JsonKey(name: "longitude")
  final double? longitude;
  @override
  @JsonKey(name: "contact_number")
  final String? contactNumber;
  @override
  @JsonKey(name: "preferred_contact_time")
  final String? preferredContactTime;
  @override
  @JsonKey(name: "urgency_level")
  final String? urgencyLevel;
  @override
  @JsonKey(name: "additional_requirements")
  final String? additionalRequirements;

  @override
  String toString() {
    return 'CreateRequestModel(title: $title, description: $description, city: $city, state: $state, address: $address, requestType: $requestType, category: $category, budgetRange: $budgetRange, latitude: $latitude, longitude: $longitude, contactNumber: $contactNumber, preferredContactTime: $preferredContactTime, urgencyLevel: $urgencyLevel, additionalRequirements: $additionalRequirements)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRequestModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.budgetRange, budgetRange) ||
                other.budgetRange == budgetRange) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.preferredContactTime, preferredContactTime) ||
                other.preferredContactTime == preferredContactTime) &&
            (identical(other.urgencyLevel, urgencyLevel) ||
                other.urgencyLevel == urgencyLevel) &&
            (identical(other.additionalRequirements, additionalRequirements) ||
                other.additionalRequirements == additionalRequirements));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      description,
      city,
      state,
      address,
      requestType,
      category,
      budgetRange,
      latitude,
      longitude,
      contactNumber,
      preferredContactTime,
      urgencyLevel,
      additionalRequirements);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRequestModelImplCopyWith<_$CreateRequestModelImpl> get copyWith =>
      __$$CreateRequestModelImplCopyWithImpl<_$CreateRequestModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CreateRequestModel implements CreateRequestModel {
  const factory _CreateRequestModel(
      {@JsonKey(name: "title") required final String title,
      @JsonKey(name: "description") final String? description,
      @JsonKey(name: "city") required final String city,
      @JsonKey(name: "state") required final String state,
      @JsonKey(name: "address") required final String address,
      @JsonKey(name: "request_type") required final String requestType,
      @JsonKey(name: "category") required final String category,
      @JsonKey(name: "budget_range") required final String budgetRange,
      @JsonKey(name: "latitude") final double? latitude,
      @JsonKey(name: "longitude") final double? longitude,
      @JsonKey(name: "contact_number") final String? contactNumber,
      @JsonKey(name: "preferred_contact_time")
      final String? preferredContactTime,
      @JsonKey(name: "urgency_level") final String? urgencyLevel,
      @JsonKey(name: "additional_requirements")
      final String? additionalRequirements}) = _$CreateRequestModelImpl;

  factory _CreateRequestModel.fromJson(Map<String, dynamic> json) =
      _$CreateRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "title")
  String get title;
  @override
  @JsonKey(name: "description")
  String? get description;
  @override
  @JsonKey(name: "city")
  String get city;
  @override
  @JsonKey(name: "state")
  String get state;
  @override
  @JsonKey(name: "address")
  String get address;
  @override
  @JsonKey(name: "request_type")
  String get requestType;
  @override // Buy or Rent
  @JsonKey(name: "category")
  String get category;
  @override
  @JsonKey(name: "budget_range")
  String get budgetRange;
  @override
  @JsonKey(name: "latitude")
  double? get latitude;
  @override
  @JsonKey(name: "longitude")
  double? get longitude;
  @override
  @JsonKey(name: "contact_number")
  String? get contactNumber;
  @override
  @JsonKey(name: "preferred_contact_time")
  String? get preferredContactTime;
  @override
  @JsonKey(name: "urgency_level")
  String? get urgencyLevel;
  @override
  @JsonKey(name: "additional_requirements")
  String? get additionalRequirements;
  @override
  @JsonKey(ignore: true)
  _$$CreateRequestModelImplCopyWith<_$CreateRequestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
