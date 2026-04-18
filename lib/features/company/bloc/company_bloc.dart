import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propertify/features/company/models/create_company_response.dart';
import 'package:propertify/features/company/models/my_company_response_model.dart';
import '../repo/company_repository.dart';

part 'company_bloc.freezed.dart';
part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepository _repository;

  CompanyBloc(this._repository) : super(const CompanyState()) {
    on<_CompanyStarted>(_onStarted);
    on<_ResetState>(_onResetState);
    on<_CompanyNameChanged>(_onCompanyNameChanged);
    on<_CategoryChanged>(_onCategoryChanged);
    on<_AboutCompanyChanged>(_onAboutCompanyChanged);
    on<_SocialMediaPlatformSelected>(_onSocialMediaPlatformSelected);
    on<_SocialMediaUrlChanged>(_onSocialMediaUrlChanged);
    on<_AddressChanged>(_onAddressChanged);
    on<_GstNumberChanged>(_onGstNumberChanged);
    on<_ImageChanged>(_onImageChanged);
    on<_ValidateAndProceed>(_onValidateAndProceed);
    on<_CreateCompany>(_onCreateCompany);
    on<_GetMyCompany>(_onGetMyCompany);
    on<_GetUserCompany>(_onGetUserCompany);
  }

  void _onStarted(_CompanyStarted event, Emitter<CompanyState> emit) {
    emit(const CompanyState());
  }

  void _onResetState(_ResetState event, Emitter<CompanyState> emit) {
    emit(const CompanyState());
  }

  void _onCompanyNameChanged(
    _CompanyNameChanged event,
    Emitter<CompanyState> emit,
  ) {
    emit(
      state.copyWith(
        companyName: event.companyName,
        isValid: _validateForm(state.copyWith(companyName: event.companyName)),
      ),
    );
  }

  void _onCategoryChanged(_CategoryChanged event, Emitter<CompanyState> emit) {
    emit(
      state.copyWith(
        selectedCategory: event.category,
        isValid: _validateForm(
          state.copyWith(selectedCategory: event.category),
        ),
      ),
    );
  }

  void _onAboutCompanyChanged(
    _AboutCompanyChanged event,
    Emitter<CompanyState> emit,
  ) {
    emit(state.copyWith(aboutCompany: event.aboutCompany));
  }

  void _onSocialMediaPlatformSelected(
    _SocialMediaPlatformSelected event,
    Emitter<CompanyState> emit,
  ) {
    emit(state.copyWith(selectedSocialMediaPlatform: event.platform));
  }

  void _onSocialMediaUrlChanged(
    _SocialMediaUrlChanged event,
    Emitter<CompanyState> emit,
  ) {
    switch (event.platform) {
      case 'Website':
        emit(state.copyWith(websiteUrl: event.url));
        break;
      case 'Facebook':
        emit(state.copyWith(facebookUrl: event.url));
        break;
      case 'Instagram':
        emit(state.copyWith(instagramUrl: event.url));
        break;
      case 'Twitter':
        emit(state.copyWith(twitterUrl: event.url));
        break;
    }
  }

  void _onAddressChanged(_AddressChanged event, Emitter<CompanyState> emit) {
    emit(
      state.copyWith(
        address: event.address,
        latitude: event.latitude,
        longitude: event.longitude,
      ),
    );
  }

  void _onGstNumberChanged(
    _GstNumberChanged event,
    Emitter<CompanyState> emit,
  ) {
    emit(state.copyWith(gstNumber: event.gstNumber));
  }

  void _onImageChanged(_ImageChanged event, Emitter<CompanyState> emit) {
    emit(state.copyWith(selectedImage: event.image));
  }

  void _onValidateAndProceed(
    _ValidateAndProceed event,
    Emitter<CompanyState> emit,
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

  bool _validateForm(CompanyState state) {
    return state.companyName.isNotEmpty && state.selectedCategory.isNotEmpty;
  }

  Future<void> _onCreateCompany(
    _CreateCompany event,
    Emitter<CompanyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      // Validate required fields
      if (state.companyName.isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Company name is required',
          ),
        );
        return;
      }

      if (state.selectedCategory.isEmpty) {
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: 'Category is required',
          ),
        );
        return;
      }

      // Call repository to create company with all data
      final createCompanyResponse = await _repository.createCompany(
        companyName: state.companyName,
        category: state.selectedCategory,
        address: state.address,
        city: state.city,
        state: state.state,
        aboutCompany: state.aboutCompany.isNotEmpty ? state.aboutCompany : null,
        websiteUrl: state.websiteUrl.isNotEmpty ? state.websiteUrl : null,
        facebookUrl: state.facebookUrl.isNotEmpty ? state.facebookUrl : null,
        instagramUrl: state.instagramUrl.isNotEmpty ? state.instagramUrl : null,
        twitterUrl: state.twitterUrl.isNotEmpty ? state.twitterUrl : null,
        gstNumber: state.gstNumber.isNotEmpty ? state.gstNumber : null,
        image: state.selectedImage,
      );

      createCompanyResponse.fold(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (right) => emit(
          state.copyWith(
            isLoading: false,
            createCompanyResponse: right,
            errorMessage: null,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to create company: $e',
        ),
      );
    }
  }

  Future<void> _onGetMyCompany(
    _GetMyCompany event,
    Emitter<CompanyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _repository.getMyCompany();

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (myCompany) =>
          emit(state.copyWith(isLoading: false, myCompany: myCompany)),
    );
  }

  Future<void> _onGetUserCompany(
    _GetUserCompany event,
    Emitter<CompanyState> emit,
  ) async {
    emit(
      state.copyWith(isLoading: true, errorMessage: null, userCompany: null),
    );

    final result = await _repository.getUserCompany(event.userId);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (companies) => emit(
        state.copyWith(
          isLoading: false,
          userCompany: companies.isNotEmpty ? companies.first : null,
        ),
      ),
    );
  }
}
