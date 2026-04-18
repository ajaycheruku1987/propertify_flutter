// To parse this JSON data, do
//
//     final requestResponseModel = requestResponseModelFromJson(jsonString);

import 'dart:convert';

List<RequestResponseModel> requestResponseModelFromJson(String str) =>
    List<RequestResponseModel>.from(
      json.decode(str).map((x) => RequestResponseModel.fromJson(x)),
    );

String requestResponseModelToJson(List<RequestResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RequestResponseModel {
  String? title;
  String? category;
  String? state;
  String? city;
  String? address;
  String? description;
  double? budget;
  double? latitude;
  double? longitude;
  bool? termsAgreed;
  String? id;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;
  Owner? owner;

  RequestResponseModel({
    this.title,
    this.category,
    this.state,
    this.city,
    this.address,
    this.description,
    this.budget,
    this.latitude,
    this.longitude,
    this.termsAgreed,
    this.id,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.owner,
  });

  RequestResponseModel copyWith({
    String? title,
    String? category,
    String? state,
    String? city,
    String? address,
    String? description,
    double? budget,
    double? latitude,
    double? longitude,
    bool? termsAgreed,
    String? id,
    String? phoneNumber,
    String? createdAt,
    String? updatedAt,
    Owner? owner,
  }) => RequestResponseModel(
    title: title ?? this.title,
    category: category ?? this.category,
    state: state ?? this.state,
    city: city ?? this.city,
    address: address ?? this.address,
    description: description ?? this.description,
    budget: budget ?? this.budget,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    termsAgreed: termsAgreed ?? this.termsAgreed,
    id: id ?? this.id,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    owner: owner ?? this.owner,
  );

  factory RequestResponseModel.fromJson(Map<String, dynamic> json) =>
      RequestResponseModel(
        title: json["title"],
        category: json["category"],
        state: json["state"],
        city: json["city"],
        address: json["address"],
        description: json["description"],
        budget: json["budget"]?.toDouble(),
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        termsAgreed: json["terms_agreed"],
        id: json["id"],
        phoneNumber: json["phone_number"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
    "title": title,
    "category": category,
    "state": state,
    "city": city,
    "address": address,
    "description": description,
    "budget": budget,
    "latitude": latitude,
    "longitude": longitude,
    "terms_agreed": termsAgreed,
    "id": id,
    "phone_number": phoneNumber,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "owner": owner?.toJson(),
  };
}

class Owner {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  DateTime? dateOfBirth;
  String? username;

  Owner({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.dateOfBirth,
    this.username,
  });

  Owner copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? username,
  }) => Owner(
    id: id ?? this.id,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    username: username ?? this.username,
  );

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    dateOfBirth: json["date_of_birth"] == null
        ? null
        : DateTime.parse(json["date_of_birth"]),
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone_number": phoneNumber,
    "date_of_birth":
        "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "username": username,
  };
}
