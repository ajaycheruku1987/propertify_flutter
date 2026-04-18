// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_loans_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HomeLoansResponseModel _$HomeLoansResponseModelFromJson(
    Map<String, dynamic> json) {
  return _HomeLoansResponseModel.fromJson(json);
}

/// @nodoc
mixin _$HomeLoansResponseModel {
  @JsonKey(name: "home_loans")
  List<HomeLoanModel>? get homeLoans => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HomeLoansResponseModelCopyWith<HomeLoansResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeLoansResponseModelCopyWith<$Res> {
  factory $HomeLoansResponseModelCopyWith(HomeLoansResponseModel value,
          $Res Function(HomeLoansResponseModel) then) =
      _$HomeLoansResponseModelCopyWithImpl<$Res, HomeLoansResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "home_loans") List<HomeLoanModel>? homeLoans,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$HomeLoansResponseModelCopyWithImpl<$Res,
        $Val extends HomeLoansResponseModel>
    implements $HomeLoansResponseModelCopyWith<$Res> {
  _$HomeLoansResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeLoans = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      homeLoans: freezed == homeLoans
          ? _value.homeLoans
          : homeLoans // ignore: cast_nullable_to_non_nullable
              as List<HomeLoanModel>?,
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
abstract class _$$HomeLoansResponseModelImplCopyWith<$Res>
    implements $HomeLoansResponseModelCopyWith<$Res> {
  factory _$$HomeLoansResponseModelImplCopyWith(
          _$HomeLoansResponseModelImpl value,
          $Res Function(_$HomeLoansResponseModelImpl) then) =
      __$$HomeLoansResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "home_loans") List<HomeLoanModel>? homeLoans,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$HomeLoansResponseModelImplCopyWithImpl<$Res>
    extends _$HomeLoansResponseModelCopyWithImpl<$Res,
        _$HomeLoansResponseModelImpl>
    implements _$$HomeLoansResponseModelImplCopyWith<$Res> {
  __$$HomeLoansResponseModelImplCopyWithImpl(
      _$HomeLoansResponseModelImpl _value,
      $Res Function(_$HomeLoansResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? homeLoans = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$HomeLoansResponseModelImpl(
      homeLoans: freezed == homeLoans
          ? _value._homeLoans
          : homeLoans // ignore: cast_nullable_to_non_nullable
              as List<HomeLoanModel>?,
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
class _$HomeLoansResponseModelImpl implements _HomeLoansResponseModel {
  const _$HomeLoansResponseModelImpl(
      {@JsonKey(name: "home_loans") final List<HomeLoanModel>? homeLoans,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _homeLoans = homeLoans;

  factory _$HomeLoansResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeLoansResponseModelImplFromJson(json);

  final List<HomeLoanModel>? _homeLoans;
  @override
  @JsonKey(name: "home_loans")
  List<HomeLoanModel>? get homeLoans {
    final value = _homeLoans;
    if (value == null) return null;
    if (_homeLoans is EqualUnmodifiableListView) return _homeLoans;
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
    return 'HomeLoansResponseModel(homeLoans: $homeLoans, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeLoansResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._homeLoans, _homeLoans) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_homeLoans), total, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeLoansResponseModelImplCopyWith<_$HomeLoansResponseModelImpl>
      get copyWith => __$$HomeLoansResponseModelImplCopyWithImpl<
          _$HomeLoansResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeLoansResponseModelImplToJson(
      this,
    );
  }
}

abstract class _HomeLoansResponseModel implements HomeLoansResponseModel {
  const factory _HomeLoansResponseModel(
      {@JsonKey(name: "home_loans") final List<HomeLoanModel>? homeLoans,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "limit") final int? limit}) = _$HomeLoansResponseModelImpl;

  factory _HomeLoansResponseModel.fromJson(Map<String, dynamic> json) =
      _$HomeLoansResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "home_loans")
  List<HomeLoanModel>? get homeLoans;
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
  _$$HomeLoansResponseModelImplCopyWith<_$HomeLoansResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
