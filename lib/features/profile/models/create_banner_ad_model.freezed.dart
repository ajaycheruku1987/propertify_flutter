// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_banner_ad_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateBannerAdResponseModel _$CreateBannerAdResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CreateBannerAdResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CreateBannerAdResponseModel {
  double get amount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  int get planDays => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateBannerAdResponseModelCopyWith<CreateBannerAdResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateBannerAdResponseModelCopyWith<$Res> {
  factory $CreateBannerAdResponseModelCopyWith(
          CreateBannerAdResponseModel value,
          $Res Function(CreateBannerAdResponseModel) then) =
      _$CreateBannerAdResponseModelCopyWithImpl<$Res,
          CreateBannerAdResponseModel>;
  @useResult
  $Res call(
      {double amount,
      DateTime createdAt,
      String description,
      String id,
      List<String> imageUrls,
      int planDays,
      String planName,
      String status});
}

/// @nodoc
class _$CreateBannerAdResponseModelCopyWithImpl<$Res,
        $Val extends CreateBannerAdResponseModel>
    implements $CreateBannerAdResponseModelCopyWith<$Res> {
  _$CreateBannerAdResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? createdAt = null,
    Object? description = null,
    Object? id = null,
    Object? imageUrls = null,
    Object? planDays = null,
    Object? planName = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      planDays: null == planDays
          ? _value.planDays
          : planDays // ignore: cast_nullable_to_non_nullable
              as int,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateBannerAdResponseModelImplCopyWith<$Res>
    implements $CreateBannerAdResponseModelCopyWith<$Res> {
  factory _$$CreateBannerAdResponseModelImplCopyWith(
          _$CreateBannerAdResponseModelImpl value,
          $Res Function(_$CreateBannerAdResponseModelImpl) then) =
      __$$CreateBannerAdResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      DateTime createdAt,
      String description,
      String id,
      List<String> imageUrls,
      int planDays,
      String planName,
      String status});
}

/// @nodoc
class __$$CreateBannerAdResponseModelImplCopyWithImpl<$Res>
    extends _$CreateBannerAdResponseModelCopyWithImpl<$Res,
        _$CreateBannerAdResponseModelImpl>
    implements _$$CreateBannerAdResponseModelImplCopyWith<$Res> {
  __$$CreateBannerAdResponseModelImplCopyWithImpl(
      _$CreateBannerAdResponseModelImpl _value,
      $Res Function(_$CreateBannerAdResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? createdAt = null,
    Object? description = null,
    Object? id = null,
    Object? imageUrls = null,
    Object? planDays = null,
    Object? planName = null,
    Object? status = null,
  }) {
    return _then(_$CreateBannerAdResponseModelImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      planDays: null == planDays
          ? _value.planDays
          : planDays // ignore: cast_nullable_to_non_nullable
              as int,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateBannerAdResponseModelImpl
    implements _CreateBannerAdResponseModel {
  const _$CreateBannerAdResponseModelImpl(
      {required this.amount,
      required this.createdAt,
      required this.description,
      required this.id,
      required final List<String> imageUrls,
      required this.planDays,
      required this.planName,
      required this.status})
      : _imageUrls = imageUrls;

  factory _$CreateBannerAdResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateBannerAdResponseModelImplFromJson(json);

  @override
  final double amount;
  @override
  final DateTime createdAt;
  @override
  final String description;
  @override
  final String id;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  @override
  final int planDays;
  @override
  final String planName;
  @override
  final String status;

  @override
  String toString() {
    return 'CreateBannerAdResponseModel(amount: $amount, createdAt: $createdAt, description: $description, id: $id, imageUrls: $imageUrls, planDays: $planDays, planName: $planName, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateBannerAdResponseModelImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.planDays, planDays) ||
                other.planDays == planDays) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      amount,
      createdAt,
      description,
      id,
      const DeepCollectionEquality().hash(_imageUrls),
      planDays,
      planName,
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateBannerAdResponseModelImplCopyWith<_$CreateBannerAdResponseModelImpl>
      get copyWith => __$$CreateBannerAdResponseModelImplCopyWithImpl<
          _$CreateBannerAdResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateBannerAdResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CreateBannerAdResponseModel
    implements CreateBannerAdResponseModel {
  const factory _CreateBannerAdResponseModel(
      {required final double amount,
      required final DateTime createdAt,
      required final String description,
      required final String id,
      required final List<String> imageUrls,
      required final int planDays,
      required final String planName,
      required final String status}) = _$CreateBannerAdResponseModelImpl;

  factory _CreateBannerAdResponseModel.fromJson(Map<String, dynamic> json) =
      _$CreateBannerAdResponseModelImpl.fromJson;

  @override
  double get amount;
  @override
  DateTime get createdAt;
  @override
  String get description;
  @override
  String get id;
  @override
  List<String> get imageUrls;
  @override
  int get planDays;
  @override
  String get planName;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$CreateBannerAdResponseModelImplCopyWith<_$CreateBannerAdResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
