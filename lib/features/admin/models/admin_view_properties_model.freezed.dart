// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_view_properties_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminViewPropertiesModel _$AdminViewPropertiesModelFromJson(
    Map<String, dynamic> json) {
  return _AdminViewPropertiesModel.fromJson(json);
}

/// @nodoc
mixin _$AdminViewPropertiesModel {
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "properties")
  List<FeedPostsResponseModel>? get properties =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminViewPropertiesModelCopyWith<AdminViewPropertiesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminViewPropertiesModelCopyWith<$Res> {
  factory $AdminViewPropertiesModelCopyWith(AdminViewPropertiesModel value,
          $Res Function(AdminViewPropertiesModel) then) =
      _$AdminViewPropertiesModelCopyWithImpl<$Res, AdminViewPropertiesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total") int? total,
      @JsonKey(name: "properties") List<FeedPostsResponseModel>? properties});
}

/// @nodoc
class _$AdminViewPropertiesModelCopyWithImpl<$Res,
        $Val extends AdminViewPropertiesModel>
    implements $AdminViewPropertiesModelCopyWith<$Res> {
  _$AdminViewPropertiesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? properties = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      properties: freezed == properties
          ? _value.properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminViewPropertiesModelImplCopyWith<$Res>
    implements $AdminViewPropertiesModelCopyWith<$Res> {
  factory _$$AdminViewPropertiesModelImplCopyWith(
          _$AdminViewPropertiesModelImpl value,
          $Res Function(_$AdminViewPropertiesModelImpl) then) =
      __$$AdminViewPropertiesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total") int? total,
      @JsonKey(name: "properties") List<FeedPostsResponseModel>? properties});
}

/// @nodoc
class __$$AdminViewPropertiesModelImplCopyWithImpl<$Res>
    extends _$AdminViewPropertiesModelCopyWithImpl<$Res,
        _$AdminViewPropertiesModelImpl>
    implements _$$AdminViewPropertiesModelImplCopyWith<$Res> {
  __$$AdminViewPropertiesModelImplCopyWithImpl(
      _$AdminViewPropertiesModelImpl _value,
      $Res Function(_$AdminViewPropertiesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? properties = freezed,
  }) {
    return _then(_$AdminViewPropertiesModelImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      properties: freezed == properties
          ? _value._properties
          : properties // ignore: cast_nullable_to_non_nullable
              as List<FeedPostsResponseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminViewPropertiesModelImpl implements _AdminViewPropertiesModel {
  const _$AdminViewPropertiesModelImpl(
      {@JsonKey(name: "total") this.total,
      @JsonKey(name: "properties")
      final List<FeedPostsResponseModel>? properties})
      : _properties = properties;

  factory _$AdminViewPropertiesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminViewPropertiesModelImplFromJson(json);

  @override
  @JsonKey(name: "total")
  final int? total;
  final List<FeedPostsResponseModel>? _properties;
  @override
  @JsonKey(name: "properties")
  List<FeedPostsResponseModel>? get properties {
    final value = _properties;
    if (value == null) return null;
    if (_properties is EqualUnmodifiableListView) return _properties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdminViewPropertiesModel(total: $total, properties: $properties)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminViewPropertiesModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality()
                .equals(other._properties, _properties));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_properties));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminViewPropertiesModelImplCopyWith<_$AdminViewPropertiesModelImpl>
      get copyWith => __$$AdminViewPropertiesModelImplCopyWithImpl<
          _$AdminViewPropertiesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminViewPropertiesModelImplToJson(
      this,
    );
  }
}

abstract class _AdminViewPropertiesModel implements AdminViewPropertiesModel {
  const factory _AdminViewPropertiesModel(
          {@JsonKey(name: "total") final int? total,
          @JsonKey(name: "properties")
          final List<FeedPostsResponseModel>? properties}) =
      _$AdminViewPropertiesModelImpl;

  factory _AdminViewPropertiesModel.fromJson(Map<String, dynamic> json) =
      _$AdminViewPropertiesModelImpl.fromJson;

  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "properties")
  List<FeedPostsResponseModel>? get properties;
  @override
  @JsonKey(ignore: true)
  _$$AdminViewPropertiesModelImplCopyWith<_$AdminViewPropertiesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
