import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propertify/core/api_request/api_request.dart';
import 'package:propertify/core/failure.dart';
import 'package:propertify/core/service_locator.dart';
import 'package:propertify/features/company/models/create_company_response.dart';
import 'package:propertify/features/company/models/my_company_response_model.dart';
import 'package:propertify/utils/extensions/http_extension.dart';
import 'package:http_parser/http_parser.dart';

abstract class CompanyRepository {
  Future<Either<Failure, dynamic>> createCompany({
    required String companyName,
    required String category,
    required String address,
    required String city,
    required String state,
    String? aboutCompany,
    String? websiteUrl,
    String? facebookUrl,
    String? instagramUrl,
    String? twitterUrl,
    XFile? image,
    String? gstNumber,
  });

  Future<List<String>> getCategories();

  Future<Either<Failure, MyCompanyResponseModel>> getMyCompany();
  Future<Either<Failure, List<MyCompanyResponseModel>>> getUserCompany(
    String userId,
  );
}

class CompanyRepositoryImpl implements CompanyRepository {
  final ApiRequest _apiRequest = serviceLocator<ApiRequest>();

  @override
  Future<Either<Failure, dynamic>> createCompany({
    required String companyName,
    required String category,
    required String address,
    required String city,
    required String state,
    String? aboutCompany,
    String? websiteUrl,
    String? facebookUrl,
    String? instagramUrl,
    String? twitterUrl,
    XFile? image,
    String? gstNumber,
  }) async {
    try {
      final Map<String, dynamic> formDataMap = {
        'company_name': companyName,
        'category': category,
        'address': address,
        'city': city,
        'state': state,
      };

      if (aboutCompany != null) formDataMap['about'] = aboutCompany;
      if (websiteUrl != null) formDataMap['website_url'] = websiteUrl;
      if (facebookUrl != null) formDataMap['facebook_url'] = facebookUrl;
      if (instagramUrl != null) formDataMap['instagram_url'] = instagramUrl;
      if (twitterUrl != null) formDataMap['twitter_url'] = twitterUrl;
      if (gstNumber != null) formDataMap['gst_number'] = gstNumber;

      if (image != null) {
        formDataMap['image'] = await MultipartFile.fromFile(
          image.path,
          filename: image.name,
          contentType: MediaType('image', image.path.split('.').last),
        );
      }

      final formData = FormData.fromMap(formDataMap);

      final response = await _apiRequest.post('/companies', data: formData);

      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(CreateCompanyResponse.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<List<String>> getCategories() async {
    // TODO: Implement API call to get categories
    await Future.delayed(const Duration(milliseconds: 500));
    return ['Apartment', 'Villa', 'House', 'Commercial', 'Land', 'Industrial'];
  }

  @override
  Future<Either<Failure, MyCompanyResponseModel>> getMyCompany() async {
    try {
      final response = await _apiRequest.get('/companies/me');
      final responseData = await response.getResponse();
      return responseData.fold(
        (failure) => Left(failure),
        (right) => Right(MyCompanyResponseModel.fromJson(right)),
      );
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MyCompanyResponseModel>>> getUserCompany(
    String userId,
  ) async {
    try {
      final response = await _apiRequest.get(
        '/companies/users/$userId?skip=0&limit=1',
      );
      final responseData = await response.getResponse();
      return responseData.fold((failure) => Left(failure), (right) {
        // Response is now a direct list instead of an object with 'companies' field
        final List<dynamic> companiesJson = right as List<dynamic>;
        final companies = companiesJson
            .map((e) => MyCompanyResponseModel.fromJson(e))
            .toList();
        return Right(companies);
      });
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }
}
