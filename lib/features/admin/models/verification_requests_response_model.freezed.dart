// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_requests_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationRequestsResponseModel _$VerificationRequestsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationRequestsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationRequestsResponseModel {
  @JsonKey(name: "verification_requests")
  List<VerificationRequestModel>? get verificationRequests =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationRequestsResponseModelCopyWith<VerificationRequestsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationRequestsResponseModelCopyWith<$Res> {
  factory $VerificationRequestsResponseModelCopyWith(
          VerificationRequestsResponseModel value,
          $Res Function(VerificationRequestsResponseModel) then) =
      _$VerificationRequestsResponseModelCopyWithImpl<$Res,
          VerificationRequestsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "verification_requests")
      List<VerificationRequestModel>? verificationRequests,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$VerificationRequestsResponseModelCopyWithImpl<$Res,
        $Val extends VerificationRequestsResponseModel>
    implements $VerificationRequestsResponseModelCopyWith<$Res> {
  _$VerificationRequestsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationRequests = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      verificationRequests: freezed == verificationRequests
          ? _value.verificationRequests
          : verificationRequests // ignore: cast_nullable_to_non_nullable
              as List<VerificationRequestModel>?,
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
abstract class _$$VerificationRequestsResponseModelImplCopyWith<$Res>
    implements $VerificationRequestsResponseModelCopyWith<$Res> {
  factory _$$VerificationRequestsResponseModelImplCopyWith(
          _$VerificationRequestsResponseModelImpl value,
          $Res Function(_$VerificationRequestsResponseModelImpl) then) =
      __$$VerificationRequestsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "verification_requests")
      List<VerificationRequestModel>? verificationRequests,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$VerificationRequestsResponseModelImplCopyWithImpl<$Res>
    extends _$VerificationRequestsResponseModelCopyWithImpl<$Res,
        _$VerificationRequestsResponseModelImpl>
    implements _$$VerificationRequestsResponseModelImplCopyWith<$Res> {
  __$$VerificationRequestsResponseModelImplCopyWithImpl(
      _$VerificationRequestsResponseModelImpl _value,
      $Res Function(_$VerificationRequestsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationRequests = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$VerificationRequestsResponseModelImpl(
      verificationRequests: freezed == verificationRequests
          ? _value._verificationRequests
          : verificationRequests // ignore: cast_nullable_to_non_nullable
              as List<VerificationRequestModel>?,
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
class _$VerificationRequestsResponseModelImpl
    implements _VerificationRequestsResponseModel {
  const _$VerificationRequestsResponseModelImpl(
      {@JsonKey(name: "verification_requests")
      final List<VerificationRequestModel>? verificationRequests,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _verificationRequests = verificationRequests;

  factory _$VerificationRequestsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$VerificationRequestsResponseModelImplFromJson(json);

  final List<VerificationRequestModel>? _verificationRequests;
  @override
  @JsonKey(name: "verification_requests")
  List<VerificationRequestModel>? get verificationRequests {
    final value = _verificationRequests;
    if (value == null) return null;
    if (_verificationRequests is EqualUnmodifiableListView)
      return _verificationRequests;
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
    return 'VerificationRequestsResponseModel(verificationRequests: $verificationRequests, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationRequestsResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._verificationRequests, _verificationRequests) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_verificationRequests),
      total,
      page,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationRequestsResponseModelImplCopyWith<
          _$VerificationRequestsResponseModelImpl>
      get copyWith => __$$VerificationRequestsResponseModelImplCopyWithImpl<
          _$VerificationRequestsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationRequestsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationRequestsResponseModel
    implements VerificationRequestsResponseModel {
  const factory _VerificationRequestsResponseModel(
          {@JsonKey(name: "verification_requests")
          final List<VerificationRequestModel>? verificationRequests,
          @JsonKey(name: "total") final int? total,
          @JsonKey(name: "page") final int? page,
          @JsonKey(name: "limit") final int? limit}) =
      _$VerificationRequestsResponseModelImpl;

  factory _VerificationRequestsResponseModel.fromJson(
          Map<String, dynamic> json) =
      _$VerificationRequestsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "verification_requests")
  List<VerificationRequestModel>? get verificationRequests;
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
  _$$VerificationRequestsResponseModelImplCopyWith<
          _$VerificationRequestsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
