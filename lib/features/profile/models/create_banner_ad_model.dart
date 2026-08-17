import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_banner_ad_model.freezed.dart';
part 'create_banner_ad_model.g.dart';

/// Data model for creating banner ad (runtime only, not JSON serializable)
class CreateBannerAdDataModel {
  final List<File> images;
  final String description;
  final String? selectedPlanId;
  final String? planName;
  final int? planDays;
  final double? amount;
  final bool termsAccepted;
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? state;
  final String? village;
  final String? address;

  const CreateBannerAdDataModel({
    this.images = const [],
    this.description = '',
    this.selectedPlanId,
    this.planName,
    this.planDays,
    this.amount,
    this.termsAccepted = false,
    this.latitude,
    this.longitude,
    this.city,
    this.state,
    this.village,
    this.address,
  });
}

/// Response model for banner ad creation
@freezed
class CreateBannerAdResponseModel with _$CreateBannerAdResponseModel {
  const factory CreateBannerAdResponseModel({
    required double amount,
    required DateTime createdAt,
    required String description,
    required String id,
    required List<String> imageUrls,
    required int planDays,
    required String planName,
    required String status,
  }) = _CreateBannerAdResponseModel;

  factory CreateBannerAdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBannerAdResponseModelFromJson(json);
}
