import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel({
    @JsonKey(name: 'id') String? id,
    String? category,
    String? subject,
    String? description,
    @JsonKey(name: 'user_id') String? user,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}
