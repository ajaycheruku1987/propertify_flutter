part of 'sales_bloc.dart';

@freezed
class SalesEvent with _$SalesEvent {
  const SalesEvent._();

  const factory SalesEvent.reset() = _Reset;
  const factory SalesEvent.getSalesEvent({
    List<String>? propertyTypes,
    String? city,
    double? latitude,
    double? longitude,
    double? radiusKm,
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

class CreateSalesProjectEvent extends SalesEvent {
  final String propertyType;
  final String projectName;
  final String? rera;
  final num area;
  final String areaUnit;
  final int? noOfUnits;
  final int? noOfFloors;
  final String? description;
  final String? specifications;
  final String? address;
  final String? city;
  final String? state;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? publicFacilities;
  final num? minPrice;
  final num? maxPrice;
  final String? saleSpecification;
  final String? possessionDate;
  final List<File>? images;
  final File? brochure;

  const CreateSalesProjectEvent({
    required this.propertyType,
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
    this.images,
    this.brochure,
  }) : super._();
}

class UpdateSalesProjectEvent extends SalesEvent {
  final String projectId;
  final String propertyType;
  final String projectName;
  final String? rera;
  final num area;
  final String areaUnit;
  final int? noOfUnits;
  final int? noOfFloors;
  final String? description;
  final String? specifications;
  final String? address;
  final String? city;
  final String? state;
  final String? location;
  final double? latitude;
  final double? longitude;
  final String? publicFacilities;
  final num? minPrice;
  final num? maxPrice;
  final String? saleSpecification;
  final String? possessionDate;
  final List<File>? images;
  final File? brochure;

  const UpdateSalesProjectEvent({
    required this.projectId,
    required this.propertyType,
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
    this.images,
    this.brochure,
  }) : super._();
}

class DeleteSalesProjectEvent extends SalesEvent {
  final String projectId;
  const DeleteSalesProjectEvent({required this.projectId}) : super._();
}

class DeleteProjectUnitEvent extends SalesEvent {
  final String unitId;
  final String projectId;
  const DeleteProjectUnitEvent({required this.unitId, required this.projectId}) : super._();
}
