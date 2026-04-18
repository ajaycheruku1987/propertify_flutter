part of 'create_post_bloc.dart';

@Freezed()
class CreatePostEvent with _$CreatePostEvent {
  const factory CreatePostEvent.started() = _CreatePostStarted;
  
  const factory CreatePostEvent.resetState() = _ResetState;
  
  const factory CreatePostEvent.titleChanged({
    required String title,
  }) = _TitleChanged;
  
  const factory CreatePostEvent.propertyTypeChanged({
    required String propertyType,
  }) = _PropertyTypeChanged;
  
  const factory CreatePostEvent.lookingForChanged({
    required String lookingFor,
  }) = _LookingForChanged;
  
  const factory CreatePostEvent.addressChanged({
    required String address,
  }) = _AddressChanged;
  
  const factory CreatePostEvent.locationCoordinatesChanged({
    required String address,
    required double latitude,
    required double longitude,
  }) = _LocationCoordinatesChanged;
  
  const factory CreatePostEvent.locationChanged({
    required String location,
  }) = _LocationChanged;
  
  const factory CreatePostEvent.priceChanged({
    required String price,
  }) = _PriceChanged;
  
  const factory CreatePostEvent.validateAndProceed() = _ValidateAndProceed;
  
  const factory CreatePostEvent.addImages({
    required List<File> images,
  }) = _AddImages;
  
  const factory CreatePostEvent.removeImage({
    required int index,
  }) = _RemoveImage;
  
  const factory CreatePostEvent.descriptionChanged({
    required String description,
  }) = _DescriptionChanged;
  
  const factory CreatePostEvent.proceedToNext() = _ProceedToNext;
  
  const factory CreatePostEvent.createPost({
    required String description,
  }) = _CreatePost;
}