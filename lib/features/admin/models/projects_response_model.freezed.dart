// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'projects_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectsResponseModel _$ProjectsResponseModelFromJson(
    Map<String, dynamic> json) {
  return _ProjectsResponseModel.fromJson(json);
}

/// @nodoc
mixin _$ProjectsResponseModel {
  @JsonKey(name: "projects")
  List<ProjectModel>? get projects => throw _privateConstructorUsedError;
  @JsonKey(name: "total")
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: "page")
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: "limit")
  int? get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectsResponseModelCopyWith<ProjectsResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsResponseModelCopyWith<$Res> {
  factory $ProjectsResponseModelCopyWith(ProjectsResponseModel value,
          $Res Function(ProjectsResponseModel) then) =
      _$ProjectsResponseModelCopyWithImpl<$Res, ProjectsResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "projects") List<ProjectModel>? projects,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class _$ProjectsResponseModelCopyWithImpl<$Res,
        $Val extends ProjectsResponseModel>
    implements $ProjectsResponseModelCopyWith<$Res> {
  _$ProjectsResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_value.copyWith(
      projects: freezed == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
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
abstract class _$$ProjectsResponseModelImplCopyWith<$Res>
    implements $ProjectsResponseModelCopyWith<$Res> {
  factory _$$ProjectsResponseModelImplCopyWith(
          _$ProjectsResponseModelImpl value,
          $Res Function(_$ProjectsResponseModelImpl) then) =
      __$$ProjectsResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "projects") List<ProjectModel>? projects,
      @JsonKey(name: "total") int? total,
      @JsonKey(name: "page") int? page,
      @JsonKey(name: "limit") int? limit});
}

/// @nodoc
class __$$ProjectsResponseModelImplCopyWithImpl<$Res>
    extends _$ProjectsResponseModelCopyWithImpl<$Res,
        _$ProjectsResponseModelImpl>
    implements _$$ProjectsResponseModelImplCopyWith<$Res> {
  __$$ProjectsResponseModelImplCopyWithImpl(_$ProjectsResponseModelImpl _value,
      $Res Function(_$ProjectsResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projects = freezed,
    Object? total = freezed,
    Object? page = freezed,
    Object? limit = freezed,
  }) {
    return _then(_$ProjectsResponseModelImpl(
      projects: freezed == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<ProjectModel>?,
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
class _$ProjectsResponseModelImpl implements _ProjectsResponseModel {
  const _$ProjectsResponseModelImpl(
      {@JsonKey(name: "projects") final List<ProjectModel>? projects,
      @JsonKey(name: "total") this.total,
      @JsonKey(name: "page") this.page,
      @JsonKey(name: "limit") this.limit})
      : _projects = projects;

  factory _$ProjectsResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectsResponseModelImplFromJson(json);

  final List<ProjectModel>? _projects;
  @override
  @JsonKey(name: "projects")
  List<ProjectModel>? get projects {
    final value = _projects;
    if (value == null) return null;
    if (_projects is EqualUnmodifiableListView) return _projects;
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
    return 'ProjectsResponseModel(projects: $projects, total: $total, page: $page, limit: $limit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectsResponseModelImpl &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_projects), total, page, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectsResponseModelImplCopyWith<_$ProjectsResponseModelImpl>
      get copyWith => __$$ProjectsResponseModelImplCopyWithImpl<
          _$ProjectsResponseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectsResponseModelImplToJson(
      this,
    );
  }
}

abstract class _ProjectsResponseModel implements ProjectsResponseModel {
  const factory _ProjectsResponseModel(
      {@JsonKey(name: "projects") final List<ProjectModel>? projects,
      @JsonKey(name: "total") final int? total,
      @JsonKey(name: "page") final int? page,
      @JsonKey(name: "limit") final int? limit}) = _$ProjectsResponseModelImpl;

  factory _ProjectsResponseModel.fromJson(Map<String, dynamic> json) =
      _$ProjectsResponseModelImpl.fromJson;

  @override
  @JsonKey(name: "projects")
  List<ProjectModel>? get projects;
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
  _$$ProjectsResponseModelImplCopyWith<_$ProjectsResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
