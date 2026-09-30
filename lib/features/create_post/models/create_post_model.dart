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
  final String? plotArea;
  final String? areaUnit;
  final String? facing;
  final String? roadWidth;
  final String? postedBy;
  final String? approvalStatus;
  final String? dimensions;
  final bool? isCornerPlot;
  final bool? isGatedCommunity;

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
    this.plotArea,
    this.areaUnit,
    this.facing,
    this.roadWidth,
    this.postedBy,
    this.approvalStatus,
    this.dimensions,
    this.isCornerPlot,
    this.isGatedCommunity,
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
      plotArea: json['plotArea'] ?? json['plot_area'],
      areaUnit: json['areaUnit'] ?? json['area_unit'],
      facing: json['facing'],
      roadWidth: json['roadWidth'] ?? json['road_width'],
      postedBy: json['postedBy'] ?? json['posted_by'],
      approvalStatus: json['approvalStatus'] ?? json['approval_status'],
      dimensions: json['dimensions'],
      isCornerPlot: json['isCornerPlot'] ?? json['is_corner_plot'],
      isGatedCommunity: json['isGatedCommunity'] ?? json['is_gated_community'],
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
      'plot_area': plotArea,
      'area_unit': areaUnit,
      'facing': facing,
      'road_width': roadWidth,
      'posted_by': postedBy,
      'approval_status': approvalStatus,
      'dimensions': dimensions,
      'is_corner_plot': isCornerPlot,
      'is_gated_community': isGatedCommunity,
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
    String? plotArea,
    String? areaUnit,
    String? facing,
    String? roadWidth,
    String? postedBy,
    String? approvalStatus,
    String? dimensions,
    bool? isCornerPlot,
    bool? isGatedCommunity,
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
      plotArea: plotArea ?? this.plotArea,
      areaUnit: areaUnit ?? this.areaUnit,
      facing: facing ?? this.facing,
      roadWidth: roadWidth ?? this.roadWidth,
      postedBy: postedBy ?? this.postedBy,
      approvalStatus: approvalStatus ?? this.approvalStatus,
      dimensions: dimensions ?? this.dimensions,
      isCornerPlot: isCornerPlot ?? this.isCornerPlot,
      isGatedCommunity: isGatedCommunity ?? this.isGatedCommunity,
    );
  }
}