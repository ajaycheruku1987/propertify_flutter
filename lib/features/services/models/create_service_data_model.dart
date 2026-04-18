import 'dart:io';

class CreateServiceDataModel {
  final String? agentShopName;
  final String? description;
  final List<String>? categories;
  final String? address;
  final String? city;
  final String? state;
  final String? pincode;
  final List<File>? imageFiles;
  final String? facebook;
  final String? insta;
  final String? twitter;
  final String? website;
  final String? phoneNumber;
  final String? email;
  final double? latitude;
  final double? longitude;

  CreateServiceDataModel({
    this.agentShopName,
    this.description,
    this.categories,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.imageFiles,
    this.facebook,
    this.insta,
    this.twitter,
    this.website,
    this.phoneNumber,
    this.email,
    this.latitude,
    this.longitude,
  });

  CreateServiceDataModel copyWith({
    String? agentShopName,
    String? description,
    List<String>? categories,
    String? address,
    String? city,
    String? state,
    String? pincode,
    List<File>? imageFiles,
    String? facebook,
    String? insta,
    String? twitter,
    String? website,
    String? phoneNumber,
    String? email,
    double? latitude,
    double? longitude,
  }) {
    return CreateServiceDataModel(
      agentShopName: agentShopName ?? this.agentShopName,
      description: description ?? this.description,
      categories: categories ?? this.categories,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      imageFiles: imageFiles ?? this.imageFiles,
      facebook: facebook ?? this.facebook,
      insta: insta ?? this.insta,
      twitter: twitter ?? this.twitter,
      website: website ?? this.website,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'agentShopName': agentShopName,
      'description': description,
      'categories': categories,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'imageFiles': imageFiles,
      'facebook': facebook,
      'insta': insta,
      'twitter': twitter,
      'website': website,
      'phoneNumber': phoneNumber,
      'email': email,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory CreateServiceDataModel.fromJson(Map<String, dynamic> json) {
    return CreateServiceDataModel(
      agentShopName: json['agentShopName'],
      description: json['description'],
      categories: json['categories'] != null
          ? List<String>.from(json['categories'])
          : null,
      address: json['address'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      imageFiles: json['imageFiles'] != null
          ? List<File>.from(json['imageFiles'])
          : null,
      facebook: json['facebook'],
      insta: json['insta'],
      twitter: json['twitter'],
      website: json['website'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
    );
  }
}
