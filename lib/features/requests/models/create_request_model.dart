// Model for creating a new request

import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_request_model.freezed.dart';
part 'create_request_model.g.dart';

@freezed
class CreateRequestModel with _$CreateRequestModel {
    const factory CreateRequestModel({
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "description")
        String? description,
        @JsonKey(name: "city")
        required String city,
        @JsonKey(name: "state")
        required String state,
        @JsonKey(name: "address")
        required String address,
        @JsonKey(name: "request_type")
        required String requestType, // Buy or Rent
        @JsonKey(name: "category")
        required String category,
        @JsonKey(name: "budget_range")
        required String budgetRange,
        @JsonKey(name: "latitude")
        double? latitude,
        @JsonKey(name: "longitude")
        double? longitude,
        @JsonKey(name: "contact_number")
        String? contactNumber,
        @JsonKey(name: "preferred_contact_time")
        String? preferredContactTime,
        @JsonKey(name: "urgency_level")
        String? urgencyLevel,
        @JsonKey(name: "additional_requirements")
        String? additionalRequirements,
    }) = _CreateRequestModel;

    factory CreateRequestModel.fromJson(Map<String, dynamic> json) => _$CreateRequestModelFromJson(json);
}