// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VerificationRequestModel _$VerificationRequestModelFromJson(
    Map<String, dynamic> json) {
  return _VerificationRequestModel.fromJson(json);
}

/// @nodoc
mixin _$VerificationRequestModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "category")
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: "property_type")
  String? get propertyType => throw _privateConstructorUsedError;
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls => throw _privateConstructorUsedError;
  @JsonKey(name: "owner_name")
  String? get ownerName => throw _privateConstructorUsedError;
  @JsonKey(name: "document_type")
  String? get documentType => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "user_id")
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VerificationRequestModelCopyWith<VerificationRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationRequestModelCopyWith<$Res> {
  factory $VerificationRequestModelCopyWith(VerificationRequestModel value,
          $Res Function(VerificationRequestModel) then) =
      _$VerificationRequestModelCopyWithImpl<$Res, VerificationRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "property_type") String? propertyType,
      @JsonKey(name: "image_urls") List<String>? imageUrls,
      @JsonKey(name: "owner_name") String? ownerName,
      @JsonKey(name: "document_type") String? documentType,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "user_id") String? userId});
}

/// @nodoc
class _$VerificationRequestModelCopyWithImpl<$Res,
        $Val extends VerificationRequestModel>
    implements $VerificationRequestModelCopyWith<$Res> {
  _$VerificationRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? propertyType = freezed,
    Object? imageUrls = freezed,
    Object? ownerName = freezed,
    Object? documentType = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
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
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerificationRequestModelImplCopyWith<$Res>
    implements $VerificationRequestModelCopyWith<$Res> {
  factory _$$VerificationRequestModelImplCopyWith(
          _$VerificationRequestModelImpl value,
          $Res Function(_$VerificationRequestModelImpl) then) =
      __$$VerificationRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "category") String? category,
      @JsonKey(name: "property_type") String? propertyType,
      @JsonKey(name: "image_urls") List<String>? imageUrls,
      @JsonKey(name: "owner_name") String? ownerName,
      @JsonKey(name: "document_type") String? documentType,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "user_id") String? userId});
}

/// @nodoc
class __$$VerificationRequestModelImplCopyWithImpl<$Res>
    extends _$VerificationRequestModelCopyWithImpl<$Res,
        _$VerificationRequestModelImpl>
    implements _$$VerificationRequestModelImplCopyWith<$Res> {
  __$$VerificationRequestModelImplCopyWithImpl(
      _$VerificationRequestModelImpl _value,
      $Res Function(_$VerificationRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? category = freezed,
    Object? propertyType = freezed,
    Object? imageUrls = freezed,
    Object? ownerName = freezed,
    Object? documentType = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$VerificationRequestModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrls: freezed == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      ownerName: freezed == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String?,
      documentType: freezed == documentType
          ? _value.documentType
          : documentType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerificationRequestModelImpl implements _VerificationRequestModel {
  const _$VerificationRequestModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "category") this.category,
      @JsonKey(name: "property_type") this.propertyType,
      @JsonKey(name: "image_urls") final List<String>? imageUrls,
      @JsonKey(name: "owner_name") this.ownerName,
      @JsonKey(name: "document_type") this.documentType,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "user_id") this.userId})
      : _imageUrls = imageUrls;

  factory _$VerificationRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerificationRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "title")
  final String? title;
  @override
  @JsonKey(name: "category")
  final String? category;
  @override
  @JsonKey(name: "property_type")
  final String? propertyType;
  final List<String>? _imageUrls;
  @override
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls {
    final value = _imageUrls;
    if (value == null) return null;
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "owner_name")
  final String? ownerName;
  @override
  @JsonKey(name: "document_type")
  final String? documentType;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "user_id")
  final String? userId;

  @override
  String toString() {
    return 'VerificationRequestModel(id: $id, title: $title, category: $category, propertyType: $propertyType, imageUrls: $imageUrls, ownerName: $ownerName, documentType: $documentType, status: $status, createdAt: $createdAt, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.documentType, documentType) ||
                other.documentType == documentType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      category,
      propertyType,
      const DeepCollectionEquality().hash(_imageUrls),
      ownerName,
      documentType,
      status,
      createdAt,
      userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationRequestModelImplCopyWith<_$VerificationRequestModelImpl>
      get copyWith => __$$VerificationRequestModelImplCopyWithImpl<
          _$VerificationRequestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerificationRequestModelImplToJson(
      this,
    );
  }
}

abstract class _VerificationRequestModel implements VerificationRequestModel {
  const factory _VerificationRequestModel(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "title") final String? title,
          @JsonKey(name: "category") final String? category,
          @JsonKey(name: "property_type") final String? propertyType,
          @JsonKey(name: "image_urls") final List<String>? imageUrls,
          @JsonKey(name: "owner_name") final String? ownerName,
          @JsonKey(name: "document_type") final String? documentType,
          @JsonKey(name: "status") final String? status,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "user_id") final String? userId}) =
      _$VerificationRequestModelImpl;

  factory _VerificationRequestModel.fromJson(Map<String, dynamic> json) =
      _$VerificationRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "title")
  String? get title;
  @override
  @JsonKey(name: "category")
  String? get category;
  @override
  @JsonKey(name: "property_type")
  String? get propertyType;
  @override
  @JsonKey(name: "image_urls")
  List<String>? get imageUrls;
  @override
  @JsonKey(name: "owner_name")
  String? get ownerName;
  @override
  @JsonKey(name: "document_type")
  String? get documentType;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "user_id")
  String? get userId;
  @override
  @JsonKey(ignore: true)
  _$$VerificationRequestModelImplCopyWith<_$VerificationRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
