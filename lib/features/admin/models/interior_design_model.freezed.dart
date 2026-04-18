// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interior_design_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InteriorDesignModel _$InteriorDesignModelFromJson(Map<String, dynamic> json) {
  return _InteriorDesignModel.fromJson(json);
}

/// @nodoc
mixin _$InteriorDesignModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_price")
  String? get budgetPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "posted_by")
  String? get postedBy => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InteriorDesignModelCopyWith<InteriorDesignModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InteriorDesignModelCopyWith<$Res> {
  factory $InteriorDesignModelCopyWith(
          InteriorDesignModel value, $Res Function(InteriorDesignModel) then) =
      _$InteriorDesignModelCopyWithImpl<$Res, InteriorDesignModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "budget_price") String? budgetPrice,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "posted_by") String? postedBy,
      @JsonKey(name: "created_at") String? createdAt});
}

/// @nodoc
class _$InteriorDesignModelCopyWithImpl<$Res, $Val extends InteriorDesignModel>
    implements $InteriorDesignModelCopyWith<$Res> {
  _$InteriorDesignModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? budgetPrice = freezed,
    Object? address = freezed,
    Object? postedBy = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetPrice: freezed == budgetPrice
          ? _value.budgetPrice
          : budgetPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InteriorDesignModelImplCopyWith<$Res>
    implements $InteriorDesignModelCopyWith<$Res> {
  factory _$$InteriorDesignModelImplCopyWith(_$InteriorDesignModelImpl value,
          $Res Function(_$InteriorDesignModelImpl) then) =
      __$$InteriorDesignModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "budget_price") String? budgetPrice,
      @JsonKey(name: "address") String? address,
      @JsonKey(name: "posted_by") String? postedBy,
      @JsonKey(name: "created_at") String? createdAt});
}

/// @nodoc
class __$$InteriorDesignModelImplCopyWithImpl<$Res>
    extends _$InteriorDesignModelCopyWithImpl<$Res, _$InteriorDesignModelImpl>
    implements _$$InteriorDesignModelImplCopyWith<$Res> {
  __$$InteriorDesignModelImplCopyWithImpl(_$InteriorDesignModelImpl _value,
      $Res Function(_$InteriorDesignModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? budgetPrice = freezed,
    Object? address = freezed,
    Object? postedBy = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$InteriorDesignModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetPrice: freezed == budgetPrice
          ? _value.budgetPrice
          : budgetPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      postedBy: freezed == postedBy
          ? _value.postedBy
          : postedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InteriorDesignModelImpl implements _InteriorDesignModel {
  const _$InteriorDesignModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "budget_price") this.budgetPrice,
      @JsonKey(name: "address") this.address,
      @JsonKey(name: "posted_by") this.postedBy,
      @JsonKey(name: "created_at") this.createdAt});

  factory _$InteriorDesignModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InteriorDesignModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "budget_price")
  final String? budgetPrice;
  @override
  @JsonKey(name: "address")
  final String? address;
  @override
  @JsonKey(name: "posted_by")
  final String? postedBy;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;

  @override
  String toString() {
    return 'InteriorDesignModel(id: $id, title: $title, budgetPrice: $budgetPrice, address: $address, postedBy: $postedBy, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InteriorDesignModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.budgetPrice, budgetPrice) ||
                other.budgetPrice == budgetPrice) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.postedBy, postedBy) ||
                other.postedBy == postedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, budgetPrice, address, postedBy, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InteriorDesignModelImplCopyWith<_$InteriorDesignModelImpl> get copyWith =>
      __$$InteriorDesignModelImplCopyWithImpl<_$InteriorDesignModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InteriorDesignModelImplToJson(
      this,
    );
  }
}

abstract class _InteriorDesignModel implements InteriorDesignModel {
  const factory _InteriorDesignModel(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "budget_price") final String? budgetPrice,
          @JsonKey(name: "address") final String? address,
          @JsonKey(name: "posted_by") final String? postedBy,
          @JsonKey(name: "created_at") final String? createdAt}) =
      _$InteriorDesignModelImpl;

  factory _InteriorDesignModel.fromJson(Map<String, dynamic> json) =
      _$InteriorDesignModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "budget_price")
  String? get budgetPrice;
  @override
  @JsonKey(name: "address")
  String? get address;
  @override
  @JsonKey(name: "posted_by")
  String? get postedBy;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$InteriorDesignModelImplCopyWith<_$InteriorDesignModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
