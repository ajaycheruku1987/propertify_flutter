// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_view_services_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminViewServicesModel _$AdminViewServicesModelFromJson(
    Map<String, dynamic> json) {
  return _AdminViewServicesModel.fromJson(json);
}

/// @nodoc
mixin _$AdminViewServicesModel {
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "services")
  List<ServicesResponseModel>? get services =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminViewServicesModelCopyWith<AdminViewServicesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminViewServicesModelCopyWith<$Res> {
  factory $AdminViewServicesModelCopyWith(AdminViewServicesModel value,
          $Res Function(AdminViewServicesModel) then) =
      _$AdminViewServicesModelCopyWithImpl<$Res, AdminViewServicesModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total") int? total,
      @JsonKey(name: "services") List<ServicesResponseModel>? services});
}

/// @nodoc
class _$AdminViewServicesModelCopyWithImpl<$Res,
        $Val extends AdminViewServicesModel>
    implements $AdminViewServicesModelCopyWith<$Res> {
  _$AdminViewServicesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? services = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminViewServicesModelImplCopyWith<$Res>
    implements $AdminViewServicesModelCopyWith<$Res> {
  factory _$$AdminViewServicesModelImplCopyWith(
          _$AdminViewServicesModelImpl value,
          $Res Function(_$AdminViewServicesModelImpl) then) =
      __$$AdminViewServicesModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total") int? total,
      @JsonKey(name: "services") List<ServicesResponseModel>? services});
}

/// @nodoc
class __$$AdminViewServicesModelImplCopyWithImpl<$Res>
    extends _$AdminViewServicesModelCopyWithImpl<$Res,
        _$AdminViewServicesModelImpl>
    implements _$$AdminViewServicesModelImplCopyWith<$Res> {
  __$$AdminViewServicesModelImplCopyWithImpl(
      _$AdminViewServicesModelImpl _value,
      $Res Function(_$AdminViewServicesModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? services = freezed,
  }) {
    return _then(_$AdminViewServicesModelImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<ServicesResponseModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminViewServicesModelImpl implements _AdminViewServicesModel {
  const _$AdminViewServicesModelImpl(
      {@JsonKey(name: "total") this.total,
      @JsonKey(name: "services") final List<ServicesResponseModel>? services})
      : _services = services;

  factory _$AdminViewServicesModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminViewServicesModelImplFromJson(json);

  @override
  @JsonKey(name: "total")
  final int? total;
  final List<ServicesResponseModel>? _services;
  @override
  @JsonKey(name: "services")
  List<ServicesResponseModel>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AdminViewServicesModel(total: $total, services: $services)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminViewServicesModelImpl &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._services, _services));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, total, const DeepCollectionEquality().hash(_services));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminViewServicesModelImplCopyWith<_$AdminViewServicesModelImpl>
      get copyWith => __$$AdminViewServicesModelImplCopyWithImpl<
          _$AdminViewServicesModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminViewServicesModelImplToJson(
      this,
    );
  }
}

abstract class _AdminViewServicesModel implements AdminViewServicesModel {
  const factory _AdminViewServicesModel(
          {@JsonKey(name: "total") final int? total,
          @JsonKey(name: "services")
          final List<ServicesResponseModel>? services}) =
      _$AdminViewServicesModelImpl;

  factory _AdminViewServicesModel.fromJson(Map<String, dynamic> json) =
      _$AdminViewServicesModelImpl.fromJson;

  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "services")
  List<ServicesResponseModel>? get services;
  @override
  @JsonKey(ignore: true)
  _$$AdminViewServicesModelImplCopyWith<_$AdminViewServicesModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
