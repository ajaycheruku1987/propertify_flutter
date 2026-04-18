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
  }) = _CreatePostState;
}
