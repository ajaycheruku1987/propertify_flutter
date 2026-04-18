// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'razorpay_order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateOrderRequest _$CreateOrderRequestFromJson(Map<String, dynamic> json) {
  return _CreateOrderRequest.fromJson(json);
}

/// @nodoc
mixin _$CreateOrderRequest {
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_for')
  String get paymentFor => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id')
  String get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_days')
  int get durationDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateOrderRequestCopyWith<CreateOrderRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOrderRequestCopyWith<$Res> {
  factory $CreateOrderRequestCopyWith(
          CreateOrderRequest value, $Res Function(CreateOrderRequest) then) =
      _$CreateOrderRequestCopyWithImpl<$Res, CreateOrderRequest>;
  @useResult
  $Res call(
      {double amount,
      @JsonKey(name: 'payment_for') String paymentFor,
      @JsonKey(name: 'entity_id') String entityId,
      @JsonKey(name: 'duration_days') int durationDays});
}

/// @nodoc
class _$CreateOrderRequestCopyWithImpl<$Res, $Val extends CreateOrderRequest>
    implements $CreateOrderRequestCopyWith<$Res> {
  _$CreateOrderRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? paymentFor = null,
    Object? entityId = null,
    Object? durationDays = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentFor: null == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateOrderRequestImplCopyWith<$Res>
    implements $CreateOrderRequestCopyWith<$Res> {
  factory _$$CreateOrderRequestImplCopyWith(_$CreateOrderRequestImpl value,
          $Res Function(_$CreateOrderRequestImpl) then) =
      __$$CreateOrderRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double amount,
      @JsonKey(name: 'payment_for') String paymentFor,
      @JsonKey(name: 'entity_id') String entityId,
      @JsonKey(name: 'duration_days') int durationDays});
}

/// @nodoc
class __$$CreateOrderRequestImplCopyWithImpl<$Res>
    extends _$CreateOrderRequestCopyWithImpl<$Res, _$CreateOrderRequestImpl>
    implements _$$CreateOrderRequestImplCopyWith<$Res> {
  __$$CreateOrderRequestImplCopyWithImpl(_$CreateOrderRequestImpl _value,
      $Res Function(_$CreateOrderRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? paymentFor = null,
    Object? entityId = null,
    Object? durationDays = null,
  }) {
    return _then(_$CreateOrderRequestImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentFor: null == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      durationDays: null == durationDays
          ? _value.durationDays
          : durationDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateOrderRequestImpl implements _CreateOrderRequest {
  const _$CreateOrderRequestImpl(
      {required this.amount,
      @JsonKey(name: 'payment_for') required this.paymentFor,
      @JsonKey(name: 'entity_id') required this.entityId,
      @JsonKey(name: 'duration_days') required this.durationDays});

  factory _$CreateOrderRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateOrderRequestImplFromJson(json);

  @override
  final double amount;
  @override
  @JsonKey(name: 'payment_for')
  final String paymentFor;
  @override
  @JsonKey(name: 'entity_id')
  final String entityId;
  @override
  @JsonKey(name: 'duration_days')
  final int durationDays;

  @override
  String toString() {
    return 'CreateOrderRequest(amount: $amount, paymentFor: $paymentFor, entityId: $entityId, durationDays: $durationDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateOrderRequestImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentFor, paymentFor) ||
                other.paymentFor == paymentFor) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.durationDays, durationDays) ||
                other.durationDays == durationDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, paymentFor, entityId, durationDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      __$$CreateOrderRequestImplCopyWithImpl<_$CreateOrderRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateOrderRequestImplToJson(
      this,
    );
  }
}

abstract class _CreateOrderRequest implements CreateOrderRequest {
  const factory _CreateOrderRequest(
          {required final double amount,
          @JsonKey(name: 'payment_for') required final String paymentFor,
          @JsonKey(name: 'entity_id') required final String entityId,
          @JsonKey(name: 'duration_days') required final int durationDays}) =
      _$CreateOrderRequestImpl;

  factory _CreateOrderRequest.fromJson(Map<String, dynamic> json) =
      _$CreateOrderRequestImpl.fromJson;

  @override
  double get amount;
  @override
  @JsonKey(name: 'payment_for')
  String get paymentFor;
  @override
  @JsonKey(name: 'entity_id')
  String get entityId;
  @override
  @JsonKey(name: 'duration_days')
  int get durationDays;
  @override
  @JsonKey(ignore: true)
  _$$CreateOrderRequestImplCopyWith<_$CreateOrderRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RazorpayOrderResponse _$RazorpayOrderResponseFromJson(
    Map<String, dynamic> json) {
  return _RazorpayOrderResponse.fromJson(json);
}

/// @nodoc
mixin _$RazorpayOrderResponse {
  String get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;
  Map<String, dynamic> get notes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RazorpayOrderResponseCopyWith<RazorpayOrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RazorpayOrderResponseCopyWith<$Res> {
  factory $RazorpayOrderResponseCopyWith(RazorpayOrderResponse value,
          $Res Function(RazorpayOrderResponse) then) =
      _$RazorpayOrderResponseCopyWithImpl<$Res, RazorpayOrderResponse>;
  @useResult
  $Res call(
      {String id,
      int amount,
      String currency,
      String key,
      Map<String, dynamic> notes});
}

/// @nodoc
class _$RazorpayOrderResponseCopyWithImpl<$Res,
        $Val extends RazorpayOrderResponse>
    implements $RazorpayOrderResponseCopyWith<$Res> {
  _$RazorpayOrderResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? currency = null,
    Object? key = null,
    Object? notes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RazorpayOrderResponseImplCopyWith<$Res>
    implements $RazorpayOrderResponseCopyWith<$Res> {
  factory _$$RazorpayOrderResponseImplCopyWith(
          _$RazorpayOrderResponseImpl value,
          $Res Function(_$RazorpayOrderResponseImpl) then) =
      __$$RazorpayOrderResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int amount,
      String currency,
      String key,
      Map<String, dynamic> notes});
}

/// @nodoc
class __$$RazorpayOrderResponseImplCopyWithImpl<$Res>
    extends _$RazorpayOrderResponseCopyWithImpl<$Res,
        _$RazorpayOrderResponseImpl>
    implements _$$RazorpayOrderResponseImplCopyWith<$Res> {
  __$$RazorpayOrderResponseImplCopyWithImpl(_$RazorpayOrderResponseImpl _value,
      $Res Function(_$RazorpayOrderResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? currency = null,
    Object? key = null,
    Object? notes = null,
  }) {
    return _then(_$RazorpayOrderResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value._notes
          : notes // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RazorpayOrderResponseImpl implements _RazorpayOrderResponse {
  const _$RazorpayOrderResponseImpl(
      {required this.id,
      required this.amount,
      required this.currency,
      required this.key,
      required final Map<String, dynamic> notes})
      : _notes = notes;

  factory _$RazorpayOrderResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RazorpayOrderResponseImplFromJson(json);

  @override
  final String id;
  @override
  final int amount;
  @override
  final String currency;
  @override
  final String key;
  final Map<String, dynamic> _notes;
  @override
  Map<String, dynamic> get notes {
    if (_notes is EqualUnmodifiableMapView) return _notes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notes);
  }

  @override
  String toString() {
    return 'RazorpayOrderResponse(id: $id, amount: $amount, currency: $currency, key: $key, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RazorpayOrderResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.key, key) || other.key == key) &&
            const DeepCollectionEquality().equals(other._notes, _notes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, amount, currency, key,
      const DeepCollectionEquality().hash(_notes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RazorpayOrderResponseImplCopyWith<_$RazorpayOrderResponseImpl>
      get copyWith => __$$RazorpayOrderResponseImplCopyWithImpl<
          _$RazorpayOrderResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RazorpayOrderResponseImplToJson(
      this,
    );
  }
}

abstract class _RazorpayOrderResponse implements RazorpayOrderResponse {
  const factory _RazorpayOrderResponse(
      {required final String id,
      required final int amount,
      required final String currency,
      required final String key,
      required final Map<String, dynamic> notes}) = _$RazorpayOrderResponseImpl;

  factory _RazorpayOrderResponse.fromJson(Map<String, dynamic> json) =
      _$RazorpayOrderResponseImpl.fromJson;

  @override
  String get id;
  @override
  int get amount;
  @override
  String get currency;
  @override
  String get key;
  @override
  Map<String, dynamic> get notes;
  @override
  @JsonKey(ignore: true)
  _$$RazorpayOrderResponseImplCopyWith<_$RazorpayOrderResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
