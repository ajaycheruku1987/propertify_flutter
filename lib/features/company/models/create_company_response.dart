import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_company_response.freezed.dart';
part 'create_company_response.g.dart';

@freezed
class CreateCompanyResponse with _$CreateCompanyResponse {
  const factory CreateCompanyResponse({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'about') String? about,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'gst_number') String? gstNumber,
    @JsonKey(name: 'facebook_url') String? facebookUrl,
    @JsonKey(name: 'instagram_url') String? instagramUrl,
    @JsonKey(name: 'twitter_url') String? twitterUrl,
    @JsonKey(name: 'website_url') String? websiteUrl,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'owner') Owner? owner,
  }) = _CreateCompanyResponse;

  factory CreateCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCompanyResponseFromJson(json);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'profilepic') String? profilepic,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
