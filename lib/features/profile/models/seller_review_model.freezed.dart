// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SellerReviewResponseModel {
  @JsonKey(name: "seller_id")
  String? get sellerId => throw _privateConstructorUsedError;
  @JsonKey(name: "average_rating")
  double? get averageRating => throw _privateConstructorUsedError;
  @JsonKey(name: "total_reviews")
  int? get totalReviews => throw _privateConstructorUsedError;
  @JsonKey(name: "rating_distribution")
  Map<String, int>? get ratingDistribution =>
      throw _privateConstructorUsedError;
  @JsonKey(name: "my_review")
  SellerReviewItem? get myReview => throw _privateConstructorUsedError;
  @JsonKey(name: "reviews")
  List<SellerReviewItem>? get reviews => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellerReviewResponseModelCopyWith<SellerReviewResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerReviewResponseModelCopyWith<$Res> {
  factory $SellerReviewResponseModelCopyWith(SellerReviewResponseModel value,
          $Res Function(SellerReviewResponseModel) then) =
      _$SellerReviewResponseModelCopyWithImpl<$Res, SellerReviewResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "seller_id") String? sellerId,
      @JsonKey(name: "average_rating") double? averageRating,
      @JsonKey(name: "total_reviews") int? totalReviews,
      @JsonKey(name: "rating_distribution")
      Map<String, int>? ratingDistribution,
      @JsonKey(name: "my_review") SellerReviewItem? myReview,
      @JsonKey(name: "reviews") List<SellerReviewItem>? reviews});

  $SellerReviewItemCopyWith<$Res>? get myReview;
}

/// @nodoc
class _$SellerReviewResponseModelCopyWithImpl<$Res,
        $Val extends SellerReviewResponseModel>
    implements $SellerReviewResponseModelCopyWith<$Res> {
  _$SellerReviewResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = freezed,
    Object? averageRating = freezed,
    Object? totalReviews = freezed,
    Object? ratingDistribution = freezed,
    Object? myReview = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_value.copyWith(
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      totalReviews: freezed == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingDistribution: freezed == ratingDistribution
          ? _value.ratingDistribution
          : ratingDistribution // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      myReview: freezed == myReview
          ? _value.myReview
          : myReview // ignore: cast_nullable_to_non_nullable
              as SellerReviewItem?,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<SellerReviewItem>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SellerReviewItemCopyWith<$Res>? get myReview {
    if (_value.myReview == null) {
      return null;
    }

    return $SellerReviewItemCopyWith<$Res>(_value.myReview!, (value) {
      return _then(_value.copyWith(myReview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SellerReviewResponseModelImplCopyWith<$Res>
    implements $SellerReviewResponseModelCopyWith<$Res> {
  factory _$$SellerReviewResponseModelImplCopyWith(
          _$SellerReviewResponseModelImpl value,
          $Res Function(_$SellerReviewResponseModelImpl) then) =
      __$$SellerReviewResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "seller_id") String? sellerId,
      @JsonKey(name: "average_rating") double? averageRating,
      @JsonKey(name: "total_reviews") int? totalReviews,
      @JsonKey(name: "rating_distribution")
      Map<String, int>? ratingDistribution,
      @JsonKey(name: "my_review") SellerReviewItem? myReview,
      @JsonKey(name: "reviews") List<SellerReviewItem>? reviews});

  @override
  $SellerReviewItemCopyWith<$Res>? get myReview;
}

/// @nodoc
class __$$SellerReviewResponseModelImplCopyWithImpl<$Res>
    extends _$SellerReviewResponseModelCopyWithImpl<$Res,
        _$SellerReviewResponseModelImpl>
    implements _$$SellerReviewResponseModelImplCopyWith<$Res> {
  __$$SellerReviewResponseModelImplCopyWithImpl(
      _$SellerReviewResponseModelImpl _value,
      $Res Function(_$SellerReviewResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sellerId = freezed,
    Object? averageRating = freezed,
    Object? totalReviews = freezed,
    Object? ratingDistribution = freezed,
    Object? myReview = freezed,
    Object? reviews = freezed,
  }) {
    return _then(_$SellerReviewResponseModelImpl(
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      averageRating: freezed == averageRating
          ? _value.averageRating
          : averageRating // ignore: cast_nullable_to_non_nullable
              as double?,
      totalReviews: freezed == totalReviews
          ? _value.totalReviews
          : totalReviews // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingDistribution: freezed == ratingDistribution
          ? _value._ratingDistribution
          : ratingDistribution // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
      myReview: freezed == myReview
          ? _value.myReview
          : myReview // ignore: cast_nullable_to_non_nullable
              as SellerReviewItem?,
      reviews: freezed == reviews
          ? _value._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<SellerReviewItem>?,
    ));
  }
}

/// @nodoc

class _$SellerReviewResponseModelImpl extends _SellerReviewResponseModel {
  const _$SellerReviewResponseModelImpl(
      {@JsonKey(name: "seller_id") this.sellerId,
      @JsonKey(name: "average_rating") this.averageRating,
      @JsonKey(name: "total_reviews") this.totalReviews,
      @JsonKey(name: "rating_distribution")
      final Map<String, int>? ratingDistribution,
      @JsonKey(name: "my_review") this.myReview,
      @JsonKey(name: "reviews") final List<SellerReviewItem>? reviews})
      : _ratingDistribution = ratingDistribution,
        _reviews = reviews,
        super._();

  @override
  @JsonKey(name: "seller_id")
  final String? sellerId;
  @override
  @JsonKey(name: "average_rating")
  final double? averageRating;
  @override
  @JsonKey(name: "total_reviews")
  final int? totalReviews;
  final Map<String, int>? _ratingDistribution;
  @override
  @JsonKey(name: "rating_distribution")
  Map<String, int>? get ratingDistribution {
    final value = _ratingDistribution;
    if (value == null) return null;
    if (_ratingDistribution is EqualUnmodifiableMapView)
      return _ratingDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: "my_review")
  final SellerReviewItem? myReview;
  final List<SellerReviewItem>? _reviews;
  @override
  @JsonKey(name: "reviews")
  List<SellerReviewItem>? get reviews {
    final value = _reviews;
    if (value == null) return null;
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SellerReviewResponseModel(sellerId: $sellerId, averageRating: $averageRating, totalReviews: $totalReviews, ratingDistribution: $ratingDistribution, myReview: $myReview, reviews: $reviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerReviewResponseModelImpl &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.averageRating, averageRating) ||
                other.averageRating == averageRating) &&
            (identical(other.totalReviews, totalReviews) ||
                other.totalReviews == totalReviews) &&
            const DeepCollectionEquality()
                .equals(other._ratingDistribution, _ratingDistribution) &&
            (identical(other.myReview, myReview) ||
                other.myReview == myReview) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sellerId,
      averageRating,
      totalReviews,
      const DeepCollectionEquality().hash(_ratingDistribution),
      myReview,
      const DeepCollectionEquality().hash(_reviews));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerReviewResponseModelImplCopyWith<_$SellerReviewResponseModelImpl>
      get copyWith => __$$SellerReviewResponseModelImplCopyWithImpl<
          _$SellerReviewResponseModelImpl>(this, _$identity);
}

abstract class _SellerReviewResponseModel extends SellerReviewResponseModel {
  const factory _SellerReviewResponseModel(
          {@JsonKey(name: "seller_id") final String? sellerId,
          @JsonKey(name: "average_rating") final double? averageRating,
          @JsonKey(name: "total_reviews") final int? totalReviews,
          @JsonKey(name: "rating_distribution")
          final Map<String, int>? ratingDistribution,
          @JsonKey(name: "my_review") final SellerReviewItem? myReview,
          @JsonKey(name: "reviews") final List<SellerReviewItem>? reviews}) =
      _$SellerReviewResponseModelImpl;
  const _SellerReviewResponseModel._() : super._();

  @override
  @JsonKey(name: "seller_id")
  String? get sellerId;
  @override
  @JsonKey(name: "average_rating")
  double? get averageRating;
  @override
  @JsonKey(name: "total_reviews")
  int? get totalReviews;
  @override
  @JsonKey(name: "rating_distribution")
  Map<String, int>? get ratingDistribution;
  @override
  @JsonKey(name: "my_review")
  SellerReviewItem? get myReview;
  @override
  @JsonKey(name: "reviews")
  List<SellerReviewItem>? get reviews;
  @override
  @JsonKey(ignore: true)
  _$$SellerReviewResponseModelImplCopyWith<_$SellerReviewResponseModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SellerReviewItem {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "rating")
  double? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "review")
  String? get review => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "reviewer")
  ReviewerUser? get reviewer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SellerReviewItemCopyWith<SellerReviewItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerReviewItemCopyWith<$Res> {
  factory $SellerReviewItemCopyWith(
          SellerReviewItem value, $Res Function(SellerReviewItem) then) =
      _$SellerReviewItemCopyWithImpl<$Res, SellerReviewItem>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "rating") double? rating,
      @JsonKey(name: "review") String? review,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "reviewer") ReviewerUser? reviewer});

  $ReviewerUserCopyWith<$Res>? get reviewer;
}

/// @nodoc
class _$SellerReviewItemCopyWithImpl<$Res, $Val extends SellerReviewItem>
    implements $SellerReviewItemCopyWith<$Res> {
  _$SellerReviewItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? createdAt = freezed,
    Object? reviewer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewer: freezed == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as ReviewerUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewerUserCopyWith<$Res>? get reviewer {
    if (_value.reviewer == null) {
      return null;
    }

    return $ReviewerUserCopyWith<$Res>(_value.reviewer!, (value) {
      return _then(_value.copyWith(reviewer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SellerReviewItemImplCopyWith<$Res>
    implements $SellerReviewItemCopyWith<$Res> {
  factory _$$SellerReviewItemImplCopyWith(_$SellerReviewItemImpl value,
          $Res Function(_$SellerReviewItemImpl) then) =
      __$$SellerReviewItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "rating") double? rating,
      @JsonKey(name: "review") String? review,
      @JsonKey(name: "created_at") String? createdAt,
      @JsonKey(name: "reviewer") ReviewerUser? reviewer});

  @override
  $ReviewerUserCopyWith<$Res>? get reviewer;
}

/// @nodoc
class __$$SellerReviewItemImplCopyWithImpl<$Res>
    extends _$SellerReviewItemCopyWithImpl<$Res, _$SellerReviewItemImpl>
    implements _$$SellerReviewItemImplCopyWith<$Res> {
  __$$SellerReviewItemImplCopyWithImpl(_$SellerReviewItemImpl _value,
      $Res Function(_$SellerReviewItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? createdAt = freezed,
    Object? reviewer = freezed,
  }) {
    return _then(_$SellerReviewItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      reviewer: freezed == reviewer
          ? _value.reviewer
          : reviewer // ignore: cast_nullable_to_non_nullable
              as ReviewerUser?,
    ));
  }
}

/// @nodoc

class _$SellerReviewItemImpl extends _SellerReviewItem {
  const _$SellerReviewItemImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "rating") this.rating,
      @JsonKey(name: "review") this.review,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "reviewer") this.reviewer})
      : super._();

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "rating")
  final double? rating;
  @override
  @JsonKey(name: "review")
  final String? review;
  @override
  @JsonKey(name: "created_at")
  final String? createdAt;
  @override
  @JsonKey(name: "reviewer")
  final ReviewerUser? reviewer;

  @override
  String toString() {
    return 'SellerReviewItem(id: $id, rating: $rating, review: $review, createdAt: $createdAt, reviewer: $reviewer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerReviewItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.reviewer, reviewer) ||
                other.reviewer == reviewer));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, rating, review, createdAt, reviewer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerReviewItemImplCopyWith<_$SellerReviewItemImpl> get copyWith =>
      __$$SellerReviewItemImplCopyWithImpl<_$SellerReviewItemImpl>(
          this, _$identity);
}

abstract class _SellerReviewItem extends SellerReviewItem {
  const factory _SellerReviewItem(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "rating") final double? rating,
          @JsonKey(name: "review") final String? review,
          @JsonKey(name: "created_at") final String? createdAt,
          @JsonKey(name: "reviewer") final ReviewerUser? reviewer}) =
      _$SellerReviewItemImpl;
  const _SellerReviewItem._() : super._();

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "rating")
  double? get rating;
  @override
  @JsonKey(name: "review")
  String? get review;
  @override
  @JsonKey(name: "created_at")
  String? get createdAt;
  @override
  @JsonKey(name: "reviewer")
  ReviewerUser? get reviewer;
  @override
  @JsonKey(ignore: true)
  _$$SellerReviewItemImplCopyWith<_$SellerReviewItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewerUser {
  @JsonKey(name: "id")
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  dynamic get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  dynamic get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "profilepic")
  String? get profilepic => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewerUserCopyWith<ReviewerUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewerUserCopyWith<$Res> {
  factory $ReviewerUserCopyWith(
          ReviewerUser value, $Res Function(ReviewerUser) then) =
      _$ReviewerUserCopyWithImpl<$Res, ReviewerUser>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "first_name") dynamic firstName,
      @JsonKey(name: "last_name") dynamic lastName,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "profilepic") String? profilepic});
}

/// @nodoc
class _$ReviewerUserCopyWithImpl<$Res, $Val extends ReviewerUser>
    implements $ReviewerUserCopyWith<$Res> {
  _$ReviewerUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
    Object? profilepic = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewerUserImplCopyWith<$Res>
    implements $ReviewerUserCopyWith<$Res> {
  factory _$$ReviewerUserImplCopyWith(
          _$ReviewerUserImpl value, $Res Function(_$ReviewerUserImpl) then) =
      __$$ReviewerUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") String? id,
      @JsonKey(name: "first_name") dynamic firstName,
      @JsonKey(name: "last_name") dynamic lastName,
      @JsonKey(name: "username") String? username,
      @JsonKey(name: "profilepic") String? profilepic});
}

/// @nodoc
class __$$ReviewerUserImplCopyWithImpl<$Res>
    extends _$ReviewerUserCopyWithImpl<$Res, _$ReviewerUserImpl>
    implements _$$ReviewerUserImplCopyWith<$Res> {
  __$$ReviewerUserImplCopyWithImpl(
      _$ReviewerUserImpl _value, $Res Function(_$ReviewerUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? username = freezed,
    Object? profilepic = freezed,
  }) {
    return _then(_$ReviewerUserImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilepic: freezed == profilepic
          ? _value.profilepic
          : profilepic // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ReviewerUserImpl extends _ReviewerUser {
  const _$ReviewerUserImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "username") this.username,
      @JsonKey(name: "profilepic") this.profilepic})
      : super._();

  @override
  @JsonKey(name: "id")
  final String? id;
  @override
  @JsonKey(name: "first_name")
  final dynamic firstName;
  @override
  @JsonKey(name: "last_name")
  final dynamic lastName;
  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "profilepic")
  final String? profilepic;

  @override
  String toString() {
    return 'ReviewerUser(id: $id, firstName: $firstName, lastName: $lastName, username: $username, profilepic: $profilepic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewerUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilepic, profilepic) ||
                other.profilepic == profilepic));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      username,
      profilepic);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewerUserImplCopyWith<_$ReviewerUserImpl> get copyWith =>
      __$$ReviewerUserImplCopyWithImpl<_$ReviewerUserImpl>(this, _$identity);
}

abstract class _ReviewerUser extends ReviewerUser {
  const factory _ReviewerUser(
          {@JsonKey(name: "id") final String? id,
          @JsonKey(name: "first_name") final dynamic firstName,
          @JsonKey(name: "last_name") final dynamic lastName,
          @JsonKey(name: "username") final String? username,
          @JsonKey(name: "profilepic") final String? profilepic}) =
      _$ReviewerUserImpl;
  const _ReviewerUser._() : super._();

  @override
  @JsonKey(name: "id")
  String? get id;
  @override
  @JsonKey(name: "first_name")
  dynamic get firstName;
  @override
  @JsonKey(name: "last_name")
  dynamic get lastName;
  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "profilepic")
  String? get profilepic;
  @override
  @JsonKey(ignore: true)
  _$$ReviewerUserImplCopyWith<_$ReviewerUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
