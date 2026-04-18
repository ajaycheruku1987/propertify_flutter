part of 'company_bloc.dart';

@Freezed()
class CompanyState with _$CompanyState {
  const factory CompanyState({
    @Default('') String companyName,
    @Default('') String selectedCategory,
    @Default('') String aboutCompany,
    @Default('Facebook') String selectedSocialMediaPlatform,
    @Default('') String websiteUrl,
    @Default('') String facebookUrl,
    @Default('') String instagramUrl,
    @Default('') String twitterUrl,
    @Default('') String address,
    @Default('') String city,
    @Default('') String state,
    @Default('') String gstNumber,
    XFile? selectedImage,
    double? latitude,
    double? longitude,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isValid,
    CreateCompanyResponse? createCompanyResponse,
    MyCompanyResponseModel? myCompany,
    MyCompanyResponseModel? userCompany,
  }) = _CompanyState;
}
