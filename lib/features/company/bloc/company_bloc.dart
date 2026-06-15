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
    on<_UpdateCompany>(_onUpdateCompany);
    on<_GetMyCompany>(_onGetMyCompany);
    on<_GetUserCompany>(_onGetUserCompany);
    on<_InitializeForEdit>(_onInitializeForEdit);
    on<_DeleteCompany>(_onDeleteCompany);
  }

  void _onStarted(_CompanyStarted event, Emitter<CompanyState> emit) {
    emit(const CompanyState(isSuccess: false));
  }

  void _onResetState(_ResetState event, Emitter<CompanyState> emit) {
    emit(
      state.copyWith(
        isSuccess: false,
        isLoading: false,
        errorMessage: null,
        createCompanyResponse: null,
        companyName: '',
        selectedCategory: '',
        aboutCompany: '',
        address: '',
        city: '',
        state: '',
        gstNumber: '',
        selectedImage: null,
        websiteUrl: '',
        facebookUrl: '',
        instagramUrl: '',
        twitterUrl: '',
      ),
    );
  }

  void _onCompanyNameChanged(
    _CompanyNameChanged event,
    Emitter<CompanyState> emit,
  ) {
    emit(
      state.copyWith(
        companyName: event.companyName,
        isSuccess: false,
        isValid: _validateForm(state.copyWith(companyName: event.companyName)),
      ),
    );
  }

  void _onCategoryChanged(_CategoryChanged event, Emitter<CompanyState> emit) {
    emit(
      state.copyWith(
        selectedCategory: event.category,
        isSuccess: false,
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
    emit(state.copyWith(aboutCompany: event.aboutCompany, isSuccess: false));
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
        emit(state.copyWith(websiteUrl: event.url, isSuccess: false));
        break;
      case 'Facebook':
        emit(state.copyWith(facebookUrl: event.url, isSuccess: false));
        break;
      case 'Instagram':
        emit(state.copyWith(instagramUrl: event.url, isSuccess: false));
        break;
      case 'Twitter':
        emit(state.copyWith(twitterUrl: event.url, isSuccess: false));
        break;
    }
  }

  void _onAddressChanged(_AddressChanged event, Emitter<CompanyState> emit) {
    emit(
      state.copyWith(
        address: event.address,
        city: event.city,
        state: event.state,
        latitude: event.latitude,
        longitude: event.longitude,
        isSuccess: false,
      ),
    );
  }

  void _onGstNumberChanged(
    _GstNumberChanged event,
    Emitter<CompanyState> emit,
  ) {
    emit(state.copyWith(gstNumber: event.gstNumber, isSuccess: false));
  }

  void _onImageChanged(_ImageChanged event, Emitter<CompanyState> emit) {
    emit(state.copyWith(selectedImage: event.image, isSuccess: false));
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
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

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
            isSuccess: true,
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

  Future<void> _onUpdateCompany(
    _UpdateCompany event,
    Emitter<CompanyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    try {
      final updateCompanyResponse = await _repository.updateCompany(
        companyId: event.companyId,
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

      updateCompanyResponse.fold(
        (failure) => emit(
          state.copyWith(isLoading: false, errorMessage: failure.message),
        ),
        (right) => emit(
          state.copyWith(
            isLoading: false,
            myCompany: right,
            userCompany: right,
            isSuccess: true,
            errorMessage: null,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          errorMessage: 'Failed to update company: $e',
        ),
      );
    }
  }

  void _onInitializeForEdit(
    _InitializeForEdit event,
    Emitter<CompanyState> emit,
  ) {
    final company = event.company;
    emit(
      state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: null,
        companyName: company.companyName ?? '',
        selectedCategory: company.category ?? '',
        aboutCompany: company.about ?? '',
        address: company.address ?? '',
        city: company.city ?? '',
        state: company.state ?? '',
        gstNumber: company.gstNumber ?? '',
        facebookUrl: company.facebookUrl ?? '',
        instagramUrl: company.instagramUrl ?? '',
        twitterUrl: company.twitterUrl ?? '',
        websiteUrl: company.websiteUrl ?? '',
      ),
    );
  }

  Future<void> _onGetMyCompany(
    _GetMyCompany event,
    Emitter<CompanyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

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
      state.copyWith(
        isLoading: true,
        errorMessage: null,
        isSuccess: false,
      ),
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

  Future<void> _onDeleteCompany(
    _DeleteCompany event,
    Emitter<CompanyState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, errorMessage: null, isSuccess: false));

    final result = await _repository.deleteCompany(companyId: event.companyId);

    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, errorMessage: failure.message)),
      (success) => emit(
        state.copyWith(
          isLoading: false,
          myCompany: null,
          isSuccess: true,
          errorMessage: 'Company deleted successfully',
        ),
      ),
    );
  }
}
