class ReelViewResponseModel {
  final String message;

  ReelViewResponseModel({required this.message});

  factory ReelViewResponseModel.fromJson(Map<String, dynamic> json) {
    return ReelViewResponseModel(message: json['message'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
