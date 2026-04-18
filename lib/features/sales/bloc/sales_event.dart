part of 'sales_bloc.dart';

@freezed
class SalesEvent with _$SalesEvent {
  const factory SalesEvent.reset() = _Reset;
  const factory SalesEvent.getSalesEvent({
    String? location,
    String? propertyType,
    double? minPrice,
    double? maxPrice,
    String? search,
    int? limit,
    int? offset,
  }) = _GetSalesEvent;

  const factory SalesEvent.getSaleDetailsEvent({required String projectId}) =
      _GetSaleDetailsEvent;

  const factory SalesEvent.getSalesProjectsByUserId({
    required String userId,
    int? page,
    int? pageSize,
  }) = _GetSalesProjectsByUserIdEvent;

  const factory SalesEvent.isLoading() = _IsLoading;

  // Save details from the first step (form screen)
  const factory SalesEvent.updateSalesDetails({
    required CreateSalesDataModel createSalesDataModel,
  }) = _UpdateSalesDetailsEvent;

  // Save media details from the second step (images/brochure)
  const factory SalesEvent.updateSalesMedia({
    required CreateSalesDataModel createSalesDataModel,
  }) = _UpdateSalesMediaEvent;

  const factory SalesEvent.createSalesProject({
    required String propertyType,
    required String projectName,
    String? rera,
    required num area,
    required String areaUnit,
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
    File? brochure,
  }) = _CreateSalesProjectEvent;

  const factory SalesEvent.requestCallback({required String salesProjectId}) =
      _RequestCallbackEvent;

  const factory SalesEvent.getProjectUnits({required String projectId}) =
      _GetProjectUnitsEvent;

  const factory SalesEvent.addProjectUnit({
    required String projectId,
    required Map<String, dynamic> data,
  }) = _AddProjectUnitEvent;

  const factory SalesEvent.editProjectUnit({
    required String unitId,
    required String projectId,
    required Map<String, dynamic> data,
  }) = _EditProjectUnitEvent;

  const factory SalesEvent.getProjectCallbacks({
    required String projectId,
  }) = _GetProjectCallbacksEvent;

  const factory SalesEvent.deleteCallback({
    required String callbackId,
    required String projectId,
  }) = _DeleteCallbackEvent;
}
