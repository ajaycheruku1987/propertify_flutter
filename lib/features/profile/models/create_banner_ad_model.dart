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

  const CreateBannerAdDataModel({
    this.images = const [],
    this.description = '',
    this.selectedPlanId,
    this.planName,
    this.planDays,
    this.amount,
    this.termsAccepted = false,
  });
}

/// Response model for banner ad creation
@freezed
class CreateBannerAdResponseModel with _$CreateBannerAdResponseModel {
  const factory CreateBannerAdResponseModel({
    required String id,
    required String description,
    required List<String> imageUrls,
    required String planName,
    required int planDays,
    required double amount,
    required String status,
    required DateTime createdAt,
  }) = _CreateBannerAdResponseModel;

  factory CreateBannerAdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBannerAdResponseModelFromJson(json);
}
