import '../../reels/models/reel_response_model.dart';

class AdminReelsResponseModel {
  final List<ReelResponseModel>? reels;
  final int? total;
  final int? page;
  final int? limit;

  AdminReelsResponseModel({this.reels, this.total, this.page, this.limit});

  factory AdminReelsResponseModel.fromJson(Map<String, dynamic> json) {
    return AdminReelsResponseModel(
      reels: json['reels'] != null
          ? (json['reels'] as List)
                .map((e) => ReelResponseModel.fromJson(e))
                .toList()
          : null,
      total: json['total'],
      page: json['page'],
      limit: json['limit'],
    );
  }
}
