// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_confirm_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentConfirmRequest _$PaymentConfirmRequestFromJson(
    Map<String, dynamic> json) {
  return _PaymentConfirmRequest.fromJson(json);
}

/// @nodoc
mixin _$PaymentConfirmRequest {
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_for')
  String get paymentFor => throw _privateConstructorUsedError;
  PaymentDetails get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentConfirmRequestCopyWith<PaymentConfirmRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentConfirmRequestCopyWith<$Res> {
  factory $PaymentConfirmRequestCopyWith(PaymentConfirmRequest value,
          $Res Function(PaymentConfirmRequest) then) =
      _$PaymentConfirmRequestCopyWithImpl<$Res, PaymentConfirmRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      double amount,
      @JsonKey(name: 'payment_for') String paymentFor,
      PaymentDetails details});

  $PaymentDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$PaymentConfirmRequestCopyWithImpl<$Res,
        $Val extends PaymentConfirmRequest>
    implements $PaymentConfirmRequestCopyWith<$Res> {
  _$PaymentConfirmRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? amount = null,
    Object? paymentFor = null,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentFor: null == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentDetailsCopyWith<$Res> get details {
    return $PaymentDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentConfirmRequestImplCopyWith<$Res>
    implements $PaymentConfirmRequestCopyWith<$Res> {
  factory _$$PaymentConfirmRequestImplCopyWith(
          _$PaymentConfirmRequestImpl value,
          $Res Function(_$PaymentConfirmRequestImpl) then) =
      __$$PaymentConfirmRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_id') String transactionId,
      double amount,
      @JsonKey(name: 'payment_for') String paymentFor,
      PaymentDetails details});

  @override
  $PaymentDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$PaymentConfirmRequestImplCopyWithImpl<$Res>
    extends _$PaymentConfirmRequestCopyWithImpl<$Res,
        _$PaymentConfirmRequestImpl>
    implements _$$PaymentConfirmRequestImplCopyWith<$Res> {
  __$$PaymentConfirmRequestImplCopyWithImpl(_$PaymentConfirmRequestImpl _value,
      $Res Function(_$PaymentConfirmRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionId = null,
    Object? amount = null,
    Object? paymentFor = null,
    Object? details = null,
  }) {
    return _then(_$PaymentConfirmRequestImpl(
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      paymentFor: null == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as PaymentDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentConfirmRequestImpl implements _PaymentConfirmRequest {
  const _$PaymentConfirmRequestImpl(
      {@JsonKey(name: 'transaction_id') required this.transactionId,
      required this.amount,
      @JsonKey(name: 'payment_for') required this.paymentFor,
      required this.details});

  factory _$PaymentConfirmRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentConfirmRequestImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  final double amount;
  @override
  @JsonKey(name: 'payment_for')
  final String paymentFor;
  @override
  final PaymentDetails details;

  @override
  String toString() {
    return 'PaymentConfirmRequest(transactionId: $transactionId, amount: $amount, paymentFor: $paymentFor, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentConfirmRequestImpl &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentFor, paymentFor) ||
                other.paymentFor == paymentFor) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, transactionId, amount, paymentFor, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentConfirmRequestImplCopyWith<_$PaymentConfirmRequestImpl>
      get copyWith => __$$PaymentConfirmRequestImplCopyWithImpl<
          _$PaymentConfirmRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentConfirmRequestImplToJson(
      this,
    );
  }
}

abstract class _PaymentConfirmRequest implements PaymentConfirmRequest {
  const factory _PaymentConfirmRequest(
      {@JsonKey(name: 'transaction_id') required final String transactionId,
      required final double amount,
      @JsonKey(name: 'payment_for') required final String paymentFor,
      required final PaymentDetails details}) = _$PaymentConfirmRequestImpl;

  factory _PaymentConfirmRequest.fromJson(Map<String, dynamic> json) =
      _$PaymentConfirmRequestImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  double get amount;
  @override
  @JsonKey(name: 'payment_for')
  String get paymentFor;
  @override
  PaymentDetails get details;
  @override
  @JsonKey(ignore: true)
  _$$PaymentConfirmRequestImplCopyWith<_$PaymentConfirmRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PaymentDetails _$PaymentDetailsFromJson(Map<String, dynamic> json) {
  return _PaymentDetails.fromJson(json);
}

/// @nodoc
mixin _$PaymentDetails {
  @JsonKey(name: 'razorpay_payment_id')
  String get razorpayPaymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'razorpay_order_id')
  String get razorpayOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'razorpay_signature')
  String get razorpaySignature => throw _privateConstructorUsedError;
  String get method => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentDetailsCopyWith<PaymentDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDetailsCopyWith<$Res> {
  factory $PaymentDetailsCopyWith(
          PaymentDetails value, $Res Function(PaymentDetails) then) =
      _$PaymentDetailsCopyWithImpl<$Res, PaymentDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'razorpay_payment_id') String razorpayPaymentId,
      @JsonKey(name: 'razorpay_order_id') String razorpayOrderId,
      @JsonKey(name: 'razorpay_signature') String razorpaySignature,
      String method});
}

/// @nodoc
class _$PaymentDetailsCopyWithImpl<$Res, $Val extends PaymentDetails>
    implements $PaymentDetailsCopyWith<$Res> {
  _$PaymentDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? razorpayPaymentId = null,
    Object? razorpayOrderId = null,
    Object? razorpaySignature = null,
    Object? method = null,
  }) {
    return _then(_value.copyWith(
      razorpayPaymentId: null == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpayOrderId: null == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpaySignature: null == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentDetailsImplCopyWith<$Res>
    implements $PaymentDetailsCopyWith<$Res> {
  factory _$$PaymentDetailsImplCopyWith(_$PaymentDetailsImpl value,
          $Res Function(_$PaymentDetailsImpl) then) =
      __$$PaymentDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'razorpay_payment_id') String razorpayPaymentId,
      @JsonKey(name: 'razorpay_order_id') String razorpayOrderId,
      @JsonKey(name: 'razorpay_signature') String razorpaySignature,
      String method});
}

/// @nodoc
class __$$PaymentDetailsImplCopyWithImpl<$Res>
    extends _$PaymentDetailsCopyWithImpl<$Res, _$PaymentDetailsImpl>
    implements _$$PaymentDetailsImplCopyWith<$Res> {
  __$$PaymentDetailsImplCopyWithImpl(
      _$PaymentDetailsImpl _value, $Res Function(_$PaymentDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? razorpayPaymentId = null,
    Object? razorpayOrderId = null,
    Object? razorpaySignature = null,
    Object? method = null,
  }) {
    return _then(_$PaymentDetailsImpl(
      razorpayPaymentId: null == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpayOrderId: null == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      razorpaySignature: null == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentDetailsImpl implements _PaymentDetails {
  const _$PaymentDetailsImpl(
      {@JsonKey(name: 'razorpay_payment_id') required this.razorpayPaymentId,
      @JsonKey(name: 'razorpay_order_id') required this.razorpayOrderId,
      @JsonKey(name: 'razorpay_signature') required this.razorpaySignature,
      required this.method});

  factory _$PaymentDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'razorpay_payment_id')
  final String razorpayPaymentId;
  @override
  @JsonKey(name: 'razorpay_order_id')
  final String razorpayOrderId;
  @override
  @JsonKey(name: 'razorpay_signature')
  final String razorpaySignature;
  @override
  final String method;

  @override
  String toString() {
    return 'PaymentDetails(razorpayPaymentId: $razorpayPaymentId, razorpayOrderId: $razorpayOrderId, razorpaySignature: $razorpaySignature, method: $method)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDetailsImpl &&
            (identical(other.razorpayPaymentId, razorpayPaymentId) ||
                other.razorpayPaymentId == razorpayPaymentId) &&
            (identical(other.razorpayOrderId, razorpayOrderId) ||
                other.razorpayOrderId == razorpayOrderId) &&
            (identical(other.razorpaySignature, razorpaySignature) ||
                other.razorpaySignature == razorpaySignature) &&
            (identical(other.method, method) || other.method == method));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, razorpayPaymentId,
      razorpayOrderId, razorpaySignature, method);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDetailsImplCopyWith<_$PaymentDetailsImpl> get copyWith =>
      __$$PaymentDetailsImplCopyWithImpl<_$PaymentDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDetailsImplToJson(
      this,
    );
  }
}

abstract class _PaymentDetails implements PaymentDetails {
  const factory _PaymentDetails(
      {@JsonKey(name: 'razorpay_payment_id')
      required final String razorpayPaymentId,
      @JsonKey(name: 'razorpay_order_id') required final String razorpayOrderId,
      @JsonKey(name: 'razorpay_signature')
      required final String razorpaySignature,
      required final String method}) = _$PaymentDetailsImpl;

  factory _PaymentDetails.fromJson(Map<String, dynamic> json) =
      _$PaymentDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'razorpay_payment_id')
  String get razorpayPaymentId;
  @override
  @JsonKey(name: 'razorpay_order_id')
  String get razorpayOrderId;
  @override
  @JsonKey(name: 'razorpay_signature')
  String get razorpaySignature;
  @override
  String get method;
  @override
  @JsonKey(ignore: true)
  _$$PaymentDetailsImplCopyWith<_$PaymentDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentConfirmResponse _$PaymentConfirmResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentConfirmResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentConfirmResponse {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'razorpay_payment_id')
  String? get razorpayPaymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'razorpay_order_id')
  String? get razorpayOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'razorpay_signature')
  String? get razorpaySignature => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_method')
  String get paymentMethod => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_for')
  String get paymentFor => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_id')
  String? get entityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentConfirmResponseCopyWith<PaymentConfirmResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentConfirmResponseCopyWith<$Res> {
  factory $PaymentConfirmResponseCopyWith(PaymentConfirmResponse value,
          $Res Function(PaymentConfirmResponse) then) =
      _$PaymentConfirmResponseCopyWithImpl<$Res, PaymentConfirmResponse>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      double amount,
      String currency,
      @JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId,
      @JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,
      @JsonKey(name: 'razorpay_signature') String? razorpaySignature,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'payment_method') String paymentMethod,
      String status,
      @JsonKey(name: 'payment_for') String paymentFor,
      @JsonKey(name: 'entity_id') String? entityId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$PaymentConfirmResponseCopyWithImpl<$Res,
        $Val extends PaymentConfirmResponse>
    implements $PaymentConfirmResponseCopyWith<$Res> {
  _$PaymentConfirmResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? currency = null,
    Object? razorpayPaymentId = freezed,
    Object? razorpayOrderId = freezed,
    Object? razorpaySignature = freezed,
    Object? transactionId = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paymentFor = null,
    Object? entityId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      razorpayPaymentId: freezed == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorpayOrderId: freezed == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorpaySignature: freezed == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentFor: null == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentConfirmResponseImplCopyWith<$Res>
    implements $PaymentConfirmResponseCopyWith<$Res> {
  factory _$$PaymentConfirmResponseImplCopyWith(
          _$PaymentConfirmResponseImpl value,
          $Res Function(_$PaymentConfirmResponseImpl) then) =
      __$$PaymentConfirmResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      double amount,
      String currency,
      @JsonKey(name: 'razorpay_payment_id') String? razorpayPaymentId,
      @JsonKey(name: 'razorpay_order_id') String? razorpayOrderId,
      @JsonKey(name: 'razorpay_signature') String? razorpaySignature,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'payment_method') String paymentMethod,
      String status,
      @JsonKey(name: 'payment_for') String paymentFor,
      @JsonKey(name: 'entity_id') String? entityId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$PaymentConfirmResponseImplCopyWithImpl<$Res>
    extends _$PaymentConfirmResponseCopyWithImpl<$Res,
        _$PaymentConfirmResponseImpl>
    implements _$$PaymentConfirmResponseImplCopyWith<$Res> {
  __$$PaymentConfirmResponseImplCopyWithImpl(
      _$PaymentConfirmResponseImpl _value,
      $Res Function(_$PaymentConfirmResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? amount = null,
    Object? currency = null,
    Object? razorpayPaymentId = freezed,
    Object? razorpayOrderId = freezed,
    Object? razorpaySignature = freezed,
    Object? transactionId = null,
    Object? paymentMethod = null,
    Object? status = null,
    Object? paymentFor = null,
    Object? entityId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$PaymentConfirmResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      razorpayPaymentId: freezed == razorpayPaymentId
          ? _value.razorpayPaymentId
          : razorpayPaymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorpayOrderId: freezed == razorpayOrderId
          ? _value.razorpayOrderId
          : razorpayOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      razorpaySignature: freezed == razorpaySignature
          ? _value.razorpaySignature
          : razorpaySignature // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      paymentFor: null == paymentFor
          ? _value.paymentFor
          : paymentFor // ignore: cast_nullable_to_non_nullable
              as String,
      entityId: freezed == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentConfirmResponseImpl implements _PaymentConfirmResponse {
  const _$PaymentConfirmResponseImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.amount,
      required this.currency,
      @JsonKey(name: 'razorpay_payment_id') this.razorpayPaymentId,
      @JsonKey(name: 'razorpay_order_id') this.razorpayOrderId,
      @JsonKey(name: 'razorpay_signature') this.razorpaySignature,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      required this.status,
      @JsonKey(name: 'payment_for') required this.paymentFor,
      @JsonKey(name: 'entity_id') this.entityId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$PaymentConfirmResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentConfirmResponseImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final double amount;
  @override
  final String currency;
  @override
  @JsonKey(name: 'razorpay_payment_id')
  final String? razorpayPaymentId;
  @override
  @JsonKey(name: 'razorpay_order_id')
  final String? razorpayOrderId;
  @override
  @JsonKey(name: 'razorpay_signature')
  final String? razorpaySignature;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  final String status;
  @override
  @JsonKey(name: 'payment_for')
  final String paymentFor;
  @override
  @JsonKey(name: 'entity_id')
  final String? entityId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'PaymentConfirmResponse(id: $id, userId: $userId, amount: $amount, currency: $currency, razorpayPaymentId: $razorpayPaymentId, razorpayOrderId: $razorpayOrderId, razorpaySignature: $razorpaySignature, transactionId: $transactionId, paymentMethod: $paymentMethod, status: $status, paymentFor: $paymentFor, entityId: $entityId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentConfirmResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.razorpayPaymentId, razorpayPaymentId) ||
                other.razorpayPaymentId == razorpayPaymentId) &&
            (identical(other.razorpayOrderId, razorpayOrderId) ||
                other.razorpayOrderId == razorpayOrderId) &&
            (identical(other.razorpaySignature, razorpaySignature) ||
                other.razorpaySignature == razorpaySignature) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentFor, paymentFor) ||
                other.paymentFor == paymentFor) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
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
      userId,
      amount,
      currency,
      razorpayPaymentId,
      razorpayOrderId,
      razorpaySignature,
      transactionId,
      paymentMethod,
      status,
      paymentFor,
      entityId,
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentConfirmResponseImplCopyWith<_$PaymentConfirmResponseImpl>
      get copyWith => __$$PaymentConfirmResponseImplCopyWithImpl<
          _$PaymentConfirmResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentConfirmResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentConfirmResponse implements PaymentConfirmResponse {
  const factory _PaymentConfirmResponse(
          {required final String id,
          @JsonKey(name: 'user_id') required final String userId,
          required final double amount,
          required final String currency,
          @JsonKey(name: 'razorpay_payment_id') final String? razorpayPaymentId,
          @JsonKey(name: 'razorpay_order_id') final String? razorpayOrderId,
          @JsonKey(name: 'razorpay_signature') final String? razorpaySignature,
          @JsonKey(name: 'transaction_id') required final String transactionId,
          @JsonKey(name: 'payment_method') required final String paymentMethod,
          required final String status,
          @JsonKey(name: 'payment_for') required final String paymentFor,
          @JsonKey(name: 'entity_id') final String? entityId,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$PaymentConfirmResponseImpl;

  factory _PaymentConfirmResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentConfirmResponseImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  double get amount;
  @override
  String get currency;
  @override
  @JsonKey(name: 'razorpay_payment_id')
  String? get razorpayPaymentId;
  @override
  @JsonKey(name: 'razorpay_order_id')
  String? get razorpayOrderId;
  @override
  @JsonKey(name: 'razorpay_signature')
  String? get razorpaySignature;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @override
  String get status;
  @override
  @JsonKey(name: 'payment_for')
  String get paymentFor;
  @override
  @JsonKey(name: 'entity_id')
  String? get entityId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$PaymentConfirmResponseImplCopyWith<_$PaymentConfirmResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
