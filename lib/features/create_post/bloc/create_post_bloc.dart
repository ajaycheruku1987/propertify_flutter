import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/features/create_post/models/add_post_response.dart';
import '../repo/create_post_repository.dart';

part 'create_post_bloc.freezed.dart';
part 'create_post_event.dart';
part 'create_post_state.dart';

class CreatePostBloc extends Bloc<CreatePostEvent, CreatePostState> {
  final CreatePostRepository _repository;

  CreatePostBloc(this._repository) : super(const CreatePostState()) {
    on<_CreatePostStarted>(_onStarted);
    on<_ResetState>(_onResetState);
    on<_TitleChanged>(_onTitleChanged);
    on<_PropertyTypeChanged>(_onPropertyTypeChanged);
    on<_LookingForChanged>(_onLookingForChanged);
    on<_AddressChanged>(_onAddressChanged);
    on<_LocationCoordinatesChanged>(_onLocationCoordinatesChanged);
    on<_LocationChanged>(_onLocationChanged);
    on<_PriceChanged>(_onPriceChanged);
    on<_ValidateAndProceed>(_onValidateAndProceed);
    on<_AddImages>(_onAddImages);
    on<_RemoveImage>(_onRemoveImage);
    on<_DescriptionChanged>(_onDescriptionChanged);
    on<_ProceedToNext>(_onProceedToNext);
    on<_CreatePost>(_onCreatePost);
  }

  void _onStarted(_CreatePostStarted event, Emitter<CreatePostState> emit) {
    emit(const CreatePostState());
  }

  void _onResetState(_ResetState event, Emitter<CreatePostState> emit) {
    emit(const CreatePostState());
  }

  void _onTitleChanged(_TitleChanged event, Emitter<CreatePostState> emit) {
    emit(
      state.copyWith(
        title: event.title,
        isValid: _validateForm(state.copyWith(title: event.title)),
      ),
    );
  }

  void _onPropertyTypeChanged(
    _PropertyTypeChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(
      state.copyWith(
        selectedPropertyType: event.propertyType,
        isValid: _validateForm(
          state.copyWith(selectedPropertyType: event.propertyType),
        ),
      ),
    );
  }

  void _onLookingForChanged(
    _LookingForChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(
      state.copyWith(
        selectedLookingFor: event.lookingFor,
        isValid: _validateForm(
          state.copyWith(selectedLookingFor: event.lookingFor),
        ),
      ),
    );
  }

  void _onAddressChanged(_AddressChanged event, Emitter<CreatePostState> emit) {
    emit(
      state.copyWith(
        address: event.address,
        isValid: _validateForm(state.copyWith(address: event.address)),
      ),
    );
  }

  void _onLocationCoordinatesChanged(
    _LocationCoordinatesChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(
      state.copyWith(
        address: event.address,
        latitude: event.latitude,
        longitude: event.longitude,
        isValid: _validateForm(state.copyWith(address: event.address)),
      ),
    );
  }

  void _onLocationChanged(
    _LocationChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(
      state.copyWith(
        selectedLocation: event.location,
        isValid: _validateForm(
          state.copyWith(selectedLocation: event.location),
        ),
      ),
    );
  }

  void _onPriceChanged(_PriceChanged event, Emitter<CreatePostState> emit) {
    emit(
      state.copyWith(
        price: event.price,
        isValid: _validateForm(state.copyWith(price: event.price)),
      ),
    );
  }

  void _onValidateAndProceed(
    _ValidateAndProceed event,
    Emitter<CreatePostState> emit,
  ) {
    if (_validateForm(state)) {
      emit(state.copyWith(isLoading: true, errorMessage: null));
      // Set isValid to true to trigger navigation
      emit(state.copyWith(isLoading: false, isValid: true));
    } else {
      emit(
        state.copyWith(
          errorMessage: 'Please fill all required fields',
          isValid: false,
        ),
      );
    }
  }

  void _onAddImages(_AddImages event, Emitter<CreatePostState> emit) {
    final updatedImages = List<File>.from(state.selectedImages);
    updatedImages.addAll(event.images);
    emit(state.copyWith(selectedImages: updatedImages));
  }

  void _onRemoveImage(_RemoveImage event, Emitter<CreatePostState> emit) {
    final updatedImages = List<File>.from(state.selectedImages);
    if (event.index >= 0 && event.index < updatedImages.length) {
      updatedImages.removeAt(event.index);
      emit(state.copyWith(selectedImages: updatedImages));
    }
  }

  void _onDescriptionChanged(
    _DescriptionChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(description: event.description));
  }

  void _onProceedToNext(_ProceedToNext event, Emitter<CreatePostState> emit) {
    if (state.selectedImages.isNotEmpty) {
      emit(state.copyWith(isLoading: true));
      // TODO: Implement final submission logic
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(errorMessage: 'Please add at least one image'));
    }
  }

  bool _validateForm(CreatePostState state) {
    return state.title.isNotEmpty &&
        state.selectedPropertyType.isNotEmpty &&
        state.address.isNotEmpty &&
        state.price.isNotEmpty;
  }

  Future<void> _onCreatePost(
    _CreatePost event,
    Emitter<CreatePostState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // Validate required fields
      if (state.title.isEmpty) {
        emit(
          state.copyWith(isLoading: false, errorMessage: 'Title is required'),
        );
        return;
      }

      if (state.selectedPropertyType.isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Property type is required',
          ),
        );
        return;
      }

      if (state.address.isEmpty) {
        emit(
          state.copyWith(isLoading: false, errorMessage: 'Address is required'),
        );
        return;
      }

      if (state.price.isEmpty) {
        emit(
          state.copyWith(isLoading: false, errorMessage: 'Price is required'),
        );
        return;
      }

      if (state.selectedLocation.isEmpty) {
        emit(
          state.copyWith(isLoading: false, errorMessage: 'City is required'),
        );
        return;
      }

      if (state.selectedImages.isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'At least one image is required',
          ),
        );
        return;
      }

      // Call repository to create post with all data
      final createPostResponse = await _repository.createPost(
        title: state.title,
        propertyType: state.selectedPropertyType,
        listingType: state.selectedLookingFor,
        address: state.address,
        city: state.selectedLocation,
        price: state.price,
        description: event.description.isNotEmpty ? event.description : null,
        latitude: state.latitude,
        longitude: state.longitude,
        images: state.selectedImages,
      );

      createPostResponse.fold(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (right) => emit(
          state.copyWith(
            isLoading: false,
            addPostResponse: right,
            errorMessage: null,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to create post: $e',
        ),
      );
    }
  }
}
