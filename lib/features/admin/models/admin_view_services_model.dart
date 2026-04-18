import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../services/models/services_response_model.dart';

part 'admin_view_services_model.freezed.dart';
part 'admin_view_services_model.g.dart';

@freezed
class AdminViewServicesModel with _$AdminViewServicesModel {
  const factory AdminViewServicesModel({
    @JsonKey(name: "total") int? total,
    @JsonKey(name: "services") List<ServicesResponseModel>? services,
  }) = _AdminViewServicesModel;

  factory AdminViewServicesModel.fromJson(Map<String, dynamic> json) =>
      _$AdminViewServicesModelFromJson(json);
}
