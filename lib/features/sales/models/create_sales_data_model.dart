import 'dart:io';

class CreateSalesDataModel {
  final String? propertyType;
  final String? projectName;
  final String? rera;
  final num? area;
  final String? areaUnit;
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
  final List<File>? imageFiles;
  final File? brochure;

  const CreateSalesDataModel({
    this.propertyType,
    this.projectName,
    this.rera,
    this.area,
    this.areaUnit,
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
    this.imageFiles,
    this.brochure,
  });

  CreateSalesDataModel copyWith({
    String? propertyType,
    String? projectName,
    String? rera,
    num? area,
    String? areaUnit,
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
    List<File>? imageFiles,
    File? brochure,
  }) {
    return CreateSalesDataModel(
      propertyType: propertyType ?? this.propertyType,
      projectName: projectName ?? this.projectName,
      rera: rera ?? this.rera,
      area: area ?? this.area,
      areaUnit: areaUnit ?? this.areaUnit,
      noOfUnits: noOfUnits ?? this.noOfUnits,
      noOfFloors: noOfFloors ?? this.noOfFloors,
      description: description ?? this.description,
      specifications: specifications ?? this.specifications,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      location: location ?? this.location,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      publicFacilities: publicFacilities ?? this.publicFacilities,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      saleSpecification: saleSpecification ?? this.saleSpecification,
      possessionDate: possessionDate ?? this.possessionDate,
      imageFiles: imageFiles ?? this.imageFiles,
      brochure: brochure ?? this.brochure,
    );
  }
}
