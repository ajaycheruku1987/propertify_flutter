// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interior_designs_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InteriorDesignsResponseModel _$InteriorDesignsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _InteriorDesignsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$InteriorDesignsResponseModel {
  @JsonKey(name: "interior_designs")
  List<InteriorDesignModel>? get interiorDesigns =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InteriorDesignsResponseModelCopyWith<InteriorDesignsResponseModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteriorDesignsResponseModelCopyWith<$Res> {
  factory $InteriorDesignsResponseModelCopyWith(
          InteriorDesignsResponseModel value,
          $Res Function(InteriorDesignsResponseModel) then) =
      _$InteriorDesignsResponseModelCopyWithImpl<$Res,
          InteriorDesignsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "interior_designs")
      List<InteriorDesignModel>? interiorDesigns,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$InteriorDesignsResponseModelCopyWithImpl<$Res,
        $Val extends InteriorDesignsResponseModel>
    implements $InteriorDesignsResponseModelCopyWith<$Res> {
  _$InteriorDesignsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interiorDesigns = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      interiorDesigns: freezed == interiorDesigns
          ? _value.interiorDesigns
          : interiorDesigns // ignore: cast_nullable_to_non_nullable
              as List<InteriorDesignModel>?,
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
abstract class _$$InteriorDesignsResponseModelImplCopyWith<$Res>
    implements $InteriorDesignsResponseModelCopyWith<$Res> {
  factory _$$InteriorDesignsResponseModelImplCopyWith(
          _$InteriorDesignsResponseModelImpl value,
          $Res Function(_$InteriorDesignsResponseModelImpl) then) =
      __$$InteriorDesignsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "interior_designs")
      List<InteriorDesignModel>? interiorDesigns,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$InteriorDesignsResponseModelImplCopyWithImpl<$Res>
    extends _$InteriorDesignsResponseModelCopyWithImpl<$Res,
        _$InteriorDesignsResponseModelImpl>
    implements _$$InteriorDesignsResponseModelImplCopyWith<$Res> {
  __$$InteriorDesignsResponseModelImplCopyWithImpl(
      _$InteriorDesignsResponseModelImpl _value,
      $Res Function(_$InteriorDesignsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interiorDesigns = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$InteriorDesignsResponseModelImpl(
      interiorDesigns: freezed == interiorDesigns
          ? _value._interiorDesigns
          : interiorDesigns // ignore: cast_nullable_to_non_nullable
              as List<InteriorDesignModel>?,
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
class _$InteriorDesignsResponseModelImpl
    implements _InteriorDesignsResponseModel {
  const _$InteriorDesignsResponseModelImpl(
      {@JsonKey(name: "interior_designs")
      final List<InteriorDesignModel>? interiorDesigns,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _interiorDesigns = interiorDesigns;

  factory _$InteriorDesignsResponseModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$InteriorDesignsResponseModelImplFromJson(json);

  final List<InteriorDesignModel>? _interiorDesigns;
  @override
  @JsonKey(name: "interior_designs")
  List<InteriorDesignModel>? get interiorDesigns {
    final value = _interiorDesigns;
    if (value == null) return null;
    if (_interiorDesigns is EqualUnmodifiableListView) return _interiorDesigns;
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
    return 'InteriorDesignsResponseModel(interiorDesigns: $interiorDesigns, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteriorDesignsResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._interiorDesigns, _interiorDesigns) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_interiorDesigns),
      total,
      page,
      limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InteriorDesignsResponseModelImplCopyWith<
          _$InteriorDesignsResponseModelImpl>
      get copyWith => __$$InteriorDesignsResponseModelImplCopyWithImpl<
          _$InteriorDesignsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InteriorDesignsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _InteriorDesignsResponseModel
    implements InteriorDesignsResponseModel {
  const factory _InteriorDesignsResponseModel(
          {@JsonKey(name: "interior_designs")
          final List<InteriorDesignModel>? interiorDesigns,
          @JsonKey(name: "total") final int? total,
          @JsonKey(name: "page") final int? page,
          @JsonKey(name: "limit") final int? limit}) =
      _$InteriorDesignsResponseModelImpl;

  factory _InteriorDesignsResponseModel.fromJson(Map<String, dynamic> json) =
      _$InteriorDesignsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "interior_designs")
  List<InteriorDesignModel>? get interiorDesigns;
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
  _$$InteriorDesignsResponseModelImplCopyWith<
          _$InteriorDesignsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
