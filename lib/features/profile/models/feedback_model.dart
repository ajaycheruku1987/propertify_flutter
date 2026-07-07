import 'package:freezed_annotation/freezed_annotation.dart';

part 'feedback_model.freezed.dart';
part 'feedback_model.g.dart';

@freezed
class FeedbackModel with _$FeedbackModel {
  const factory FeedbackModel({
    @JsonKey(name: '_id') required String id,
    required String category,
    required String subject,
    required String description,
    required String user,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _FeedbackModel;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$FeedbackModelFromJson(json);
}
