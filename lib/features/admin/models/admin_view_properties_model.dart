import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../home/models/feed_posts_response_model.dart';

part 'admin_view_properties_model.freezed.dart';
part 'admin_view_properties_model.g.dart';

@freezed
class AdminViewPropertiesModel with _$AdminViewPropertiesModel {
  const factory AdminViewPropertiesModel({
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "properties") List<FeedPostsResponseModel>? properties,
  }) = _AdminViewPropertiesModel;

  factory AdminViewPropertiesModel.fromJson(Map<String, dynamic> json) =>
      _$AdminViewPropertiesModelFromJson(json);
}
