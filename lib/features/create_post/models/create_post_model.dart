class CreatePostModel {
  final String id;
  final String propertyType;
  final String lookingFor;
  final String address;
  final String location;
  final String price;
  final DateTime createdAt;
  final String userId;
  final String status;
  final double? latitude;
  final double? longitude;

  const CreatePostModel({
    required this.id,
    required this.propertyType,
    required this.lookingFor,
    required this.address,
    required this.location,
    required this.price,
    required this.createdAt,
    required this.userId,
    this.status = 'draft',
    this.latitude,
    this.longitude,
  });

  factory CreatePostModel.fromJson(Map<String, dynamic> json) {
    return CreatePostModel(
      id: json['id'] ?? '',
      propertyType: json['propertyType'] ?? '',
      lookingFor: json['lookingFor'] ?? '',
      address: json['address'] ?? '',
      location: json['location'] ?? '',
      price: json['price'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? DateTime.now().toIso8601String()),
      userId: json['userId'] ?? '',
      status: json['status'] ?? 'draft',
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'propertyType': propertyType,
      'lookingFor': lookingFor,
      'address': address,
      'location': location,
      'price': price,
      'createdAt': createdAt.toIso8601String(),
      'userId': userId,
      'status': status,
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  CreatePostModel copyWith({
    String? id,
    String? propertyType,
    String? lookingFor,
    String? address,
    String? location,
    String? price,
    DateTime? createdAt,
    String? userId,
    String? status,
    double? latitude,
    double? longitude,
  }) {
    return CreatePostModel(
      id: id ?? this.id,
      propertyType: propertyType ?? this.propertyType,
      lookingFor: lookingFor ?? this.lookingFor,
      address: address ?? this.address,
      location: location ?? this.location,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      userId: userId ?? this.userId,
      status: status ?? this.status,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}