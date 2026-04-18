// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'callback_requests_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallbackRequestsResponseModel _$CallbackRequestsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _CallbackRequestsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$CallbackRequestsResponseModel {
  @JsonKey(name: "items")
  List<CallbackRequestModel>? get callbackRequests =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallbackRequestsResponseModelCopyWith<CallbackRequestsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallbackRequestsResponseModelCopyWith<$Res> {
  factory $CallbackRequestsResponseModelCopyWith(
          CallbackRequestsResponseModel value,
          $Res Function(CallbackRequestsResponseModel) then) =
      _$CallbackRequestsResponseModelCopyWithImpl<$Res,
          CallbackRequestsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "items") List<CallbackRequestModel>? callbackRequests,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$CallbackRequestsResponseModelCopyWithImpl<$Res,
        $Val extends CallbackRequestsResponseModel>
    implements $CallbackRequestsResponseModelCopyWith<$Res> {
  _$CallbackRequestsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callbackRequests = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      callbackRequests: freezed == callbackRequests
          ? _value.callbackRequests
          : callbackRequests // ignore: cast_nullable_to_non_nullable
              as List<CallbackRequestModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallbackRequestsResponseModelImplCopyWith<$Res>
    implements $CallbackRequestsResponseModelCopyWith<$Res> {
  factory _$$CallbackRequestsResponseModelImplCopyWith(
          _$CallbackRequestsResponseModelImpl value,
          $Res Function(_$CallbackRequestsResponseModelImpl) then) =
      __$$CallbackRequestsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "items") List<CallbackRequestModel>? callbackRequests,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$CallbackRequestsResponseModelImplCopyWithImpl<$Res>
    extends _$CallbackRequestsResponseModelCopyWithImpl<$Res,
        _$CallbackRequestsResponseModelImpl>
    implements _$$CallbackRequestsResponseModelImplCopyWith<$Res> {
  __$$CallbackRequestsResponseModelImplCopyWithImpl(
      _$CallbackRequestsResponseModelImpl _value,
      $Res Function(_$CallbackRequestsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callbackRequests = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$CallbackRequestsResponseModelImpl(
      callbackRequests: freezed == callbackRequests
          ? _value._callbackRequests
          : callbackRequests // ignore: cast_nullable_to_non_nullable
              as List<CallbackRequestModel>?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallbackRequestsResponseModelImpl
    implements _CallbackRequestsResponseModel {
  const _$CallbackRequestsResponseModelImpl(
      {@JsonKey(name: "items")
      final List<CallbackRequestModel>? callbackRequests,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _callbackRequests = callbackRequests;

  factory _$CallbackRequestsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CallbackRequestsResponseModelImplFromJson(json);

  final List<CallbackRequestModel>? _callbackRequests;
  @override
  @JsonKey(name: "items")
  List<CallbackRequestModel>? get callbackRequests {
    final value = _callbackRequests;
    if (value == null) return null;
    if (_callbackRequests is EqualUnmodifiableListView)
      return _callbackRequests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "total")
  final int? total;
  @override
  @JsonKey(name: "page")
  final int? page;
  @override
  @JsonKey(name: "limit")
  final int? limit;

  @override
  String toString() {
    return 'CallbackRequestsResponseModel(callbackRequests: $callbackRequests, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallbackRequestsResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._callbackRequests, _callbackRequests) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_callbackRequests),
      total,
      page,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallbackRequestsResponseModelImplCopyWith<
          _$CallbackRequestsResponseModelImpl>
      get copyWith => __$$CallbackRequestsResponseModelImplCopyWithImpl<
          _$CallbackRequestsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallbackRequestsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _CallbackRequestsResponseModel
    implements CallbackRequestsResponseModel {
  const factory _CallbackRequestsResponseModel(
          {@JsonKey(name: "items")
          final List<CallbackRequestModel>? callbackRequests,
          @JsonKey(name: "total") final int? total,
          @JsonKey(name: "page") final int? page,
          @JsonKey(name: "limit") final int? limit}) =
      _$CallbackRequestsResponseModelImpl;

  factory _CallbackRequestsResponseModel.fromJson(Map<String, dynamic> json) =
      _$CallbackRequestsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "items")
  List<CallbackRequestModel>? get callbackRequests;
  @override
  @JsonKey(name: "total")
  int? get total;
  @override
  @JsonKey(name: "page")
  int? get page;
  @override
  @JsonKey(name: "limit")
  int? get limit;
  @override
  @JsonKey(ignore: true)
  _$$CallbackRequestsResponseModelImplCopyWith<
          _$CallbackRequestsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
