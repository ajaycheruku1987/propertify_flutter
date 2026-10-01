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
  final String? mainCategory;
  final String? subCategory;
  final bool? isNegotiable;
  final String? securityDeposit;
  final String? propertyStatus;
  final bool? contactViaPhone;
  final bool? contactViaWhatsApp;
  final String? carpetArea;
  final String? carpetAreaUnit;

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
    this.mainCategory,
    this.subCategory,
    this.isNegotiable,
    this.securityDeposit,
    this.propertyStatus,
    this.contactViaPhone,
    this.contactViaWhatsApp,
    this.carpetArea,
    this.carpetAreaUnit,
  });

  factory CreatePostModel.fromJson(Map<String, dynamic> json) {
    return CreatePostModel(
      id: json['id'] ?? '',
      propertyType: json['propertyType'] ?? json['property_type'] ?? '',
      lookingFor: json['lookingFor'] ?? json['listing_type'] ?? '',
      address: json['address'] ?? '',
      location: json['location'] ?? json['city'] ?? '',
      price: json['price']?.toString() ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? json['created_at'] ?? DateTime.now().toIso8601String()),
      userId: json['userId'] ?? json['user_id'] ?? '',
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
      mainCategory: json['mainCategory'] ?? json['main_category'],
      subCategory: json['subCategory'] ?? json['sub_category'],
      isNegotiable: json['isNegotiable'] ?? json['is_negotiable'],
      securityDeposit: json['securityDeposit'] ?? json['security_deposit'],
      propertyStatus: json['propertyStatus'] ?? json['property_status'],
      contactViaPhone: json['contactViaPhone'] ?? json['contact_via_phone'],
      contactViaWhatsApp: json['contactViaWhatsApp'] ?? json['contact_via_whatsapp'],
      carpetArea: json['carpetArea'] ?? json['carpet_area'],
      carpetAreaUnit: json['carpetAreaUnit'] ?? json['carpet_area_unit'],
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
      'main_category': mainCategory,
      'sub_category': subCategory,
      'is_negotiable': isNegotiable,
      'security_deposit': securityDeposit,
      'property_status': propertyStatus,
      'contact_via_phone': contactViaPhone,
      'contact_via_whatsapp': contactViaWhatsApp,
      'carpet_area': carpetArea,
      'carpet_area_unit': carpetAreaUnit,
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
    String? mainCategory,
    String? subCategory,
    bool? isNegotiable,
    String? securityDeposit,
    String? propertyStatus,
    bool? contactViaPhone,
    bool? contactViaWhatsApp,
    String? carpetArea,
    String? carpetAreaUnit,
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
      mainCategory: mainCategory ?? this.mainCategory,
      subCategory: subCategory ?? this.subCategory,
      isNegotiable: isNegotiable ?? this.isNegotiable,
      securityDeposit: securityDeposit ?? this.securityDeposit,
      propertyStatus: propertyStatus ?? this.propertyStatus,
      contactViaPhone: contactViaPhone ?? this.contactViaPhone,
      contactViaWhatsApp: contactViaWhatsApp ?? this.contactViaWhatsApp,
      carpetArea: carpetArea ?? this.carpetArea,
      carpetAreaUnit: carpetAreaUnit ?? this.carpetAreaUnit,
    );
  }
}