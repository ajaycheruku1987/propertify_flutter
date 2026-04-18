// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'callback_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CallbackRequestModel _$CallbackRequestModelFromJson(Map<String, dynamic> json) {
  return _CallbackRequestModel.fromJson(json);
}

/// @nodoc
mixin _$CallbackRequestModel {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "sales_project_id")
  String? get salesProjectId => throw _privateConstructorUsedError;
  @JsonKey(name: "requested_by_user_id")
  String? get requestedByUserId => throw _privateConstructorUsedError;
  @JsonKey(name: "name")
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "phone_number")
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: "email")
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "preferred_time")
  String? get preferredTime => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String? get message => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "project_name")
  String? get projectName => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CallbackRequestModelCopyWith<CallbackRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CallbackRequestModelCopyWith<$Res> {
  factory $CallbackRequestModelCopyWith(CallbackRequestModel value,
          $Res Function(CallbackRequestModel) then) =
      _$CallbackRequestModelCopyWithImpl<$Res, CallbackRequestModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "sales_project_id") String? salesProjectId,
      @JsonKey(name: "requested_by_user_id") String? requestedByUserId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "preferred_time") String? preferredTime,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "project_name") String? projectName,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class _$CallbackRequestModelCopyWithImpl<$Res,
        $Val extends CallbackRequestModel>
    implements $CallbackRequestModelCopyWith<$Res> {
  _$CallbackRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? salesProjectId = freezed,
    Object? requestedByUserId = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? preferredTime = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? projectName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      salesProjectId: freezed == salesProjectId
          ? _value.salesProjectId
          : salesProjectId // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedByUserId: freezed == requestedByUserId
          ? _value.requestedByUserId
          : requestedByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredTime: freezed == preferredTime
          ? _value.preferredTime
          : preferredTime // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CallbackRequestModelImplCopyWith<$Res>
    implements $CallbackRequestModelCopyWith<$Res> {
  factory _$$CallbackRequestModelImplCopyWith(_$CallbackRequestModelImpl value,
          $Res Function(_$CallbackRequestModelImpl) then) =
      __$$CallbackRequestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "sales_project_id") String? salesProjectId,
      @JsonKey(name: "requested_by_user_id") String? requestedByUserId,
      @JsonKey(name: "name") String? name,
      @JsonKey(name: "phone_number") String? phoneNumber,
      @JsonKey(name: "email") String? email,
      @JsonKey(name: "preferred_time") String? preferredTime,
      @JsonKey(name: "message") String? message,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "project_name") String? projectName,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "updated_at") String? updatedAt});
}

/// @nodoc
class __$$CallbackRequestModelImplCopyWithImpl<$Res>
    extends _$CallbackRequestModelCopyWithImpl<$Res, _$CallbackRequestModelImpl>
    implements _$$CallbackRequestModelImplCopyWith<$Res> {
  __$$CallbackRequestModelImplCopyWithImpl(_$CallbackRequestModelImpl _value,
      $Res Function(_$CallbackRequestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? salesProjectId = freezed,
    Object? requestedByUserId = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? preferredTime = freezed,
    Object? message = freezed,
    Object? status = freezed,
    Object? projectName = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CallbackRequestModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      salesProjectId: freezed == salesProjectId
          ? _value.salesProjectId
          : salesProjectId // ignore: cast_nullable_to_non_nullable
              as String?,
      requestedByUserId: freezed == requestedByUserId
          ? _value.requestedByUserId
          : requestedByUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      preferredTime: freezed == preferredTime
          ? _value.preferredTime
          : preferredTime // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      projectName: freezed == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CallbackRequestModelImpl implements _CallbackRequestModel {
  const _$CallbackRequestModelImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "sales_project_id") this.salesProjectId,
      @JsonKey(name: "requested_by_user_id") this.requestedByUserId,
      @JsonKey(name: "name") this.name,
      @JsonKey(name: "phone_number") this.phoneNumber,
      @JsonKey(name: "email") this.email,
      @JsonKey(name: "preferred_time") this.preferredTime,
      @JsonKey(name: "message") this.message,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "project_name") this.projectName,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt});

  factory _$CallbackRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CallbackRequestModelImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "sales_project_id")
  final String? salesProjectId;
  @override
  @JsonKey(name: "requested_by_user_id")
  final String? requestedByUserId;
  @override
  @JsonKey(name: "name")
  final String? name;
  @override
  @JsonKey(name: "phone_number")
  final String? phoneNumber;
  @override
  @JsonKey(name: "email")
  final String? email;
  @override
  @JsonKey(name: "preferred_time")
  final String? preferredTime;
  @override
  @JsonKey(name: "message")
  final String? message;
  @override
  @JsonKey(name: "status")
  final String? status;
  @override
  @JsonKey(name: "project_name")
  final String? projectName;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @override
  String toString() {
    return 'CallbackRequestModel(id: $id, salesProjectId: $salesProjectId, requestedByUserId: $requestedByUserId, name: $name, phoneNumber: $phoneNumber, email: $email, preferredTime: $preferredTime, message: $message, status: $status, projectName: $projectName, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CallbackRequestModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.salesProjectId, salesProjectId) ||
                other.salesProjectId == salesProjectId) &&
            (identical(other.requestedByUserId, requestedByUserId) ||
                other.requestedByUserId == requestedByUserId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.preferredTime, preferredTime) ||
                other.preferredTime == preferredTime) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      salesProjectId,
      requestedByUserId,
      name,
      phoneNumber,
      email,
      preferredTime,
      message,
      status,
      projectName,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CallbackRequestModelImplCopyWith<_$CallbackRequestModelImpl>
      get copyWith =>
          __$$CallbackRequestModelImplCopyWithImpl<_$CallbackRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CallbackRequestModelImplToJson(
      this,
    );
  }
}

abstract class _CallbackRequestModel implements CallbackRequestModel {
  const factory _CallbackRequestModel(
      {@JsonKey(name: "id") final String? id,
      @JsonKey(name: "sales_project_id") final String? salesProjectId,
      @JsonKey(name: "requested_by_user_id") final String? requestedByUserId,
      @JsonKey(name: "name") final String? name,
      @JsonKey(name: "phone_number") final String? phoneNumber,
      @JsonKey(name: "email") final String? email,
      @JsonKey(name: "preferred_time") final String? preferredTime,
      @JsonKey(name: "message") final String? message,
      @JsonKey(name: "status") final String? status,
      @JsonKey(name: "project_name") final String? projectName,
      @JsonKey(name: "created_at") final String? createdAt,
      @JsonKey(name: "updated_at")
      final String? updatedAt}) = _$CallbackRequestModelImpl;

  factory _CallbackRequestModel.fromJson(Map<String, dynamic> json) =
      _$CallbackRequestModelImpl.fromJson;

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "sales_project_id")
  String? get salesProjectId;
  @override
  @JsonKey(name: "requested_by_user_id")
  String? get requestedByUserId;
  @override
  @JsonKey(name: "name")
  String? get name;
  @override
  @JsonKey(name: "phone_number")
  String? get phoneNumber;
  @override
  @JsonKey(name: "email")
  String? get email;
  @override
  @JsonKey(name: "preferred_time")
  String? get preferredTime;
  @override
  @JsonKey(name: "message")
  String? get message;
  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "project_name")
  String? get projectName;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  String? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CallbackRequestModelImplCopyWith<_$CallbackRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
