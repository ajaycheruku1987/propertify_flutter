// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'requests_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AdminViewRequestsModel _$AdminViewRequestsModelFromJson(
    Map<String, dynamic> json) {
  return _AdminViewRequestsModel.fromJson(json);
}

/// @nodoc
mixin _$AdminViewRequestsModel {
  @JsonKey(name: "requests")
  List<RequestModel>? get requests => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdminViewRequestsModelCopyWith<AdminViewRequestsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdminViewRequestsModelCopyWith<$Res> {
  factory $AdminViewRequestsModelCopyWith(AdminViewRequestsModel value,
          $Res Function(AdminViewRequestsModel) then) =
      _$AdminViewRequestsModelCopyWithImpl<$Res, AdminViewRequestsModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "requests") List<RequestModel>? requests,
      @JsonKey(name: "total") int? total});
}

/// @nodoc
class _$AdminViewRequestsModelCopyWithImpl<$Res,
        $Val extends AdminViewRequestsModel>
    implements $AdminViewRequestsModelCopyWith<$Res> {
  _$AdminViewRequestsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = freezed,
    Object? total = freezed,
  }) {
    return _then(_value.copyWith(
      requests: freezed == requests
          ? _value.requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AdminViewRequestsModelImplCopyWith<$Res>
    implements $AdminViewRequestsModelCopyWith<$Res> {
  factory _$$AdminViewRequestsModelImplCopyWith(
          _$AdminViewRequestsModelImpl value,
          $Res Function(_$AdminViewRequestsModelImpl) then) =
      __$$AdminViewRequestsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "requests") List<RequestModel>? requests,
      @JsonKey(name: "total") int? total});
}

/// @nodoc
class __$$AdminViewRequestsModelImplCopyWithImpl<$Res>
    extends _$AdminViewRequestsModelCopyWithImpl<$Res,
        _$AdminViewRequestsModelImpl>
    implements _$$AdminViewRequestsModelImplCopyWith<$Res> {
  __$$AdminViewRequestsModelImplCopyWithImpl(
      _$AdminViewRequestsModelImpl _value,
      $Res Function(_$AdminViewRequestsModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requests = freezed,
    Object? total = freezed,
  }) {
    return _then(_$AdminViewRequestsModelImpl(
      requests: freezed == requests
          ? _value._requests
          : requests // ignore: cast_nullable_to_non_nullable
              as List<RequestModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AdminViewRequestsModelImpl implements _AdminViewRequestsModel {
  const _$AdminViewRequestsModelImpl(
      {@JsonKey(name: "requests") final List<RequestModel>? requests,
      @JsonKey(name: "total") this.total})
      : _requests = requests;

  factory _$AdminViewRequestsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminViewRequestsModelImplFromJson(json);

  final List<RequestModel>? _requests;
  @override
  @JsonKey(name: "requests")
  List<RequestModel>? get requests {
    final value = _requests;
    if (value == null) return null;
    if (_requests is EqualUnmodifiableListView) return _requests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "total")
  final int? total;

  @override
  String toString() {
    return 'AdminViewRequestsModel(requests: $requests, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdminViewRequestsModelImpl &&
            const DeepCollectionEquality().equals(other._requests, _requests) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_requests), total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AdminViewRequestsModelImplCopyWith<_$AdminViewRequestsModelImpl>
      get copyWith => __$$AdminViewRequestsModelImplCopyWithImpl<
          _$AdminViewRequestsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminViewRequestsModelImplToJson(
      this,
    );
  }
}

abstract class _AdminViewRequestsModel implements AdminViewRequestsModel {
  const factory _AdminViewRequestsModel(
      {@JsonKey(name: "requests") final List<RequestModel>? requests,
      @JsonKey(name: "total") final int? total}) = _$AdminViewRequestsModelImpl;

  factory _AdminViewRequestsModel.fromJson(Map<String, dynamic> json) =
      _$AdminViewRequestsModelImpl.fromJson;

  @override
  @JsonKey(name: "requests")
  List<RequestModel>? get requests;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(ignore: true)
  _$$AdminViewRequestsModelImplCopyWith<_$AdminViewRequestsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
