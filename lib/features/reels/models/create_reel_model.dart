import 'dart:io';

class CreateReelModel {
  final String? description;
  final List<String>? category;
  final String? location;
  final String? city;
  final String? state;
  final String? address;
  final double? latitude;
  final double? longitude;
  final bool? isPromoted;
  final String? promotedUntil;
  final File? videoFile;

  const CreateReelModel({
    this.description,
    this.category,
    this.location,
    this.city,
    this.state,
    this.address,
    this.latitude,
    this.longitude,
    this.isPromoted,
    this.promotedUntil,
    this.videoFile,
  });

  CreateReelModel copyWith({
    String? description,
    List<String>? category,
    String? location,
    String? city,
    String? state,
    String? address,
    double? latitude,
    double? longitude,
    bool? isPromoted,
    String? promotedUntil,
    File? videoFile,
  }) {
    return CreateReelModel(
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      city: city ?? this.city,
      state: state ?? this.state,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      isPromoted: isPromoted ?? this.isPromoted,
      promotedUntil: promotedUntil ?? this.promotedUntil,
      videoFile: videoFile ?? this.videoFile,
    );
  }
}
