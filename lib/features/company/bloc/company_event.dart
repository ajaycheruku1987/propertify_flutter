part of 'company_bloc.dart';

@Freezed()
class CompanyEvent with _$CompanyEvent {
  const factory CompanyEvent.started() = _CompanyStarted;

  const factory CompanyEvent.resetState() = _ResetState;

  const factory CompanyEvent.companyNameChanged({required String companyName}) =
      _CompanyNameChanged;

  const factory CompanyEvent.categoryChanged({required String category}) =
      _CategoryChanged;

  const factory CompanyEvent.aboutCompanyChanged({
    required String aboutCompany,
  }) = _AboutCompanyChanged;

  const factory CompanyEvent.socialMediaPlatformSelected({
    required String platform,
  }) = _SocialMediaPlatformSelected;

  const factory CompanyEvent.socialMediaUrlChanged({
    required String platform,
    required String url,
  }) = _SocialMediaUrlChanged;

  const factory CompanyEvent.addressChanged({
    required String address,
    required String city,
    required String state,
    required double latitude,
    required double longitude,
  }) = _AddressChanged;

  const factory CompanyEvent.gstNumberChanged({required String gstNumber}) =
      _GstNumberChanged;

  const factory CompanyEvent.imageChanged({required XFile? image}) =
      _ImageChanged;

  const factory CompanyEvent.validateAndProceed() = _ValidateAndProceed;

  const factory CompanyEvent.createCompany() = _CreateCompany;
  const factory CompanyEvent.getMyCompany() = _GetMyCompany;
  const factory CompanyEvent.getUserCompany({required String userId}) =
      _GetUserCompany;
}
