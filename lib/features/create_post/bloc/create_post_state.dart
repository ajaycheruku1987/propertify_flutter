part of 'create_post_bloc.dart';

@Freezed()
class CreatePostState with _$CreatePostState {
  const factory CreatePostState({
    @Default('') String title,
    @Default('') String selectedPropertyType,
    @Default('Sell') String selectedLookingFor,
    @Default('') String address,
    @Default('Hyderabad') String selectedLocation,
    @Default('') String price,
    @Default([]) List<File> selectedImages,
    @Default('') String description,
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(false) bool isValid,
    double? latitude,
    double? longitude,
    AddPostResponse? addPostResponse,
    @Default('') String plotArea,
    @Default('Sq.Yds') String selectedAreaUnit,
    @Default('') String selectedFacing,
    @Default('') String roadWidth,
    @Default('Owner') String selectedPostedBy,
    @Default('') String selectedApprovalStatus,
    @Default('') String dimensions,
    @Default(false) bool isCornerPlot,
    @Default(false) bool isGatedCommunity,
  }) = _CreatePostState;
}
