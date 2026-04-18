// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'company_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CompanyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyEventCopyWith<$Res> {
  factory $CompanyEventCopyWith(
          CompanyEvent value, $Res Function(CompanyEvent) then) =
      _$CompanyEventCopyWithImpl<$Res, CompanyEvent>;
}

/// @nodoc
class _$CompanyEventCopyWithImpl<$Res, $Val extends CompanyEvent>
    implements $CompanyEventCopyWith<$Res> {
  _$CompanyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CompanyStartedImplCopyWith<$Res> {
  factory _$$CompanyStartedImplCopyWith(_$CompanyStartedImpl value,
          $Res Function(_$CompanyStartedImpl) then) =
      __$$CompanyStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompanyStartedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$CompanyStartedImpl>
    implements _$$CompanyStartedImplCopyWith<$Res> {
  __$$CompanyStartedImplCopyWithImpl(
      _$CompanyStartedImpl _value, $Res Function(_$CompanyStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompanyStartedImpl implements _CompanyStarted {
  const _$CompanyStartedImpl();

  @override
  String toString() {
    return 'CompanyEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompanyStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _CompanyStarted implements CompanyEvent {
  const factory _CompanyStarted() = _$CompanyStartedImpl;
}

/// @nodoc
abstract class _$$ResetStateImplCopyWith<$Res> {
  factory _$$ResetStateImplCopyWith(
          _$ResetStateImpl value, $Res Function(_$ResetStateImpl) then) =
      __$$ResetStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetStateImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$ResetStateImpl>
    implements _$$ResetStateImplCopyWith<$Res> {
  __$$ResetStateImplCopyWithImpl(
      _$ResetStateImpl _value, $Res Function(_$ResetStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetStateImpl implements _ResetState {
  const _$ResetStateImpl();

  @override
  String toString() {
    return 'CompanyEvent.resetState()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return resetState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return resetState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return resetState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return resetState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (resetState != null) {
      return resetState(this);
    }
    return orElse();
  }
}

abstract class _ResetState implements CompanyEvent {
  const factory _ResetState() = _$ResetStateImpl;
}

/// @nodoc
abstract class _$$CompanyNameChangedImplCopyWith<$Res> {
  factory _$$CompanyNameChangedImplCopyWith(_$CompanyNameChangedImpl value,
          $Res Function(_$CompanyNameChangedImpl) then) =
      __$$CompanyNameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String companyName});
}

/// @nodoc
class __$$CompanyNameChangedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$CompanyNameChangedImpl>
    implements _$$CompanyNameChangedImplCopyWith<$Res> {
  __$$CompanyNameChangedImplCopyWithImpl(_$CompanyNameChangedImpl _value,
      $Res Function(_$CompanyNameChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
  }) {
    return _then(_$CompanyNameChangedImpl(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CompanyNameChangedImpl implements _CompanyNameChanged {
  const _$CompanyNameChangedImpl({required this.companyName});

  @override
  final String companyName;

  @override
  String toString() {
    return 'CompanyEvent.companyNameChanged(companyName: $companyName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyNameChangedImpl &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, companyName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyNameChangedImplCopyWith<_$CompanyNameChangedImpl> get copyWith =>
      __$$CompanyNameChangedImplCopyWithImpl<_$CompanyNameChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return companyNameChanged(companyName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return companyNameChanged?.call(companyName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (companyNameChanged != null) {
      return companyNameChanged(companyName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return companyNameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return companyNameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (companyNameChanged != null) {
      return companyNameChanged(this);
    }
    return orElse();
  }
}

abstract class _CompanyNameChanged implements CompanyEvent {
  const factory _CompanyNameChanged({required final String companyName}) =
      _$CompanyNameChangedImpl;

  String get companyName;
  @JsonKey(ignore: true)
  _$$CompanyNameChangedImplCopyWith<_$CompanyNameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryChangedImplCopyWith<$Res> {
  factory _$$CategoryChangedImplCopyWith(_$CategoryChangedImpl value,
          $Res Function(_$CategoryChangedImpl) then) =
      __$$CategoryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$CategoryChangedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$CategoryChangedImpl>
    implements _$$CategoryChangedImplCopyWith<$Res> {
  __$$CategoryChangedImplCopyWithImpl(
      _$CategoryChangedImpl _value, $Res Function(_$CategoryChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoryChangedImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryChangedImpl implements _CategoryChanged {
  const _$CategoryChangedImpl({required this.category});

  @override
  final String category;

  @override
  String toString() {
    return 'CompanyEvent.categoryChanged(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryChangedImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryChangedImplCopyWith<_$CategoryChangedImpl> get copyWith =>
      __$$CategoryChangedImplCopyWithImpl<_$CategoryChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return categoryChanged(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return categoryChanged?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return categoryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return categoryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (categoryChanged != null) {
      return categoryChanged(this);
    }
    return orElse();
  }
}

abstract class _CategoryChanged implements CompanyEvent {
  const factory _CategoryChanged({required final String category}) =
      _$CategoryChangedImpl;

  String get category;
  @JsonKey(ignore: true)
  _$$CategoryChangedImplCopyWith<_$CategoryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AboutCompanyChangedImplCopyWith<$Res> {
  factory _$$AboutCompanyChangedImplCopyWith(_$AboutCompanyChangedImpl value,
          $Res Function(_$AboutCompanyChangedImpl) then) =
      __$$AboutCompanyChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String aboutCompany});
}

/// @nodoc
class __$$AboutCompanyChangedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$AboutCompanyChangedImpl>
    implements _$$AboutCompanyChangedImplCopyWith<$Res> {
  __$$AboutCompanyChangedImplCopyWithImpl(_$AboutCompanyChangedImpl _value,
      $Res Function(_$AboutCompanyChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? aboutCompany = null,
  }) {
    return _then(_$AboutCompanyChangedImpl(
      aboutCompany: null == aboutCompany
          ? _value.aboutCompany
          : aboutCompany // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AboutCompanyChangedImpl implements _AboutCompanyChanged {
  const _$AboutCompanyChangedImpl({required this.aboutCompany});

  @override
  final String aboutCompany;

  @override
  String toString() {
    return 'CompanyEvent.aboutCompanyChanged(aboutCompany: $aboutCompany)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutCompanyChangedImpl &&
            (identical(other.aboutCompany, aboutCompany) ||
                other.aboutCompany == aboutCompany));
  }

  @override
  int get hashCode => Object.hash(runtimeType, aboutCompany);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutCompanyChangedImplCopyWith<_$AboutCompanyChangedImpl> get copyWith =>
      __$$AboutCompanyChangedImplCopyWithImpl<_$AboutCompanyChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return aboutCompanyChanged(aboutCompany);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return aboutCompanyChanged?.call(aboutCompany);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (aboutCompanyChanged != null) {
      return aboutCompanyChanged(aboutCompany);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return aboutCompanyChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return aboutCompanyChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (aboutCompanyChanged != null) {
      return aboutCompanyChanged(this);
    }
    return orElse();
  }
}

abstract class _AboutCompanyChanged implements CompanyEvent {
  const factory _AboutCompanyChanged({required final String aboutCompany}) =
      _$AboutCompanyChangedImpl;

  String get aboutCompany;
  @JsonKey(ignore: true)
  _$$AboutCompanyChangedImplCopyWith<_$AboutCompanyChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialMediaPlatformSelectedImplCopyWith<$Res> {
  factory _$$SocialMediaPlatformSelectedImplCopyWith(
          _$SocialMediaPlatformSelectedImpl value,
          $Res Function(_$SocialMediaPlatformSelectedImpl) then) =
      __$$SocialMediaPlatformSelectedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String platform});
}

/// @nodoc
class __$$SocialMediaPlatformSelectedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$SocialMediaPlatformSelectedImpl>
    implements _$$SocialMediaPlatformSelectedImplCopyWith<$Res> {
  __$$SocialMediaPlatformSelectedImplCopyWithImpl(
      _$SocialMediaPlatformSelectedImpl _value,
      $Res Function(_$SocialMediaPlatformSelectedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
  }) {
    return _then(_$SocialMediaPlatformSelectedImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialMediaPlatformSelectedImpl
    implements _SocialMediaPlatformSelected {
  const _$SocialMediaPlatformSelectedImpl({required this.platform});

  @override
  final String platform;

  @override
  String toString() {
    return 'CompanyEvent.socialMediaPlatformSelected(platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaPlatformSelectedImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platform);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaPlatformSelectedImplCopyWith<_$SocialMediaPlatformSelectedImpl>
      get copyWith => __$$SocialMediaPlatformSelectedImplCopyWithImpl<
          _$SocialMediaPlatformSelectedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return socialMediaPlatformSelected(platform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return socialMediaPlatformSelected?.call(platform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (socialMediaPlatformSelected != null) {
      return socialMediaPlatformSelected(platform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return socialMediaPlatformSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return socialMediaPlatformSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (socialMediaPlatformSelected != null) {
      return socialMediaPlatformSelected(this);
    }
    return orElse();
  }
}

abstract class _SocialMediaPlatformSelected implements CompanyEvent {
  const factory _SocialMediaPlatformSelected({required final String platform}) =
      _$SocialMediaPlatformSelectedImpl;

  String get platform;
  @JsonKey(ignore: true)
  _$$SocialMediaPlatformSelectedImplCopyWith<_$SocialMediaPlatformSelectedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocialMediaUrlChangedImplCopyWith<$Res> {
  factory _$$SocialMediaUrlChangedImplCopyWith(
          _$SocialMediaUrlChangedImpl value,
          $Res Function(_$SocialMediaUrlChangedImpl) then) =
      __$$SocialMediaUrlChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String platform, String url});
}

/// @nodoc
class __$$SocialMediaUrlChangedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$SocialMediaUrlChangedImpl>
    implements _$$SocialMediaUrlChangedImplCopyWith<$Res> {
  __$$SocialMediaUrlChangedImplCopyWithImpl(_$SocialMediaUrlChangedImpl _value,
      $Res Function(_$SocialMediaUrlChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? url = null,
  }) {
    return _then(_$SocialMediaUrlChangedImpl(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SocialMediaUrlChangedImpl implements _SocialMediaUrlChanged {
  const _$SocialMediaUrlChangedImpl(
      {required this.platform, required this.url});

  @override
  final String platform;
  @override
  final String url;

  @override
  String toString() {
    return 'CompanyEvent.socialMediaUrlChanged(platform: $platform, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaUrlChangedImpl &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, platform, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaUrlChangedImplCopyWith<_$SocialMediaUrlChangedImpl>
      get copyWith => __$$SocialMediaUrlChangedImplCopyWithImpl<
          _$SocialMediaUrlChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return socialMediaUrlChanged(platform, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return socialMediaUrlChanged?.call(platform, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (socialMediaUrlChanged != null) {
      return socialMediaUrlChanged(platform, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return socialMediaUrlChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return socialMediaUrlChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (socialMediaUrlChanged != null) {
      return socialMediaUrlChanged(this);
    }
    return orElse();
  }
}

abstract class _SocialMediaUrlChanged implements CompanyEvent {
  const factory _SocialMediaUrlChanged(
      {required final String platform,
      required final String url}) = _$SocialMediaUrlChangedImpl;

  String get platform;
  String get url;
  @JsonKey(ignore: true)
  _$$SocialMediaUrlChangedImplCopyWith<_$SocialMediaUrlChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddressChangedImplCopyWith<$Res> {
  factory _$$AddressChangedImplCopyWith(_$AddressChangedImpl value,
          $Res Function(_$AddressChangedImpl) then) =
      __$$AddressChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String address,
      String city,
      String state,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$AddressChangedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$AddressChangedImpl>
    implements _$$AddressChangedImplCopyWith<$Res> {
  __$$AddressChangedImplCopyWithImpl(
      _$AddressChangedImpl _value, $Res Function(_$AddressChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$AddressChangedImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AddressChangedImpl implements _AddressChanged {
  const _$AddressChangedImpl(
      {required this.address,
      required this.city,
      required this.state,
      required this.latitude,
      required this.longitude});

  @override
  final String address;
  @override
  final String city;
  @override
  final String state;
  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'CompanyEvent.addressChanged(address: $address, city: $city, state: $state, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressChangedImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, address, city, state, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressChangedImplCopyWith<_$AddressChangedImpl> get copyWith =>
      __$$AddressChangedImplCopyWithImpl<_$AddressChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return addressChanged(address, city, state, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return addressChanged?.call(address, city, state, latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (addressChanged != null) {
      return addressChanged(address, city, state, latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return addressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return addressChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (addressChanged != null) {
      return addressChanged(this);
    }
    return orElse();
  }
}

abstract class _AddressChanged implements CompanyEvent {
  const factory _AddressChanged(
      {required final String address,
      required final String city,
      required final String state,
      required final double latitude,
      required final double longitude}) = _$AddressChangedImpl;

  String get address;
  String get city;
  String get state;
  double get latitude;
  double get longitude;
  @JsonKey(ignore: true)
  _$$AddressChangedImplCopyWith<_$AddressChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GstNumberChangedImplCopyWith<$Res> {
  factory _$$GstNumberChangedImplCopyWith(_$GstNumberChangedImpl value,
          $Res Function(_$GstNumberChangedImpl) then) =
      __$$GstNumberChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String gstNumber});
}

/// @nodoc
class __$$GstNumberChangedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$GstNumberChangedImpl>
    implements _$$GstNumberChangedImplCopyWith<$Res> {
  __$$GstNumberChangedImplCopyWithImpl(_$GstNumberChangedImpl _value,
      $Res Function(_$GstNumberChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gstNumber = null,
  }) {
    return _then(_$GstNumberChangedImpl(
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GstNumberChangedImpl implements _GstNumberChanged {
  const _$GstNumberChangedImpl({required this.gstNumber});

  @override
  final String gstNumber;

  @override
  String toString() {
    return 'CompanyEvent.gstNumberChanged(gstNumber: $gstNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GstNumberChangedImpl &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gstNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GstNumberChangedImplCopyWith<_$GstNumberChangedImpl> get copyWith =>
      __$$GstNumberChangedImplCopyWithImpl<_$GstNumberChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return gstNumberChanged(gstNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return gstNumberChanged?.call(gstNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (gstNumberChanged != null) {
      return gstNumberChanged(gstNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return gstNumberChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return gstNumberChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (gstNumberChanged != null) {
      return gstNumberChanged(this);
    }
    return orElse();
  }
}

abstract class _GstNumberChanged implements CompanyEvent {
  const factory _GstNumberChanged({required final String gstNumber}) =
      _$GstNumberChangedImpl;

  String get gstNumber;
  @JsonKey(ignore: true)
  _$$GstNumberChangedImplCopyWith<_$GstNumberChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageChangedImplCopyWith<$Res> {
  factory _$$ImageChangedImplCopyWith(
          _$ImageChangedImpl value, $Res Function(_$ImageChangedImpl) then) =
      __$$ImageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile? image});
}

/// @nodoc
class __$$ImageChangedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$ImageChangedImpl>
    implements _$$ImageChangedImplCopyWith<$Res> {
  __$$ImageChangedImplCopyWithImpl(
      _$ImageChangedImpl _value, $Res Function(_$ImageChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
  }) {
    return _then(_$ImageChangedImpl(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
    ));
  }
}

/// @nodoc

class _$ImageChangedImpl implements _ImageChanged {
  const _$ImageChangedImpl({required this.image});

  @override
  final XFile? image;

  @override
  String toString() {
    return 'CompanyEvent.imageChanged(image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageChangedImpl &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageChangedImplCopyWith<_$ImageChangedImpl> get copyWith =>
      __$$ImageChangedImplCopyWithImpl<_$ImageChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return imageChanged(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return imageChanged?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return imageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return imageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (imageChanged != null) {
      return imageChanged(this);
    }
    return orElse();
  }
}

abstract class _ImageChanged implements CompanyEvent {
  const factory _ImageChanged({required final XFile? image}) =
      _$ImageChangedImpl;

  XFile? get image;
  @JsonKey(ignore: true)
  _$$ImageChangedImplCopyWith<_$ImageChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidateAndProceedImplCopyWith<$Res> {
  factory _$$ValidateAndProceedImplCopyWith(_$ValidateAndProceedImpl value,
          $Res Function(_$ValidateAndProceedImpl) then) =
      __$$ValidateAndProceedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateAndProceedImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$ValidateAndProceedImpl>
    implements _$$ValidateAndProceedImplCopyWith<$Res> {
  __$$ValidateAndProceedImplCopyWithImpl(_$ValidateAndProceedImpl _value,
      $Res Function(_$ValidateAndProceedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ValidateAndProceedImpl implements _ValidateAndProceed {
  const _$ValidateAndProceedImpl();

  @override
  String toString() {
    return 'CompanyEvent.validateAndProceed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ValidateAndProceedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return validateAndProceed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return validateAndProceed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (validateAndProceed != null) {
      return validateAndProceed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return validateAndProceed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return validateAndProceed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (validateAndProceed != null) {
      return validateAndProceed(this);
    }
    return orElse();
  }
}

abstract class _ValidateAndProceed implements CompanyEvent {
  const factory _ValidateAndProceed() = _$ValidateAndProceedImpl;
}

/// @nodoc
abstract class _$$CreateCompanyImplCopyWith<$Res> {
  factory _$$CreateCompanyImplCopyWith(
          _$CreateCompanyImpl value, $Res Function(_$CreateCompanyImpl) then) =
      __$$CreateCompanyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateCompanyImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$CreateCompanyImpl>
    implements _$$CreateCompanyImplCopyWith<$Res> {
  __$$CreateCompanyImplCopyWithImpl(
      _$CreateCompanyImpl _value, $Res Function(_$CreateCompanyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CreateCompanyImpl implements _CreateCompany {
  const _$CreateCompanyImpl();

  @override
  String toString() {
    return 'CompanyEvent.createCompany()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateCompanyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return createCompany();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return createCompany?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (createCompany != null) {
      return createCompany();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return createCompany(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return createCompany?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (createCompany != null) {
      return createCompany(this);
    }
    return orElse();
  }
}

abstract class _CreateCompany implements CompanyEvent {
  const factory _CreateCompany() = _$CreateCompanyImpl;
}

/// @nodoc
abstract class _$$GetMyCompanyImplCopyWith<$Res> {
  factory _$$GetMyCompanyImplCopyWith(
          _$GetMyCompanyImpl value, $Res Function(_$GetMyCompanyImpl) then) =
      __$$GetMyCompanyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMyCompanyImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$GetMyCompanyImpl>
    implements _$$GetMyCompanyImplCopyWith<$Res> {
  __$$GetMyCompanyImplCopyWithImpl(
      _$GetMyCompanyImpl _value, $Res Function(_$GetMyCompanyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMyCompanyImpl implements _GetMyCompany {
  const _$GetMyCompanyImpl();

  @override
  String toString() {
    return 'CompanyEvent.getMyCompany()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMyCompanyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return getMyCompany();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return getMyCompany?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (getMyCompany != null) {
      return getMyCompany();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return getMyCompany(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return getMyCompany?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (getMyCompany != null) {
      return getMyCompany(this);
    }
    return orElse();
  }
}

abstract class _GetMyCompany implements CompanyEvent {
  const factory _GetMyCompany() = _$GetMyCompanyImpl;
}

/// @nodoc
abstract class _$$GetUserCompanyImplCopyWith<$Res> {
  factory _$$GetUserCompanyImplCopyWith(_$GetUserCompanyImpl value,
          $Res Function(_$GetUserCompanyImpl) then) =
      __$$GetUserCompanyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GetUserCompanyImplCopyWithImpl<$Res>
    extends _$CompanyEventCopyWithImpl<$Res, _$GetUserCompanyImpl>
    implements _$$GetUserCompanyImplCopyWith<$Res> {
  __$$GetUserCompanyImplCopyWithImpl(
      _$GetUserCompanyImpl _value, $Res Function(_$GetUserCompanyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
  }) {
    return _then(_$GetUserCompanyImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserCompanyImpl implements _GetUserCompany {
  const _$GetUserCompanyImpl({required this.userId});

  @override
  final String userId;

  @override
  String toString() {
    return 'CompanyEvent.getUserCompany(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserCompanyImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserCompanyImplCopyWith<_$GetUserCompanyImpl> get copyWith =>
      __$$GetUserCompanyImplCopyWithImpl<_$GetUserCompanyImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() resetState,
    required TResult Function(String companyName) companyNameChanged,
    required TResult Function(String category) categoryChanged,
    required TResult Function(String aboutCompany) aboutCompanyChanged,
    required TResult Function(String platform) socialMediaPlatformSelected,
    required TResult Function(String platform, String url)
        socialMediaUrlChanged,
    required TResult Function(String address, String city, String state,
            double latitude, double longitude)
        addressChanged,
    required TResult Function(String gstNumber) gstNumberChanged,
    required TResult Function(XFile? image) imageChanged,
    required TResult Function() validateAndProceed,
    required TResult Function() createCompany,
    required TResult Function() getMyCompany,
    required TResult Function(String userId) getUserCompany,
  }) {
    return getUserCompany(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? resetState,
    TResult? Function(String companyName)? companyNameChanged,
    TResult? Function(String category)? categoryChanged,
    TResult? Function(String aboutCompany)? aboutCompanyChanged,
    TResult? Function(String platform)? socialMediaPlatformSelected,
    TResult? Function(String platform, String url)? socialMediaUrlChanged,
    TResult? Function(String address, String city, String state,
            double latitude, double longitude)?
        addressChanged,
    TResult? Function(String gstNumber)? gstNumberChanged,
    TResult? Function(XFile? image)? imageChanged,
    TResult? Function()? validateAndProceed,
    TResult? Function()? createCompany,
    TResult? Function()? getMyCompany,
    TResult? Function(String userId)? getUserCompany,
  }) {
    return getUserCompany?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? resetState,
    TResult Function(String companyName)? companyNameChanged,
    TResult Function(String category)? categoryChanged,
    TResult Function(String aboutCompany)? aboutCompanyChanged,
    TResult Function(String platform)? socialMediaPlatformSelected,
    TResult Function(String platform, String url)? socialMediaUrlChanged,
    TResult Function(String address, String city, String state, double latitude,
            double longitude)?
        addressChanged,
    TResult Function(String gstNumber)? gstNumberChanged,
    TResult Function(XFile? image)? imageChanged,
    TResult Function()? validateAndProceed,
    TResult Function()? createCompany,
    TResult Function()? getMyCompany,
    TResult Function(String userId)? getUserCompany,
    required TResult orElse(),
  }) {
    if (getUserCompany != null) {
      return getUserCompany(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CompanyStarted value) started,
    required TResult Function(_ResetState value) resetState,
    required TResult Function(_CompanyNameChanged value) companyNameChanged,
    required TResult Function(_CategoryChanged value) categoryChanged,
    required TResult Function(_AboutCompanyChanged value) aboutCompanyChanged,
    required TResult Function(_SocialMediaPlatformSelected value)
        socialMediaPlatformSelected,
    required TResult Function(_SocialMediaUrlChanged value)
        socialMediaUrlChanged,
    required TResult Function(_AddressChanged value) addressChanged,
    required TResult Function(_GstNumberChanged value) gstNumberChanged,
    required TResult Function(_ImageChanged value) imageChanged,
    required TResult Function(_ValidateAndProceed value) validateAndProceed,
    required TResult Function(_CreateCompany value) createCompany,
    required TResult Function(_GetMyCompany value) getMyCompany,
    required TResult Function(_GetUserCompany value) getUserCompany,
  }) {
    return getUserCompany(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CompanyStarted value)? started,
    TResult? Function(_ResetState value)? resetState,
    TResult? Function(_CompanyNameChanged value)? companyNameChanged,
    TResult? Function(_CategoryChanged value)? categoryChanged,
    TResult? Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult? Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult? Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult? Function(_AddressChanged value)? addressChanged,
    TResult? Function(_GstNumberChanged value)? gstNumberChanged,
    TResult? Function(_ImageChanged value)? imageChanged,
    TResult? Function(_ValidateAndProceed value)? validateAndProceed,
    TResult? Function(_CreateCompany value)? createCompany,
    TResult? Function(_GetMyCompany value)? getMyCompany,
    TResult? Function(_GetUserCompany value)? getUserCompany,
  }) {
    return getUserCompany?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CompanyStarted value)? started,
    TResult Function(_ResetState value)? resetState,
    TResult Function(_CompanyNameChanged value)? companyNameChanged,
    TResult Function(_CategoryChanged value)? categoryChanged,
    TResult Function(_AboutCompanyChanged value)? aboutCompanyChanged,
    TResult Function(_SocialMediaPlatformSelected value)?
        socialMediaPlatformSelected,
    TResult Function(_SocialMediaUrlChanged value)? socialMediaUrlChanged,
    TResult Function(_AddressChanged value)? addressChanged,
    TResult Function(_GstNumberChanged value)? gstNumberChanged,
    TResult Function(_ImageChanged value)? imageChanged,
    TResult Function(_ValidateAndProceed value)? validateAndProceed,
    TResult Function(_CreateCompany value)? createCompany,
    TResult Function(_GetMyCompany value)? getMyCompany,
    TResult Function(_GetUserCompany value)? getUserCompany,
    required TResult orElse(),
  }) {
    if (getUserCompany != null) {
      return getUserCompany(this);
    }
    return orElse();
  }
}

abstract class _GetUserCompany implements CompanyEvent {
  const factory _GetUserCompany({required final String userId}) =
      _$GetUserCompanyImpl;

  String get userId;
  @JsonKey(ignore: true)
  _$$GetUserCompanyImplCopyWith<_$GetUserCompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CompanyState {
  String get companyName => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  String get aboutCompany => throw _privateConstructorUsedError;
  String get selectedSocialMediaPlatform => throw _privateConstructorUsedError;
  String get websiteUrl => throw _privateConstructorUsedError;
  String get facebookUrl => throw _privateConstructorUsedError;
  String get instagramUrl => throw _privateConstructorUsedError;
  String get twitterUrl => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get gstNumber => throw _privateConstructorUsedError;
  XFile? get selectedImage => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  CreateCompanyResponse? get createCompanyResponse =>
      throw _privateConstructorUsedError;
  MyCompanyResponseModel? get myCompany => throw _privateConstructorUsedError;
  MyCompanyResponseModel? get userCompany => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompanyStateCopyWith<CompanyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyStateCopyWith<$Res> {
  factory $CompanyStateCopyWith(
          CompanyState value, $Res Function(CompanyState) then) =
      _$CompanyStateCopyWithImpl<$Res, CompanyState>;
  @useResult
  $Res call(
      {String companyName,
      String selectedCategory,
      String aboutCompany,
      String selectedSocialMediaPlatform,
      String websiteUrl,
      String facebookUrl,
      String instagramUrl,
      String twitterUrl,
      String address,
      String city,
      String state,
      String gstNumber,
      XFile? selectedImage,
      double? latitude,
      double? longitude,
      bool isLoading,
      String? errorMessage,
      bool isValid,
      CreateCompanyResponse? createCompanyResponse,
      MyCompanyResponseModel? myCompany,
      MyCompanyResponseModel? userCompany});

  $CreateCompanyResponseCopyWith<$Res>? get createCompanyResponse;
  $MyCompanyResponseModelCopyWith<$Res>? get myCompany;
  $MyCompanyResponseModelCopyWith<$Res>? get userCompany;
}

/// @nodoc
class _$CompanyStateCopyWithImpl<$Res, $Val extends CompanyState>
    implements $CompanyStateCopyWith<$Res> {
  _$CompanyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? selectedCategory = null,
    Object? aboutCompany = null,
    Object? selectedSocialMediaPlatform = null,
    Object? websiteUrl = null,
    Object? facebookUrl = null,
    Object? instagramUrl = null,
    Object? twitterUrl = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? gstNumber = null,
    Object? selectedImage = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isValid = null,
    Object? createCompanyResponse = freezed,
    Object? myCompany = freezed,
    Object? userCompany = freezed,
  }) {
    return _then(_value.copyWith(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      aboutCompany: null == aboutCompany
          ? _value.aboutCompany
          : aboutCompany // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSocialMediaPlatform: null == selectedSocialMediaPlatform
          ? _value.selectedSocialMediaPlatform
          : selectedSocialMediaPlatform // ignore: cast_nullable_to_non_nullable
              as String,
      websiteUrl: null == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      facebookUrl: null == facebookUrl
          ? _value.facebookUrl
          : facebookUrl // ignore: cast_nullable_to_non_nullable
              as String,
      instagramUrl: null == instagramUrl
          ? _value.instagramUrl
          : instagramUrl // ignore: cast_nullable_to_non_nullable
              as String,
      twitterUrl: null == twitterUrl
          ? _value.twitterUrl
          : twitterUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      createCompanyResponse: freezed == createCompanyResponse
          ? _value.createCompanyResponse
          : createCompanyResponse // ignore: cast_nullable_to_non_nullable
              as CreateCompanyResponse?,
      myCompany: freezed == myCompany
          ? _value.myCompany
          : myCompany // ignore: cast_nullable_to_non_nullable
              as MyCompanyResponseModel?,
      userCompany: freezed == userCompany
          ? _value.userCompany
          : userCompany // ignore: cast_nullable_to_non_nullable
              as MyCompanyResponseModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreateCompanyResponseCopyWith<$Res>? get createCompanyResponse {
    if (_value.createCompanyResponse == null) {
      return null;
    }

    return $CreateCompanyResponseCopyWith<$Res>(_value.createCompanyResponse!,
        (value) {
      return _then(_value.copyWith(createCompanyResponse: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MyCompanyResponseModelCopyWith<$Res>? get myCompany {
    if (_value.myCompany == null) {
      return null;
    }

    return $MyCompanyResponseModelCopyWith<$Res>(_value.myCompany!, (value) {
      return _then(_value.copyWith(myCompany: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MyCompanyResponseModelCopyWith<$Res>? get userCompany {
    if (_value.userCompany == null) {
      return null;
    }

    return $MyCompanyResponseModelCopyWith<$Res>(_value.userCompany!, (value) {
      return _then(_value.copyWith(userCompany: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CompanyStateImplCopyWith<$Res>
    implements $CompanyStateCopyWith<$Res> {
  factory _$$CompanyStateImplCopyWith(
          _$CompanyStateImpl value, $Res Function(_$CompanyStateImpl) then) =
      __$$CompanyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String companyName,
      String selectedCategory,
      String aboutCompany,
      String selectedSocialMediaPlatform,
      String websiteUrl,
      String facebookUrl,
      String instagramUrl,
      String twitterUrl,
      String address,
      String city,
      String state,
      String gstNumber,
      XFile? selectedImage,
      double? latitude,
      double? longitude,
      bool isLoading,
      String? errorMessage,
      bool isValid,
      CreateCompanyResponse? createCompanyResponse,
      MyCompanyResponseModel? myCompany,
      MyCompanyResponseModel? userCompany});

  @override
  $CreateCompanyResponseCopyWith<$Res>? get createCompanyResponse;
  @override
  $MyCompanyResponseModelCopyWith<$Res>? get myCompany;
  @override
  $MyCompanyResponseModelCopyWith<$Res>? get userCompany;
}

/// @nodoc
class __$$CompanyStateImplCopyWithImpl<$Res>
    extends _$CompanyStateCopyWithImpl<$Res, _$CompanyStateImpl>
    implements _$$CompanyStateImplCopyWith<$Res> {
  __$$CompanyStateImplCopyWithImpl(
      _$CompanyStateImpl _value, $Res Function(_$CompanyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = null,
    Object? selectedCategory = null,
    Object? aboutCompany = null,
    Object? selectedSocialMediaPlatform = null,
    Object? websiteUrl = null,
    Object? facebookUrl = null,
    Object? instagramUrl = null,
    Object? twitterUrl = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? gstNumber = null,
    Object? selectedImage = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? isValid = null,
    Object? createCompanyResponse = freezed,
    Object? myCompany = freezed,
    Object? userCompany = freezed,
  }) {
    return _then(_$CompanyStateImpl(
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      aboutCompany: null == aboutCompany
          ? _value.aboutCompany
          : aboutCompany // ignore: cast_nullable_to_non_nullable
              as String,
      selectedSocialMediaPlatform: null == selectedSocialMediaPlatform
          ? _value.selectedSocialMediaPlatform
          : selectedSocialMediaPlatform // ignore: cast_nullable_to_non_nullable
              as String,
      websiteUrl: null == websiteUrl
          ? _value.websiteUrl
          : websiteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      facebookUrl: null == facebookUrl
          ? _value.facebookUrl
          : facebookUrl // ignore: cast_nullable_to_non_nullable
              as String,
      instagramUrl: null == instagramUrl
          ? _value.instagramUrl
          : instagramUrl // ignore: cast_nullable_to_non_nullable
              as String,
      twitterUrl: null == twitterUrl
          ? _value.twitterUrl
          : twitterUrl // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      selectedImage: freezed == selectedImage
          ? _value.selectedImage
          : selectedImage // ignore: cast_nullable_to_non_nullable
              as XFile?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      createCompanyResponse: freezed == createCompanyResponse
          ? _value.createCompanyResponse
          : createCompanyResponse // ignore: cast_nullable_to_non_nullable
              as CreateCompanyResponse?,
      myCompany: freezed == myCompany
          ? _value.myCompany
          : myCompany // ignore: cast_nullable_to_non_nullable
              as MyCompanyResponseModel?,
      userCompany: freezed == userCompany
          ? _value.userCompany
          : userCompany // ignore: cast_nullable_to_non_nullable
              as MyCompanyResponseModel?,
    ));
  }
}

/// @nodoc

class _$CompanyStateImpl implements _CompanyState {
  const _$CompanyStateImpl(
      {this.companyName = '',
      this.selectedCategory = '',
      this.aboutCompany = '',
      this.selectedSocialMediaPlatform = 'Facebook',
      this.websiteUrl = '',
      this.facebookUrl = '',
      this.instagramUrl = '',
      this.twitterUrl = '',
      this.address = '',
      this.city = '',
      this.state = '',
      this.gstNumber = '',
      this.selectedImage,
      this.latitude,
      this.longitude,
      this.isLoading = false,
      this.errorMessage,
      this.isValid = false,
      this.createCompanyResponse,
      this.myCompany,
      this.userCompany});

  @override
  @JsonKey()
  final String companyName;
  @override
  @JsonKey()
  final String selectedCategory;
  @override
  @JsonKey()
  final String aboutCompany;
  @override
  @JsonKey()
  final String selectedSocialMediaPlatform;
  @override
  @JsonKey()
  final String websiteUrl;
  @override
  @JsonKey()
  final String facebookUrl;
  @override
  @JsonKey()
  final String instagramUrl;
  @override
  @JsonKey()
  final String twitterUrl;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String state;
  @override
  @JsonKey()
  final String gstNumber;
  @override
  final XFile? selectedImage;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool isValid;
  @override
  final CreateCompanyResponse? createCompanyResponse;
  @override
  final MyCompanyResponseModel? myCompany;
  @override
  final MyCompanyResponseModel? userCompany;

  @override
  String toString() {
    return 'CompanyState(companyName: $companyName, selectedCategory: $selectedCategory, aboutCompany: $aboutCompany, selectedSocialMediaPlatform: $selectedSocialMediaPlatform, websiteUrl: $websiteUrl, facebookUrl: $facebookUrl, instagramUrl: $instagramUrl, twitterUrl: $twitterUrl, address: $address, city: $city, state: $state, gstNumber: $gstNumber, selectedImage: $selectedImage, latitude: $latitude, longitude: $longitude, isLoading: $isLoading, errorMessage: $errorMessage, isValid: $isValid, createCompanyResponse: $createCompanyResponse, myCompany: $myCompany, userCompany: $userCompany)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyStateImpl &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.aboutCompany, aboutCompany) ||
                other.aboutCompany == aboutCompany) &&
            (identical(other.selectedSocialMediaPlatform,
                    selectedSocialMediaPlatform) ||
                other.selectedSocialMediaPlatform ==
                    selectedSocialMediaPlatform) &&
            (identical(other.websiteUrl, websiteUrl) ||
                other.websiteUrl == websiteUrl) &&
            (identical(other.facebookUrl, facebookUrl) ||
                other.facebookUrl == facebookUrl) &&
            (identical(other.instagramUrl, instagramUrl) ||
                other.instagramUrl == instagramUrl) &&
            (identical(other.twitterUrl, twitterUrl) ||
                other.twitterUrl == twitterUrl) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.selectedImage, selectedImage) ||
                other.selectedImage == selectedImage) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.createCompanyResponse, createCompanyResponse) ||
                other.createCompanyResponse == createCompanyResponse) &&
            (identical(other.myCompany, myCompany) ||
                other.myCompany == myCompany) &&
            (identical(other.userCompany, userCompany) ||
                other.userCompany == userCompany));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        companyName,
        selectedCategory,
        aboutCompany,
        selectedSocialMediaPlatform,
        websiteUrl,
        facebookUrl,
        instagramUrl,
        twitterUrl,
        address,
        city,
        state,
        gstNumber,
        selectedImage,
        latitude,
        longitude,
        isLoading,
        errorMessage,
        isValid,
        createCompanyResponse,
        myCompany,
        userCompany
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyStateImplCopyWith<_$CompanyStateImpl> get copyWith =>
      __$$CompanyStateImplCopyWithImpl<_$CompanyStateImpl>(this, _$identity);
}

abstract class _CompanyState implements CompanyState {
  const factory _CompanyState(
      {final String companyName,
      final String selectedCategory,
      final String aboutCompany,
      final String selectedSocialMediaPlatform,
      final String websiteUrl,
      final String facebookUrl,
      final String instagramUrl,
      final String twitterUrl,
      final String address,
      final String city,
      final String state,
      final String gstNumber,
      final XFile? selectedImage,
      final double? latitude,
      final double? longitude,
      final bool isLoading,
      final String? errorMessage,
      final bool isValid,
      final CreateCompanyResponse? createCompanyResponse,
      final MyCompanyResponseModel? myCompany,
      final MyCompanyResponseModel? userCompany}) = _$CompanyStateImpl;

  @override
  String get companyName;
  @override
  String get selectedCategory;
  @override
  String get aboutCompany;
  @override
  String get selectedSocialMediaPlatform;
  @override
  String get websiteUrl;
  @override
  String get facebookUrl;
  @override
  String get instagramUrl;
  @override
  String get twitterUrl;
  @override
  String get address;
  @override
  String get city;
  @override
  String get state;
  @override
  String get gstNumber;
  @override
  XFile? get selectedImage;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  bool get isValid;
  @override
  CreateCompanyResponse? get createCompanyResponse;
  @override
  MyCompanyResponseModel? get myCompany;
  @override
  MyCompanyResponseModel? get userCompany;
  @override
  @JsonKey(ignore: true)
  _$$CompanyStateImplCopyWith<_$CompanyStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
