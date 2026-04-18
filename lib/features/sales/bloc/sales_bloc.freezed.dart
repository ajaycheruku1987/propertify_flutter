// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesEventCopyWith<$Res> {
  factory $SalesEventCopyWith(
          SalesEvent value, $Res Function(SalesEvent) then) =
      _$SalesEventCopyWithImpl<$Res, SalesEvent>;
}

/// @nodoc
class _$SalesEventCopyWithImpl<$Res, $Val extends SalesEvent>
    implements $SalesEventCopyWith<$Res> {
  _$SalesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements _Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'SalesEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class _Reset implements SalesEvent {
  const factory _Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$GetSalesEventImplCopyWith<$Res> {
  factory _$$GetSalesEventImplCopyWith(
          _$GetSalesEventImpl value, $Res Function(_$GetSalesEventImpl) then) =
      __$$GetSalesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? location,
      String? propertyType,
      double? minPrice,
      double? maxPrice,
      String? search,
      int? limit,
      int? offset});
}

/// @nodoc
class __$$GetSalesEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$GetSalesEventImpl>
    implements _$$GetSalesEventImplCopyWith<$Res> {
  __$$GetSalesEventImplCopyWithImpl(
      _$GetSalesEventImpl _value, $Res Function(_$GetSalesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = freezed,
    Object? propertyType = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? search = freezed,
    Object? limit = freezed,
    Object? offset = freezed,
  }) {
    return _then(_$GetSalesEventImpl(
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      propertyType: freezed == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      search: freezed == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      offset: freezed == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetSalesEventImpl implements _GetSalesEvent {
  const _$GetSalesEventImpl(
      {this.location,
      this.propertyType,
      this.minPrice,
      this.maxPrice,
      this.search,
      this.limit,
      this.offset});

  @override
  final String? location;
  @override
  final String? propertyType;
  @override
  final double? minPrice;
  @override
  final double? maxPrice;
  @override
  final String? search;
  @override
  final int? limit;
  @override
  final int? offset;

  @override
  String toString() {
    return 'SalesEvent.getSalesEvent(location: $location, propertyType: $propertyType, minPrice: $minPrice, maxPrice: $maxPrice, search: $search, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSalesEventImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @override
  int get hashCode => Object.hash(runtimeType, location, propertyType, minPrice,
      maxPrice, search, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSalesEventImplCopyWith<_$GetSalesEventImpl> get copyWith =>
      __$$GetSalesEventImplCopyWithImpl<_$GetSalesEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return getSalesEvent(
        location, propertyType, minPrice, maxPrice, search, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return getSalesEvent?.call(
        location, propertyType, minPrice, maxPrice, search, limit, offset);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getSalesEvent != null) {
      return getSalesEvent(
          location, propertyType, minPrice, maxPrice, search, limit, offset);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return getSalesEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return getSalesEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getSalesEvent != null) {
      return getSalesEvent(this);
    }
    return orElse();
  }
}

abstract class _GetSalesEvent implements SalesEvent {
  const factory _GetSalesEvent(
      {final String? location,
      final String? propertyType,
      final double? minPrice,
      final double? maxPrice,
      final String? search,
      final int? limit,
      final int? offset}) = _$GetSalesEventImpl;

  String? get location;
  String? get propertyType;
  double? get minPrice;
  double? get maxPrice;
  String? get search;
  int? get limit;
  int? get offset;
  @JsonKey(ignore: true)
  _$$GetSalesEventImplCopyWith<_$GetSalesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSaleDetailsEventImplCopyWith<$Res> {
  factory _$$GetSaleDetailsEventImplCopyWith(_$GetSaleDetailsEventImpl value,
          $Res Function(_$GetSaleDetailsEventImpl) then) =
      __$$GetSaleDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$GetSaleDetailsEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$GetSaleDetailsEventImpl>
    implements _$$GetSaleDetailsEventImplCopyWith<$Res> {
  __$$GetSaleDetailsEventImplCopyWithImpl(_$GetSaleDetailsEventImpl _value,
      $Res Function(_$GetSaleDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$GetSaleDetailsEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetSaleDetailsEventImpl implements _GetSaleDetailsEvent {
  const _$GetSaleDetailsEventImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString() {
    return 'SalesEvent.getSaleDetailsEvent(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSaleDetailsEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSaleDetailsEventImplCopyWith<_$GetSaleDetailsEventImpl> get copyWith =>
      __$$GetSaleDetailsEventImplCopyWithImpl<_$GetSaleDetailsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return getSaleDetailsEvent(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return getSaleDetailsEvent?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getSaleDetailsEvent != null) {
      return getSaleDetailsEvent(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return getSaleDetailsEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return getSaleDetailsEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getSaleDetailsEvent != null) {
      return getSaleDetailsEvent(this);
    }
    return orElse();
  }
}

abstract class _GetSaleDetailsEvent implements SalesEvent {
  const factory _GetSaleDetailsEvent({required final String projectId}) =
      _$GetSaleDetailsEventImpl;

  String get projectId;
  @JsonKey(ignore: true)
  _$$GetSaleDetailsEventImplCopyWith<_$GetSaleDetailsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetSalesProjectsByUserIdEventImplCopyWith<$Res> {
  factory _$$GetSalesProjectsByUserIdEventImplCopyWith(
          _$GetSalesProjectsByUserIdEventImpl value,
          $Res Function(_$GetSalesProjectsByUserIdEventImpl) then) =
      __$$GetSalesProjectsByUserIdEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, int? page, int? pageSize});
}

/// @nodoc
class __$$GetSalesProjectsByUserIdEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$GetSalesProjectsByUserIdEventImpl>
    implements _$$GetSalesProjectsByUserIdEventImplCopyWith<$Res> {
  __$$GetSalesProjectsByUserIdEventImplCopyWithImpl(
      _$GetSalesProjectsByUserIdEventImpl _value,
      $Res Function(_$GetSalesProjectsByUserIdEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? page = freezed,
    Object? pageSize = freezed,
  }) {
    return _then(_$GetSalesProjectsByUserIdEventImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetSalesProjectsByUserIdEventImpl
    implements _GetSalesProjectsByUserIdEvent {
  const _$GetSalesProjectsByUserIdEventImpl(
      {required this.userId, this.page, this.pageSize});

  @override
  final String userId;
  @override
  final int? page;
  @override
  final int? pageSize;

  @override
  String toString() {
    return 'SalesEvent.getSalesProjectsByUserId(userId: $userId, page: $page, pageSize: $pageSize)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSalesProjectsByUserIdEventImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, page, pageSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSalesProjectsByUserIdEventImplCopyWith<
          _$GetSalesProjectsByUserIdEventImpl>
      get copyWith => __$$GetSalesProjectsByUserIdEventImplCopyWithImpl<
          _$GetSalesProjectsByUserIdEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return getSalesProjectsByUserId(userId, page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return getSalesProjectsByUserId?.call(userId, page, pageSize);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getSalesProjectsByUserId != null) {
      return getSalesProjectsByUserId(userId, page, pageSize);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return getSalesProjectsByUserId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return getSalesProjectsByUserId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getSalesProjectsByUserId != null) {
      return getSalesProjectsByUserId(this);
    }
    return orElse();
  }
}

abstract class _GetSalesProjectsByUserIdEvent implements SalesEvent {
  const factory _GetSalesProjectsByUserIdEvent(
      {required final String userId,
      final int? page,
      final int? pageSize}) = _$GetSalesProjectsByUserIdEventImpl;

  String get userId;
  int? get page;
  int? get pageSize;
  @JsonKey(ignore: true)
  _$$GetSalesProjectsByUserIdEventImplCopyWith<
          _$GetSalesProjectsByUserIdEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoadingImplCopyWith<$Res> {
  factory _$$IsLoadingImplCopyWith(
          _$IsLoadingImpl value, $Res Function(_$IsLoadingImpl) then) =
      __$$IsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsLoadingImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$IsLoadingImpl>
    implements _$$IsLoadingImplCopyWith<$Res> {
  __$$IsLoadingImplCopyWithImpl(
      _$IsLoadingImpl _value, $Res Function(_$IsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsLoadingImpl implements _IsLoading {
  const _$IsLoadingImpl();

  @override
  String toString() {
    return 'SalesEvent.isLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class _IsLoading implements SalesEvent {
  const factory _IsLoading() = _$IsLoadingImpl;
}

/// @nodoc
abstract class _$$UpdateSalesDetailsEventImplCopyWith<$Res> {
  factory _$$UpdateSalesDetailsEventImplCopyWith(
          _$UpdateSalesDetailsEventImpl value,
          $Res Function(_$UpdateSalesDetailsEventImpl) then) =
      __$$UpdateSalesDetailsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateSalesDataModel createSalesDataModel});
}

/// @nodoc
class __$$UpdateSalesDetailsEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$UpdateSalesDetailsEventImpl>
    implements _$$UpdateSalesDetailsEventImplCopyWith<$Res> {
  __$$UpdateSalesDetailsEventImplCopyWithImpl(
      _$UpdateSalesDetailsEventImpl _value,
      $Res Function(_$UpdateSalesDetailsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createSalesDataModel = null,
  }) {
    return _then(_$UpdateSalesDetailsEventImpl(
      createSalesDataModel: null == createSalesDataModel
          ? _value.createSalesDataModel
          : createSalesDataModel // ignore: cast_nullable_to_non_nullable
              as CreateSalesDataModel,
    ));
  }
}

/// @nodoc

class _$UpdateSalesDetailsEventImpl implements _UpdateSalesDetailsEvent {
  const _$UpdateSalesDetailsEventImpl({required this.createSalesDataModel});

  @override
  final CreateSalesDataModel createSalesDataModel;

  @override
  String toString() {
    return 'SalesEvent.updateSalesDetails(createSalesDataModel: $createSalesDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSalesDetailsEventImpl &&
            (identical(other.createSalesDataModel, createSalesDataModel) ||
                other.createSalesDataModel == createSalesDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createSalesDataModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSalesDetailsEventImplCopyWith<_$UpdateSalesDetailsEventImpl>
      get copyWith => __$$UpdateSalesDetailsEventImplCopyWithImpl<
          _$UpdateSalesDetailsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return updateSalesDetails(createSalesDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return updateSalesDetails?.call(createSalesDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (updateSalesDetails != null) {
      return updateSalesDetails(createSalesDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return updateSalesDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return updateSalesDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (updateSalesDetails != null) {
      return updateSalesDetails(this);
    }
    return orElse();
  }
}

abstract class _UpdateSalesDetailsEvent implements SalesEvent {
  const factory _UpdateSalesDetailsEvent(
          {required final CreateSalesDataModel createSalesDataModel}) =
      _$UpdateSalesDetailsEventImpl;

  CreateSalesDataModel get createSalesDataModel;
  @JsonKey(ignore: true)
  _$$UpdateSalesDetailsEventImplCopyWith<_$UpdateSalesDetailsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSalesMediaEventImplCopyWith<$Res> {
  factory _$$UpdateSalesMediaEventImplCopyWith(
          _$UpdateSalesMediaEventImpl value,
          $Res Function(_$UpdateSalesMediaEventImpl) then) =
      __$$UpdateSalesMediaEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateSalesDataModel createSalesDataModel});
}

/// @nodoc
class __$$UpdateSalesMediaEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$UpdateSalesMediaEventImpl>
    implements _$$UpdateSalesMediaEventImplCopyWith<$Res> {
  __$$UpdateSalesMediaEventImplCopyWithImpl(_$UpdateSalesMediaEventImpl _value,
      $Res Function(_$UpdateSalesMediaEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createSalesDataModel = null,
  }) {
    return _then(_$UpdateSalesMediaEventImpl(
      createSalesDataModel: null == createSalesDataModel
          ? _value.createSalesDataModel
          : createSalesDataModel // ignore: cast_nullable_to_non_nullable
              as CreateSalesDataModel,
    ));
  }
}

/// @nodoc

class _$UpdateSalesMediaEventImpl implements _UpdateSalesMediaEvent {
  const _$UpdateSalesMediaEventImpl({required this.createSalesDataModel});

  @override
  final CreateSalesDataModel createSalesDataModel;

  @override
  String toString() {
    return 'SalesEvent.updateSalesMedia(createSalesDataModel: $createSalesDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSalesMediaEventImpl &&
            (identical(other.createSalesDataModel, createSalesDataModel) ||
                other.createSalesDataModel == createSalesDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, createSalesDataModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSalesMediaEventImplCopyWith<_$UpdateSalesMediaEventImpl>
      get copyWith => __$$UpdateSalesMediaEventImplCopyWithImpl<
          _$UpdateSalesMediaEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return updateSalesMedia(createSalesDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return updateSalesMedia?.call(createSalesDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (updateSalesMedia != null) {
      return updateSalesMedia(createSalesDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return updateSalesMedia(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return updateSalesMedia?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (updateSalesMedia != null) {
      return updateSalesMedia(this);
    }
    return orElse();
  }
}

abstract class _UpdateSalesMediaEvent implements SalesEvent {
  const factory _UpdateSalesMediaEvent(
          {required final CreateSalesDataModel createSalesDataModel}) =
      _$UpdateSalesMediaEventImpl;

  CreateSalesDataModel get createSalesDataModel;
  @JsonKey(ignore: true)
  _$$UpdateSalesMediaEventImplCopyWith<_$UpdateSalesMediaEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateSalesProjectEventImplCopyWith<$Res> {
  factory _$$CreateSalesProjectEventImplCopyWith(
          _$CreateSalesProjectEventImpl value,
          $Res Function(_$CreateSalesProjectEventImpl) then) =
      __$$CreateSalesProjectEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String propertyType,
      String projectName,
      String? rera,
      num area,
      String areaUnit,
      int? noOfUnits,
      int? noOfFloors,
      String? description,
      String? specifications,
      String? address,
      String? city,
      String? state,
      String? location,
      double? latitude,
      double? longitude,
      String? publicFacilities,
      num? minPrice,
      num? maxPrice,
      String? saleSpecification,
      String? possessionDate,
      List<String>? images,
      File? brochure});
}

/// @nodoc
class __$$CreateSalesProjectEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$CreateSalesProjectEventImpl>
    implements _$$CreateSalesProjectEventImplCopyWith<$Res> {
  __$$CreateSalesProjectEventImplCopyWithImpl(
      _$CreateSalesProjectEventImpl _value,
      $Res Function(_$CreateSalesProjectEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? propertyType = null,
    Object? projectName = null,
    Object? rera = freezed,
    Object? area = null,
    Object? areaUnit = null,
    Object? noOfUnits = freezed,
    Object? noOfFloors = freezed,
    Object? description = freezed,
    Object? specifications = freezed,
    Object? address = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? location = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? publicFacilities = freezed,
    Object? minPrice = freezed,
    Object? maxPrice = freezed,
    Object? saleSpecification = freezed,
    Object? possessionDate = freezed,
    Object? images = freezed,
    Object? brochure = freezed,
  }) {
    return _then(_$CreateSalesProjectEventImpl(
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String,
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      rera: freezed == rera
          ? _value.rera
          : rera // ignore: cast_nullable_to_non_nullable
              as String?,
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as num,
      areaUnit: null == areaUnit
          ? _value.areaUnit
          : areaUnit // ignore: cast_nullable_to_non_nullable
              as String,
      noOfUnits: freezed == noOfUnits
          ? _value.noOfUnits
          : noOfUnits // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfFloors: freezed == noOfFloors
          ? _value.noOfFloors
          : noOfFloors // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      specifications: freezed == specifications
          ? _value.specifications
          : specifications // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      publicFacilities: freezed == publicFacilities
          ? _value.publicFacilities
          : publicFacilities // ignore: cast_nullable_to_non_nullable
              as String?,
      minPrice: freezed == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      maxPrice: freezed == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as num?,
      saleSpecification: freezed == saleSpecification
          ? _value.saleSpecification
          : saleSpecification // ignore: cast_nullable_to_non_nullable
              as String?,
      possessionDate: freezed == possessionDate
          ? _value.possessionDate
          : possessionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      brochure: freezed == brochure
          ? _value.brochure
          : brochure // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$CreateSalesProjectEventImpl implements _CreateSalesProjectEvent {
  const _$CreateSalesProjectEventImpl(
      {required this.propertyType,
      required this.projectName,
      this.rera,
      required this.area,
      required this.areaUnit,
      this.noOfUnits,
      this.noOfFloors,
      this.description,
      this.specifications,
      this.address,
      this.city,
      this.state,
      this.location,
      this.latitude,
      this.longitude,
      this.publicFacilities,
      this.minPrice,
      this.maxPrice,
      this.saleSpecification,
      this.possessionDate,
      final List<String>? images,
      this.brochure})
      : _images = images;

  @override
  final String propertyType;
  @override
  final String projectName;
  @override
  final String? rera;
  @override
  final num area;
  @override
  final String areaUnit;
  @override
  final int? noOfUnits;
  @override
  final int? noOfFloors;
  @override
  final String? description;
  @override
  final String? specifications;
  @override
  final String? address;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? location;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final String? publicFacilities;
  @override
  final num? minPrice;
  @override
  final num? maxPrice;
  @override
  final String? saleSpecification;
  @override
  final String? possessionDate;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final File? brochure;

  @override
  String toString() {
    return 'SalesEvent.createSalesProject(propertyType: $propertyType, projectName: $projectName, rera: $rera, area: $area, areaUnit: $areaUnit, noOfUnits: $noOfUnits, noOfFloors: $noOfFloors, description: $description, specifications: $specifications, address: $address, city: $city, state: $state, location: $location, latitude: $latitude, longitude: $longitude, publicFacilities: $publicFacilities, minPrice: $minPrice, maxPrice: $maxPrice, saleSpecification: $saleSpecification, possessionDate: $possessionDate, images: $images, brochure: $brochure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateSalesProjectEventImpl &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.rera, rera) || other.rera == rera) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.areaUnit, areaUnit) ||
                other.areaUnit == areaUnit) &&
            (identical(other.noOfUnits, noOfUnits) ||
                other.noOfUnits == noOfUnits) &&
            (identical(other.noOfFloors, noOfFloors) ||
                other.noOfFloors == noOfFloors) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.specifications, specifications) ||
                other.specifications == specifications) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.publicFacilities, publicFacilities) ||
                other.publicFacilities == publicFacilities) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.saleSpecification, saleSpecification) ||
                other.saleSpecification == saleSpecification) &&
            (identical(other.possessionDate, possessionDate) ||
                other.possessionDate == possessionDate) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.brochure, brochure) ||
                other.brochure == brochure));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        propertyType,
        projectName,
        rera,
        area,
        areaUnit,
        noOfUnits,
        noOfFloors,
        description,
        specifications,
        address,
        city,
        state,
        location,
        latitude,
        longitude,
        publicFacilities,
        minPrice,
        maxPrice,
        saleSpecification,
        possessionDate,
        const DeepCollectionEquality().hash(_images),
        brochure
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateSalesProjectEventImplCopyWith<_$CreateSalesProjectEventImpl>
      get copyWith => __$$CreateSalesProjectEventImplCopyWithImpl<
          _$CreateSalesProjectEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return createSalesProject(
        propertyType,
        projectName,
        rera,
        area,
        areaUnit,
        noOfUnits,
        noOfFloors,
        description,
        specifications,
        address,
        city,
        state,
        location,
        latitude,
        longitude,
        publicFacilities,
        minPrice,
        maxPrice,
        saleSpecification,
        possessionDate,
        images,
        brochure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return createSalesProject?.call(
        propertyType,
        projectName,
        rera,
        area,
        areaUnit,
        noOfUnits,
        noOfFloors,
        description,
        specifications,
        address,
        city,
        state,
        location,
        latitude,
        longitude,
        publicFacilities,
        minPrice,
        maxPrice,
        saleSpecification,
        possessionDate,
        images,
        brochure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (createSalesProject != null) {
      return createSalesProject(
          propertyType,
          projectName,
          rera,
          area,
          areaUnit,
          noOfUnits,
          noOfFloors,
          description,
          specifications,
          address,
          city,
          state,
          location,
          latitude,
          longitude,
          publicFacilities,
          minPrice,
          maxPrice,
          saleSpecification,
          possessionDate,
          images,
          brochure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return createSalesProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return createSalesProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (createSalesProject != null) {
      return createSalesProject(this);
    }
    return orElse();
  }
}

abstract class _CreateSalesProjectEvent implements SalesEvent {
  const factory _CreateSalesProjectEvent(
      {required final String propertyType,
      required final String projectName,
      final String? rera,
      required final num area,
      required final String areaUnit,
      final int? noOfUnits,
      final int? noOfFloors,
      final String? description,
      final String? specifications,
      final String? address,
      final String? city,
      final String? state,
      final String? location,
      final double? latitude,
      final double? longitude,
      final String? publicFacilities,
      final num? minPrice,
      final num? maxPrice,
      final String? saleSpecification,
      final String? possessionDate,
      final List<String>? images,
      final File? brochure}) = _$CreateSalesProjectEventImpl;

  String get propertyType;
  String get projectName;
  String? get rera;
  num get area;
  String get areaUnit;
  int? get noOfUnits;
  int? get noOfFloors;
  String? get description;
  String? get specifications;
  String? get address;
  String? get city;
  String? get state;
  String? get location;
  double? get latitude;
  double? get longitude;
  String? get publicFacilities;
  num? get minPrice;
  num? get maxPrice;
  String? get saleSpecification;
  String? get possessionDate;
  List<String>? get images;
  File? get brochure;
  @JsonKey(ignore: true)
  _$$CreateSalesProjectEventImplCopyWith<_$CreateSalesProjectEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RequestCallbackEventImplCopyWith<$Res> {
  factory _$$RequestCallbackEventImplCopyWith(_$RequestCallbackEventImpl value,
          $Res Function(_$RequestCallbackEventImpl) then) =
      __$$RequestCallbackEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String salesProjectId});
}

/// @nodoc
class __$$RequestCallbackEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$RequestCallbackEventImpl>
    implements _$$RequestCallbackEventImplCopyWith<$Res> {
  __$$RequestCallbackEventImplCopyWithImpl(_$RequestCallbackEventImpl _value,
      $Res Function(_$RequestCallbackEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesProjectId = null,
  }) {
    return _then(_$RequestCallbackEventImpl(
      salesProjectId: null == salesProjectId
          ? _value.salesProjectId
          : salesProjectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RequestCallbackEventImpl implements _RequestCallbackEvent {
  const _$RequestCallbackEventImpl({required this.salesProjectId});

  @override
  final String salesProjectId;

  @override
  String toString() {
    return 'SalesEvent.requestCallback(salesProjectId: $salesProjectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestCallbackEventImpl &&
            (identical(other.salesProjectId, salesProjectId) ||
                other.salesProjectId == salesProjectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesProjectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestCallbackEventImplCopyWith<_$RequestCallbackEventImpl>
      get copyWith =>
          __$$RequestCallbackEventImplCopyWithImpl<_$RequestCallbackEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return requestCallback(salesProjectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return requestCallback?.call(salesProjectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (requestCallback != null) {
      return requestCallback(salesProjectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return requestCallback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return requestCallback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (requestCallback != null) {
      return requestCallback(this);
    }
    return orElse();
  }
}

abstract class _RequestCallbackEvent implements SalesEvent {
  const factory _RequestCallbackEvent({required final String salesProjectId}) =
      _$RequestCallbackEventImpl;

  String get salesProjectId;
  @JsonKey(ignore: true)
  _$$RequestCallbackEventImplCopyWith<_$RequestCallbackEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProjectUnitsEventImplCopyWith<$Res> {
  factory _$$GetProjectUnitsEventImplCopyWith(_$GetProjectUnitsEventImpl value,
          $Res Function(_$GetProjectUnitsEventImpl) then) =
      __$$GetProjectUnitsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$GetProjectUnitsEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$GetProjectUnitsEventImpl>
    implements _$$GetProjectUnitsEventImplCopyWith<$Res> {
  __$$GetProjectUnitsEventImplCopyWithImpl(_$GetProjectUnitsEventImpl _value,
      $Res Function(_$GetProjectUnitsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$GetProjectUnitsEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProjectUnitsEventImpl implements _GetProjectUnitsEvent {
  const _$GetProjectUnitsEventImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString() {
    return 'SalesEvent.getProjectUnits(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectUnitsEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectUnitsEventImplCopyWith<_$GetProjectUnitsEventImpl>
      get copyWith =>
          __$$GetProjectUnitsEventImplCopyWithImpl<_$GetProjectUnitsEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return getProjectUnits(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return getProjectUnits?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getProjectUnits != null) {
      return getProjectUnits(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return getProjectUnits(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return getProjectUnits?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getProjectUnits != null) {
      return getProjectUnits(this);
    }
    return orElse();
  }
}

abstract class _GetProjectUnitsEvent implements SalesEvent {
  const factory _GetProjectUnitsEvent({required final String projectId}) =
      _$GetProjectUnitsEventImpl;

  String get projectId;
  @JsonKey(ignore: true)
  _$$GetProjectUnitsEventImplCopyWith<_$GetProjectUnitsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddProjectUnitEventImplCopyWith<$Res> {
  factory _$$AddProjectUnitEventImplCopyWith(_$AddProjectUnitEventImpl value,
          $Res Function(_$AddProjectUnitEventImpl) then) =
      __$$AddProjectUnitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId, Map<String, dynamic> data});
}

/// @nodoc
class __$$AddProjectUnitEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$AddProjectUnitEventImpl>
    implements _$$AddProjectUnitEventImplCopyWith<$Res> {
  __$$AddProjectUnitEventImplCopyWithImpl(_$AddProjectUnitEventImpl _value,
      $Res Function(_$AddProjectUnitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? data = null,
  }) {
    return _then(_$AddProjectUnitEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$AddProjectUnitEventImpl implements _AddProjectUnitEvent {
  const _$AddProjectUnitEventImpl(
      {required this.projectId, required final Map<String, dynamic> data})
      : _data = data;

  @override
  final String projectId;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SalesEvent.addProjectUnit(projectId: $projectId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddProjectUnitEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, projectId, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddProjectUnitEventImplCopyWith<_$AddProjectUnitEventImpl> get copyWith =>
      __$$AddProjectUnitEventImplCopyWithImpl<_$AddProjectUnitEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return addProjectUnit(projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return addProjectUnit?.call(projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (addProjectUnit != null) {
      return addProjectUnit(projectId, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return addProjectUnit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return addProjectUnit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (addProjectUnit != null) {
      return addProjectUnit(this);
    }
    return orElse();
  }
}

abstract class _AddProjectUnitEvent implements SalesEvent {
  const factory _AddProjectUnitEvent(
      {required final String projectId,
      required final Map<String, dynamic> data}) = _$AddProjectUnitEventImpl;

  String get projectId;
  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$AddProjectUnitEventImplCopyWith<_$AddProjectUnitEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditProjectUnitEventImplCopyWith<$Res> {
  factory _$$EditProjectUnitEventImplCopyWith(_$EditProjectUnitEventImpl value,
          $Res Function(_$EditProjectUnitEventImpl) then) =
      __$$EditProjectUnitEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String unitId, String projectId, Map<String, dynamic> data});
}

/// @nodoc
class __$$EditProjectUnitEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$EditProjectUnitEventImpl>
    implements _$$EditProjectUnitEventImplCopyWith<$Res> {
  __$$EditProjectUnitEventImplCopyWithImpl(_$EditProjectUnitEventImpl _value,
      $Res Function(_$EditProjectUnitEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unitId = null,
    Object? projectId = null,
    Object? data = null,
  }) {
    return _then(_$EditProjectUnitEventImpl(
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$EditProjectUnitEventImpl implements _EditProjectUnitEvent {
  const _$EditProjectUnitEventImpl(
      {required this.unitId,
      required this.projectId,
      required final Map<String, dynamic> data})
      : _data = data;

  @override
  final String unitId;
  @override
  final String projectId;
  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SalesEvent.editProjectUnit(unitId: $unitId, projectId: $projectId, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProjectUnitEventImpl &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unitId, projectId,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProjectUnitEventImplCopyWith<_$EditProjectUnitEventImpl>
      get copyWith =>
          __$$EditProjectUnitEventImplCopyWithImpl<_$EditProjectUnitEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return editProjectUnit(unitId, projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return editProjectUnit?.call(unitId, projectId, data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (editProjectUnit != null) {
      return editProjectUnit(unitId, projectId, data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return editProjectUnit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return editProjectUnit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (editProjectUnit != null) {
      return editProjectUnit(this);
    }
    return orElse();
  }
}

abstract class _EditProjectUnitEvent implements SalesEvent {
  const factory _EditProjectUnitEvent(
      {required final String unitId,
      required final String projectId,
      required final Map<String, dynamic> data}) = _$EditProjectUnitEventImpl;

  String get unitId;
  String get projectId;
  Map<String, dynamic> get data;
  @JsonKey(ignore: true)
  _$$EditProjectUnitEventImplCopyWith<_$EditProjectUnitEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetProjectCallbacksEventImplCopyWith<$Res> {
  factory _$$GetProjectCallbacksEventImplCopyWith(
          _$GetProjectCallbacksEventImpl value,
          $Res Function(_$GetProjectCallbacksEventImpl) then) =
      __$$GetProjectCallbacksEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$GetProjectCallbacksEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$GetProjectCallbacksEventImpl>
    implements _$$GetProjectCallbacksEventImplCopyWith<$Res> {
  __$$GetProjectCallbacksEventImplCopyWithImpl(
      _$GetProjectCallbacksEventImpl _value,
      $Res Function(_$GetProjectCallbacksEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$GetProjectCallbacksEventImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProjectCallbacksEventImpl implements _GetProjectCallbacksEvent {
  const _$GetProjectCallbacksEventImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString() {
    return 'SalesEvent.getProjectCallbacks(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectCallbacksEventImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectCallbacksEventImplCopyWith<_$GetProjectCallbacksEventImpl>
      get copyWith => __$$GetProjectCallbacksEventImplCopyWithImpl<
          _$GetProjectCallbacksEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return getProjectCallbacks(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return getProjectCallbacks?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getProjectCallbacks != null) {
      return getProjectCallbacks(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return getProjectCallbacks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return getProjectCallbacks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (getProjectCallbacks != null) {
      return getProjectCallbacks(this);
    }
    return orElse();
  }
}

abstract class _GetProjectCallbacksEvent implements SalesEvent {
  const factory _GetProjectCallbacksEvent({required final String projectId}) =
      _$GetProjectCallbacksEventImpl;

  String get projectId;
  @JsonKey(ignore: true)
  _$$GetProjectCallbacksEventImplCopyWith<_$GetProjectCallbacksEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCallbackEventImplCopyWith<$Res> {
  factory _$$DeleteCallbackEventImplCopyWith(_$DeleteCallbackEventImpl value,
          $Res Function(_$DeleteCallbackEventImpl) then) =
      __$$DeleteCallbackEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String callbackId, String projectId});
}

/// @nodoc
class __$$DeleteCallbackEventImplCopyWithImpl<$Res>
    extends _$SalesEventCopyWithImpl<$Res, _$DeleteCallbackEventImpl>
    implements _$$DeleteCallbackEventImplCopyWith<$Res> {
  __$$DeleteCallbackEventImplCopyWithImpl(_$DeleteCallbackEventImpl _value,
      $Res Function(_$DeleteCallbackEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callbackId = null,
    Object? projectId = null,
  }) {
    return _then(_$DeleteCallbackEventImpl(
      callbackId: null == callbackId
          ? _value.callbackId
          : callbackId // ignore: cast_nullable_to_non_nullable
              as String,
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteCallbackEventImpl implements _DeleteCallbackEvent {
  const _$DeleteCallbackEventImpl(
      {required this.callbackId, required this.projectId});

  @override
  final String callbackId;
  @override
  final String projectId;

  @override
  String toString() {
    return 'SalesEvent.deleteCallback(callbackId: $callbackId, projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCallbackEventImpl &&
            (identical(other.callbackId, callbackId) ||
                other.callbackId == callbackId) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callbackId, projectId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCallbackEventImplCopyWith<_$DeleteCallbackEventImpl> get copyWith =>
      __$$DeleteCallbackEventImplCopyWithImpl<_$DeleteCallbackEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() reset,
    required TResult Function(
            String? location,
            String? propertyType,
            double? minPrice,
            double? maxPrice,
            String? search,
            int? limit,
            int? offset)
        getSalesEvent,
    required TResult Function(String projectId) getSaleDetailsEvent,
    required TResult Function(String userId, int? page, int? pageSize)
        getSalesProjectsByUserId,
    required TResult Function() isLoading,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesDetails,
    required TResult Function(CreateSalesDataModel createSalesDataModel)
        updateSalesMedia,
    required TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)
        createSalesProject,
    required TResult Function(String salesProjectId) requestCallback,
    required TResult Function(String projectId) getProjectUnits,
    required TResult Function(String projectId, Map<String, dynamic> data)
        addProjectUnit,
    required TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)
        editProjectUnit,
    required TResult Function(String projectId) getProjectCallbacks,
    required TResult Function(String callbackId, String projectId)
        deleteCallback,
  }) {
    return deleteCallback(callbackId, projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? reset,
    TResult? Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult? Function(String projectId)? getSaleDetailsEvent,
    TResult? Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult? Function()? isLoading,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult? Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult? Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult? Function(String salesProjectId)? requestCallback,
    TResult? Function(String projectId)? getProjectUnits,
    TResult? Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult? Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult? Function(String projectId)? getProjectCallbacks,
    TResult? Function(String callbackId, String projectId)? deleteCallback,
  }) {
    return deleteCallback?.call(callbackId, projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? reset,
    TResult Function(String? location, String? propertyType, double? minPrice,
            double? maxPrice, String? search, int? limit, int? offset)?
        getSalesEvent,
    TResult Function(String projectId)? getSaleDetailsEvent,
    TResult Function(String userId, int? page, int? pageSize)?
        getSalesProjectsByUserId,
    TResult Function()? isLoading,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesDetails,
    TResult Function(CreateSalesDataModel createSalesDataModel)?
        updateSalesMedia,
    TResult Function(
            String propertyType,
            String projectName,
            String? rera,
            num area,
            String areaUnit,
            int? noOfUnits,
            int? noOfFloors,
            String? description,
            String? specifications,
            String? address,
            String? city,
            String? state,
            String? location,
            double? latitude,
            double? longitude,
            String? publicFacilities,
            num? minPrice,
            num? maxPrice,
            String? saleSpecification,
            String? possessionDate,
            List<String>? images,
            File? brochure)?
        createSalesProject,
    TResult Function(String salesProjectId)? requestCallback,
    TResult Function(String projectId)? getProjectUnits,
    TResult Function(String projectId, Map<String, dynamic> data)?
        addProjectUnit,
    TResult Function(
            String unitId, String projectId, Map<String, dynamic> data)?
        editProjectUnit,
    TResult Function(String projectId)? getProjectCallbacks,
    TResult Function(String callbackId, String projectId)? deleteCallback,
    required TResult orElse(),
  }) {
    if (deleteCallback != null) {
      return deleteCallback(callbackId, projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Reset value) reset,
    required TResult Function(_GetSalesEvent value) getSalesEvent,
    required TResult Function(_GetSaleDetailsEvent value) getSaleDetailsEvent,
    required TResult Function(_GetSalesProjectsByUserIdEvent value)
        getSalesProjectsByUserId,
    required TResult Function(_IsLoading value) isLoading,
    required TResult Function(_UpdateSalesDetailsEvent value)
        updateSalesDetails,
    required TResult Function(_UpdateSalesMediaEvent value) updateSalesMedia,
    required TResult Function(_CreateSalesProjectEvent value)
        createSalesProject,
    required TResult Function(_RequestCallbackEvent value) requestCallback,
    required TResult Function(_GetProjectUnitsEvent value) getProjectUnits,
    required TResult Function(_AddProjectUnitEvent value) addProjectUnit,
    required TResult Function(_EditProjectUnitEvent value) editProjectUnit,
    required TResult Function(_GetProjectCallbacksEvent value)
        getProjectCallbacks,
    required TResult Function(_DeleteCallbackEvent value) deleteCallback,
  }) {
    return deleteCallback(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Reset value)? reset,
    TResult? Function(_GetSalesEvent value)? getSalesEvent,
    TResult? Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult? Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult? Function(_IsLoading value)? isLoading,
    TResult? Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult? Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult? Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult? Function(_RequestCallbackEvent value)? requestCallback,
    TResult? Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult? Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult? Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult? Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult? Function(_DeleteCallbackEvent value)? deleteCallback,
  }) {
    return deleteCallback?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Reset value)? reset,
    TResult Function(_GetSalesEvent value)? getSalesEvent,
    TResult Function(_GetSaleDetailsEvent value)? getSaleDetailsEvent,
    TResult Function(_GetSalesProjectsByUserIdEvent value)?
        getSalesProjectsByUserId,
    TResult Function(_IsLoading value)? isLoading,
    TResult Function(_UpdateSalesDetailsEvent value)? updateSalesDetails,
    TResult Function(_UpdateSalesMediaEvent value)? updateSalesMedia,
    TResult Function(_CreateSalesProjectEvent value)? createSalesProject,
    TResult Function(_RequestCallbackEvent value)? requestCallback,
    TResult Function(_GetProjectUnitsEvent value)? getProjectUnits,
    TResult Function(_AddProjectUnitEvent value)? addProjectUnit,
    TResult Function(_EditProjectUnitEvent value)? editProjectUnit,
    TResult Function(_GetProjectCallbacksEvent value)? getProjectCallbacks,
    TResult Function(_DeleteCallbackEvent value)? deleteCallback,
    required TResult orElse(),
  }) {
    if (deleteCallback != null) {
      return deleteCallback(this);
    }
    return orElse();
  }
}

abstract class _DeleteCallbackEvent implements SalesEvent {
  const factory _DeleteCallbackEvent(
      {required final String callbackId,
      required final String projectId}) = _$DeleteCallbackEventImpl;

  String get callbackId;
  String get projectId;
  @JsonKey(ignore: true)
  _$$DeleteCallbackEventImplCopyWith<_$DeleteCallbackEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  SalesModel? get salesList => throw _privateConstructorUsedError;
  SaleRecord? get saleRecord => throw _privateConstructorUsedError;
  SalesModel? get userSalesProjects => throw _privateConstructorUsedError;
  int get currentOffset => throw _privateConstructorUsedError;
  bool get hasMoreData => throw _privateConstructorUsedError;
  CreateSalesDataModel? get createSalesDataModel =>
      throw _privateConstructorUsedError;
  SalesUnitResponseModel? get projectUnits =>
      throw _privateConstructorUsedError;
  List<CallbackRequestModel> get projectCallbacks =>
      throw _privateConstructorUsedError;
  bool get callbacksLoading => throw _privateConstructorUsedError;
  NotifyStatus? get notifyStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SalesStateCopyWith<SalesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesStateCopyWith<$Res> {
  factory $SalesStateCopyWith(
          SalesState value, $Res Function(SalesState) then) =
      _$SalesStateCopyWithImpl<$Res, SalesState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      SalesModel? salesList,
      SaleRecord? saleRecord,
      SalesModel? userSalesProjects,
      int currentOffset,
      bool hasMoreData,
      CreateSalesDataModel? createSalesDataModel,
      SalesUnitResponseModel? projectUnits,
      List<CallbackRequestModel> projectCallbacks,
      bool callbacksLoading,
      NotifyStatus? notifyStatus});

  $SalesModelCopyWith<$Res>? get salesList;
  $SaleRecordCopyWith<$Res>? get saleRecord;
  $SalesModelCopyWith<$Res>? get userSalesProjects;
}

/// @nodoc
class _$SalesStateCopyWithImpl<$Res, $Val extends SalesState>
    implements $SalesStateCopyWith<$Res> {
  _$SalesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? salesList = freezed,
    Object? saleRecord = freezed,
    Object? userSalesProjects = freezed,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? createSalesDataModel = freezed,
    Object? projectUnits = freezed,
    Object? projectCallbacks = null,
    Object? callbacksLoading = null,
    Object? notifyStatus = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      salesList: freezed == salesList
          ? _value.salesList
          : salesList // ignore: cast_nullable_to_non_nullable
              as SalesModel?,
      saleRecord: freezed == saleRecord
          ? _value.saleRecord
          : saleRecord // ignore: cast_nullable_to_non_nullable
              as SaleRecord?,
      userSalesProjects: freezed == userSalesProjects
          ? _value.userSalesProjects
          : userSalesProjects // ignore: cast_nullable_to_non_nullable
              as SalesModel?,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      createSalesDataModel: freezed == createSalesDataModel
          ? _value.createSalesDataModel
          : createSalesDataModel // ignore: cast_nullable_to_non_nullable
              as CreateSalesDataModel?,
      projectUnits: freezed == projectUnits
          ? _value.projectUnits
          : projectUnits // ignore: cast_nullable_to_non_nullable
              as SalesUnitResponseModel?,
      projectCallbacks: null == projectCallbacks
          ? _value.projectCallbacks
          : projectCallbacks // ignore: cast_nullable_to_non_nullable
              as List<CallbackRequestModel>,
      callbacksLoading: null == callbacksLoading
          ? _value.callbacksLoading
          : callbacksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesModelCopyWith<$Res>? get salesList {
    if (_value.salesList == null) {
      return null;
    }

    return $SalesModelCopyWith<$Res>(_value.salesList!, (value) {
      return _then(_value.copyWith(salesList: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SaleRecordCopyWith<$Res>? get saleRecord {
    if (_value.saleRecord == null) {
      return null;
    }

    return $SaleRecordCopyWith<$Res>(_value.saleRecord!, (value) {
      return _then(_value.copyWith(saleRecord: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SalesModelCopyWith<$Res>? get userSalesProjects {
    if (_value.userSalesProjects == null) {
      return null;
    }

    return $SalesModelCopyWith<$Res>(_value.userSalesProjects!, (value) {
      return _then(_value.copyWith(userSalesProjects: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesStateImplCopyWith<$Res>
    implements $SalesStateCopyWith<$Res> {
  factory _$$SalesStateImplCopyWith(
          _$SalesStateImpl value, $Res Function(_$SalesStateImpl) then) =
      __$$SalesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      bool isSuccess,
      SalesModel? salesList,
      SaleRecord? saleRecord,
      SalesModel? userSalesProjects,
      int currentOffset,
      bool hasMoreData,
      CreateSalesDataModel? createSalesDataModel,
      SalesUnitResponseModel? projectUnits,
      List<CallbackRequestModel> projectCallbacks,
      bool callbacksLoading,
      NotifyStatus? notifyStatus});

  @override
  $SalesModelCopyWith<$Res>? get salesList;
  @override
  $SaleRecordCopyWith<$Res>? get saleRecord;
  @override
  $SalesModelCopyWith<$Res>? get userSalesProjects;
}

/// @nodoc
class __$$SalesStateImplCopyWithImpl<$Res>
    extends _$SalesStateCopyWithImpl<$Res, _$SalesStateImpl>
    implements _$$SalesStateImplCopyWith<$Res> {
  __$$SalesStateImplCopyWithImpl(
      _$SalesStateImpl _value, $Res Function(_$SalesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? isSuccess = null,
    Object? salesList = freezed,
    Object? saleRecord = freezed,
    Object? userSalesProjects = freezed,
    Object? currentOffset = null,
    Object? hasMoreData = null,
    Object? createSalesDataModel = freezed,
    Object? projectUnits = freezed,
    Object? projectCallbacks = null,
    Object? callbacksLoading = null,
    Object? notifyStatus = freezed,
  }) {
    return _then(_$SalesStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      salesList: freezed == salesList
          ? _value.salesList
          : salesList // ignore: cast_nullable_to_non_nullable
              as SalesModel?,
      saleRecord: freezed == saleRecord
          ? _value.saleRecord
          : saleRecord // ignore: cast_nullable_to_non_nullable
              as SaleRecord?,
      userSalesProjects: freezed == userSalesProjects
          ? _value.userSalesProjects
          : userSalesProjects // ignore: cast_nullable_to_non_nullable
              as SalesModel?,
      currentOffset: null == currentOffset
          ? _value.currentOffset
          : currentOffset // ignore: cast_nullable_to_non_nullable
              as int,
      hasMoreData: null == hasMoreData
          ? _value.hasMoreData
          : hasMoreData // ignore: cast_nullable_to_non_nullable
              as bool,
      createSalesDataModel: freezed == createSalesDataModel
          ? _value.createSalesDataModel
          : createSalesDataModel // ignore: cast_nullable_to_non_nullable
              as CreateSalesDataModel?,
      projectUnits: freezed == projectUnits
          ? _value.projectUnits
          : projectUnits // ignore: cast_nullable_to_non_nullable
              as SalesUnitResponseModel?,
      projectCallbacks: null == projectCallbacks
          ? _value._projectCallbacks
          : projectCallbacks // ignore: cast_nullable_to_non_nullable
              as List<CallbackRequestModel>,
      callbacksLoading: null == callbacksLoading
          ? _value.callbacksLoading
          : callbacksLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifyStatus: freezed == notifyStatus
          ? _value.notifyStatus
          : notifyStatus // ignore: cast_nullable_to_non_nullable
              as NotifyStatus?,
    ));
  }
}

/// @nodoc

class _$SalesStateImpl implements _SalesState {
  const _$SalesStateImpl(
      {this.isLoading = false,
      this.isError = false,
      this.isSuccess = false,
      this.salesList,
      this.saleRecord,
      this.userSalesProjects,
      this.currentOffset = 0,
      this.hasMoreData = false,
      this.createSalesDataModel,
      this.projectUnits,
      final List<CallbackRequestModel> projectCallbacks = const [],
      this.callbacksLoading = false,
      this.notifyStatus})
      : _projectCallbacks = projectCallbacks;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isError;
  @override
  @JsonKey()
  final bool isSuccess;
  @override
  final SalesModel? salesList;
  @override
  final SaleRecord? saleRecord;
  @override
  final SalesModel? userSalesProjects;
  @override
  @JsonKey()
  final int currentOffset;
  @override
  @JsonKey()
  final bool hasMoreData;
  @override
  final CreateSalesDataModel? createSalesDataModel;
  @override
  final SalesUnitResponseModel? projectUnits;
  final List<CallbackRequestModel> _projectCallbacks;
  @override
  @JsonKey()
  List<CallbackRequestModel> get projectCallbacks {
    if (_projectCallbacks is EqualUnmodifiableListView)
      return _projectCallbacks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projectCallbacks);
  }

  @override
  @JsonKey()
  final bool callbacksLoading;
  @override
  final NotifyStatus? notifyStatus;

  @override
  String toString() {
    return 'SalesState(isLoading: $isLoading, isError: $isError, isSuccess: $isSuccess, salesList: $salesList, saleRecord: $saleRecord, userSalesProjects: $userSalesProjects, currentOffset: $currentOffset, hasMoreData: $hasMoreData, createSalesDataModel: $createSalesDataModel, projectUnits: $projectUnits, projectCallbacks: $projectCallbacks, callbacksLoading: $callbacksLoading, notifyStatus: $notifyStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.salesList, salesList) ||
                other.salesList == salesList) &&
            (identical(other.saleRecord, saleRecord) ||
                other.saleRecord == saleRecord) &&
            (identical(other.userSalesProjects, userSalesProjects) ||
                other.userSalesProjects == userSalesProjects) &&
            (identical(other.currentOffset, currentOffset) ||
                other.currentOffset == currentOffset) &&
            (identical(other.hasMoreData, hasMoreData) ||
                other.hasMoreData == hasMoreData) &&
            (identical(other.createSalesDataModel, createSalesDataModel) ||
                other.createSalesDataModel == createSalesDataModel) &&
            (identical(other.projectUnits, projectUnits) ||
                other.projectUnits == projectUnits) &&
            const DeepCollectionEquality()
                .equals(other._projectCallbacks, _projectCallbacks) &&
            (identical(other.callbacksLoading, callbacksLoading) ||
                other.callbacksLoading == callbacksLoading) &&
            (identical(other.notifyStatus, notifyStatus) ||
                other.notifyStatus == notifyStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      isError,
      isSuccess,
      salesList,
      saleRecord,
      userSalesProjects,
      currentOffset,
      hasMoreData,
      createSalesDataModel,
      projectUnits,
      const DeepCollectionEquality().hash(_projectCallbacks),
      callbacksLoading,
      notifyStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesStateImplCopyWith<_$SalesStateImpl> get copyWith =>
      __$$SalesStateImplCopyWithImpl<_$SalesStateImpl>(this, _$identity);
}

abstract class _SalesState implements SalesState {
  const factory _SalesState(
      {final bool isLoading,
      final bool isError,
      final bool isSuccess,
      final SalesModel? salesList,
      final SaleRecord? saleRecord,
      final SalesModel? userSalesProjects,
      final int currentOffset,
      final bool hasMoreData,
      final CreateSalesDataModel? createSalesDataModel,
      final SalesUnitResponseModel? projectUnits,
      final List<CallbackRequestModel> projectCallbacks,
      final bool callbacksLoading,
      final NotifyStatus? notifyStatus}) = _$SalesStateImpl;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  bool get isSuccess;
  @override
  SalesModel? get salesList;
  @override
  SaleRecord? get saleRecord;
  @override
  SalesModel? get userSalesProjects;
  @override
  int get currentOffset;
  @override
  bool get hasMoreData;
  @override
  CreateSalesDataModel? get createSalesDataModel;
  @override
  SalesUnitResponseModel? get projectUnits;
  @override
  List<CallbackRequestModel> get projectCallbacks;
  @override
  bool get callbacksLoading;
  @override
  NotifyStatus? get notifyStatus;
  @override
  @JsonKey(ignore: true)
  _$$SalesStateImplCopyWith<_$SalesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
