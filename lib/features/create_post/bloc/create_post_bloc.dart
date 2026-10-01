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
    on<_MainCategoryChanged>(_onMainCategoryChanged);
    on<_SubCategoryChanged>(_onSubCategoryChanged);
    on<_LookingForChanged>(_onLookingForChanged);
    on<_AddressChanged>(_onAddressChanged);
    on<_LocationCoordinatesChanged>(_onLocationCoordinatesChanged);
    on<_LocationChanged>(_onLocationChanged);
    on<_PriceChanged>(_onPriceChanged);
    on<_IsNegotiableChanged>(_onIsNegotiableChanged);
    on<_SecurityDepositChanged>(_onSecurityDepositChanged);
    on<_PropertyStatusChanged>(_onPropertyStatusChanged);
    on<_ContactViaPhoneChanged>(_onContactViaPhoneChanged);
    on<_ContactViaWhatsAppChanged>(_onContactViaWhatsAppChanged);
    on<_StepChanged>(_onStepChanged);
    on<_CarpetAreaChanged>(_onCarpetAreaChanged);
    on<_CarpetAreaUnitChanged>(_onCarpetAreaUnitChanged);
    on<_PlotAreaChanged>(_onPlotAreaChanged);
    on<_AreaUnitChanged>(_onAreaUnitChanged);
    on<_FacingChanged>(_onFacingChanged);
    on<_RoadWidthChanged>(_onRoadWidthChanged);
    on<_PostedByChanged>(_onPostedByChanged);
    on<_ApprovalStatusChanged>(_onApprovalStatusChanged);
    on<_DimensionsChanged>(_onDimensionsChanged);
    on<_IsCornerPlotChanged>(_onIsCornerPlotChanged);
    on<_IsGatedCommunityChanged>(_onIsGatedCommunityChanged);
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

  void _onMainCategoryChanged(
    _MainCategoryChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(selectedMainCategory: event.mainCategory));
  }

  void _onSubCategoryChanged(
    _SubCategoryChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(
      state.copyWith(
        selectedSubCategory: event.subCategory,
        selectedPropertyType: event.subCategory,
        isValid: _validateForm(
          state.copyWith(
            selectedSubCategory: event.subCategory,
            selectedPropertyType: event.subCategory,
          ),
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

  void _onIsNegotiableChanged(
    _IsNegotiableChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(isNegotiable: event.isNegotiable));
  }

  void _onSecurityDepositChanged(
    _SecurityDepositChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(securityDeposit: event.securityDeposit));
  }

  void _onPropertyStatusChanged(
    _PropertyStatusChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(selectedPropertyStatus: event.propertyStatus));
  }

  void _onContactViaPhoneChanged(
    _ContactViaPhoneChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(contactViaPhone: event.contactViaPhone));
  }

  void _onContactViaWhatsAppChanged(
    _ContactViaWhatsAppChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(contactViaWhatsApp: event.contactViaWhatsApp));
  }

  void _onStepChanged(_StepChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(currentStep: event.step));
  }

  void _onCarpetAreaChanged(
    _CarpetAreaChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(carpetArea: event.carpetArea));
  }

  void _onCarpetAreaUnitChanged(
    _CarpetAreaUnitChanged event,
    Emitter<CreatePostState> emit,
  ) {
    emit(state.copyWith(selectedCarpetAreaUnit: event.carpetAreaUnit));
  }

  void _onPlotAreaChanged(_PlotAreaChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(plotArea: event.plotArea));
  }

  void _onAreaUnitChanged(_AreaUnitChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(selectedAreaUnit: event.areaUnit));
  }

  void _onFacingChanged(_FacingChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(selectedFacing: event.facing));
  }

  void _onRoadWidthChanged(_RoadWidthChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(roadWidth: event.roadWidth));
  }

  void _onPostedByChanged(_PostedByChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(selectedPostedBy: event.postedBy));
  }

  void _onApprovalStatusChanged(_ApprovalStatusChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(selectedApprovalStatus: event.approvalStatus));
  }

  void _onDimensionsChanged(_DimensionsChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(dimensions: event.dimensions));
  }

  void _onIsCornerPlotChanged(_IsCornerPlotChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(isCornerPlot: event.isCornerPlot));
  }

  void _onIsGatedCommunityChanged(_IsGatedCommunityChanged event, Emitter<CreatePostState> emit) {
    emit(state.copyWith(isGatedCommunity: event.isGatedCommunity));
  }

  void _onValidateAndProceed(
    _ValidateAndProceed event,
    Emitter<CreatePostState> emit,
  ) {
    if (_validateForm(state)) {
      emit(state.copyWith(isLoading: true, errorMessage: null));
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
      emit(state.copyWith(isLoading: false));
    } else {
      emit(state.copyWith(errorMessage: 'Please add at least one image'));
    }
  }

  bool _validateForm(CreatePostState state) {
    final propertyType = state.selectedSubCategory.isNotEmpty
        ? state.selectedSubCategory
        : state.selectedPropertyType;
    return state.title.isNotEmpty &&
        propertyType.isNotEmpty &&
        state.address.isNotEmpty &&
        state.price.isNotEmpty;
  }

  Future<void> _onCreatePost(
    _CreatePost event,
    Emitter<CreatePostState> emit,
  ) async {
    if (state.isLoading) return; // Prevent duplicate concurrent submission

    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final propertyType = state.selectedSubCategory.isNotEmpty
          ? state.selectedSubCategory
          : state.selectedPropertyType;

      // Validate required fields
      if (state.title.isEmpty) {
        emit(
          state.copyWith(isLoading: false, errorMessage: 'Title is required'),
        );
        return;
      }

      if (propertyType.isEmpty) {
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
        propertyType: propertyType,
        listingType: state.selectedLookingFor,
        address: state.address,
        city: state.selectedLocation,
        price: state.price,
        description: event.description.isNotEmpty ? event.description : null,
        latitude: state.latitude,
        longitude: state.longitude,
        images: state.selectedImages,
        plotArea: state.plotArea,
        areaUnit: state.selectedAreaUnit,
        facing: state.selectedFacing,
        roadWidth: state.roadWidth,
        postedBy: state.selectedPostedBy,
        approvalStatus: state.selectedApprovalStatus,
        dimensions: state.dimensions,
        isCornerPlot: state.isCornerPlot,
        isGatedCommunity: state.isGatedCommunity,
        mainCategory: state.selectedMainCategory,
        subCategory: state.selectedSubCategory,
        isNegotiable: state.isNegotiable,
        securityDeposit: state.securityDeposit,
        propertyStatus: state.selectedPropertyStatus,
        contactViaPhone: state.contactViaPhone,
        contactViaWhatsApp: state.contactViaWhatsApp,
        carpetArea: state.carpetArea,
        carpetAreaUnit: state.selectedCarpetAreaUnit,
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
