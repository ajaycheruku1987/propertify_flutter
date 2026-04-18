import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/features/services/models/create_service_data_model.dart';
import 'package:propertify/features/services/models/service_reviews_response_model.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../models/services_response_model.dart';
import '../repo/services_repo.dart';

part 'services_bloc.freezed.dart';
part 'services_event.dart';
part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  final ServicesRepo _servicesRepo;

  ServicesBloc(this._servicesRepo) : super(const ServicesState()) {
    on<_GetServicesEvent>(_onGetServicesEvent);
    on<_GetServiceDetailsEvent>(_onGetServiceDetailsEvent);
    on<_GetSimilarServicesEvent>(_onGetSimilarServicesEvent);
    on<_IsLoading>(_onIsLoading);
    on<_UpdateAgentDetailsEvent>(_onUpdateAgentDetailsEvent);
    on<_UpdateImagesAndMediaDetailsEvent>(_onUpdateImagesAndMediaDetailsEvent);
    on<_UpdateServiceEvent>(_onUpdateServiceEvent);
    on<_DeleteServiceEvent>(_onDeleteServiceEvent);
    on<_PostReviewEvent>(_onPostReviewEvent);
    on<_EditReviewEvent>(_onEditReviewEvent);
    on<_GetServiceReviewsEvent>(_onGetServiceReviewsEvent);
    on<_GetMyServicesEvent>(_onGetMyServicesEvent);
    on<_UploadAadharEvent>(_onUploadAadharEvent);
    on<_LoadOtherUserServices>(_onLoadOtherUserServices);
    on<_Reset>(_onReset);
  }
  void _onReset(_Reset event, Emitter<ServicesState> emit) {
    emit(const ServicesState());
  }

  void _onPostReviewEvent(
    _PostReviewEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      final Either<Failure, ServiceReviewsResponseModel>
      repositoryResponseModel = await _servicesRepo.postReview(
        rating: event.rating,
        review: event.review,
        serviceId: event.serviceId,
      );
      repositoryResponseModel.fold(
        (l) => emit(
          state.copyWith(
            notifyStatus: NotifyStatus(message: 'Failed to post review'),
          ),
        ),
        (r) {
          emit(
            state.copyWith(
              notifyStatus: NotifyStatus(message: 'Review posted successfully'),
            ),
          );
          add(ServicesEvent.getServiceDetailsEvent(serviceId: event.serviceId));
        },
      );
    } catch (e) {
      debugPrint('Error posting review: $e');
      emit(state.copyWith(notifyStatus: NotifyStatus(message: e.toString())));
    }
  }

  void _onEditReviewEvent(
    _EditReviewEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      final Either<Failure, ServiceReviewsResponseModel>
      repositoryResponseModel = await _servicesRepo.editReview(
        reviewId: event.reviewId,
        rating: event.rating,
        review: event.review,
      );
      repositoryResponseModel.fold(
        (l) => emit(
          state.copyWith(
            notifyStatus: NotifyStatus(message: 'Failed to edit review'),
          ),
        ),
        (r) {
          emit(
            state.copyWith(
              notifyStatus: NotifyStatus(message: 'Review edited successfully'),
            ),
          );
          // Refresh reviews
          add(ServicesEvent.getServiceReviewsEvent(serviceId: event.serviceId));
          // Refresh service details (to update "Your Review" section if needed)
          add(ServicesEvent.getServiceDetailsEvent(serviceId: event.serviceId));
        },
      );
    } catch (e) {
      debugPrint('Error editing review: $e');
      emit(state.copyWith(notifyStatus: NotifyStatus(message: e.toString())));
    }
  }

  Future<void> _onGetServiceReviewsEvent(
    _GetServiceReviewsEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(state.copyWith(isReviewsLoading: true));

      final Either<Failure, List<ServiceReviewsResponseModel>> reviewsEither =
          await _servicesRepo.getServiceReviews(
            serviceId: event.serviceId,
            skip: event.skip,
            limit: event.limit,
          );

      reviewsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isReviewsLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (reviews) {
          emit(
            state.copyWith(isReviewsLoading: false, serviceReviews: reviews),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isReviewsLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  void _onUpdateAgentDetailsEvent(
    _UpdateAgentDetailsEvent event,
    Emitter<ServicesState> emit,
  ) {
    emit(state.copyWith(createServiceDataModel: event.createServiceDataModel));
  }

  void _onUpdateImagesAndMediaDetailsEvent(
    _UpdateImagesAndMediaDetailsEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      final CreateServiceDataModel? currentModel = state.createServiceDataModel;

      if (currentModel == null) {
        emit(
          state.copyWith(createServiceDataModel: event.createServiceDataModel),
        );
        return;
      }

      emit(
        state.copyWith(
          isLoading: true,
          createServiceDataModel: currentModel.copyWith(
            imageFiles: event.createServiceDataModel.imageFiles,
            facebook: event.createServiceDataModel.facebook,
            insta: event.createServiceDataModel.insta,
            twitter: event.createServiceDataModel.twitter,
            website: event.createServiceDataModel.website,
          ),
        ),
      );
      Either<Failure, List<ServicesResponseModel>> repositoryResponseModel =
          await _servicesRepo.createService(
            agentName: state.createServiceDataModel?.agentShopName ?? '',
            description: state.createServiceDataModel?.description ?? '',
            city: state.createServiceDataModel?.city ?? '',
            state: state.createServiceDataModel?.state ?? '',
            address: state.createServiceDataModel?.address ?? '',
            pincode: state.createServiceDataModel?.pincode ?? '',
            latitude: state.createServiceDataModel?.latitude ?? 0.0,
            longitude: state.createServiceDataModel?.longitude ?? 0.0,
            phoneNumber: state.createServiceDataModel?.phoneNumber ?? '',
            email: state.createServiceDataModel?.email ?? '',
            categoryNames: state.createServiceDataModel?.categories ?? [],
            files: state.createServiceDataModel?.imageFiles ?? [],
            socialInstagram: state.createServiceDataModel?.insta,
            socialFacebook: state.createServiceDataModel?.facebook,
            socialLinkedin: state.createServiceDataModel?.twitter ?? '',
          );
      repositoryResponseModel.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              isLoading: false,
              servicesList: success,
              notifyStatus: NotifyStatus(
                message: 'Service created successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  void _onUpdateServiceEvent(
    _UpdateServiceEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await _servicesRepo.updateService(
        serviceId: event.serviceId,
        agentName: event.updateServiceDataModel.agentShopName ?? '',
        description: event.updateServiceDataModel.description ?? '',
        city: event.updateServiceDataModel.city ?? '',
        state: event.updateServiceDataModel.state ?? '',
        address: event.updateServiceDataModel.address ?? '',
        pincode: event.updateServiceDataModel.pincode ?? '',
        latitude: event.updateServiceDataModel.latitude ?? 0.0,
        longitude: event.updateServiceDataModel.longitude ?? 0.0,
        phoneNumber: event.updateServiceDataModel.phoneNumber ?? '',
        email: event.updateServiceDataModel.email ?? '',
        categoryNames: event.updateServiceDataModel.categories ?? [],
        newImages: event.updateServiceDataModel.imageFiles ?? [],
        existingImageUrls: event.existingImageUrls,
        socialInstagram: event.updateServiceDataModel.insta,
        socialFacebook: event.updateServiceDataModel.facebook,
        socialLinkedin: event.updateServiceDataModel.twitter ?? '',
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (updatedService) {
          final updatedServicesList = state.servicesList.map((service) {
            return service.id == updatedService.id ? updatedService : service;
          }).toList();

          final updatedMyServicesList = state.myServicesList.map((service) {
            return service.id == updatedService.id ? updatedService : service;
          }).toList();

          emit(
            state.copyWith(
              isLoading: false,
              servicesList: updatedServicesList,
              myServicesList: updatedMyServicesList,
              serviceDetails: updatedService,
              notifyStatus: NotifyStatus(
                message: 'Service updated successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  void _onDeleteServiceEvent(
    _DeleteServiceEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      final result = await _servicesRepo.deleteService(
        serviceId: event.serviceId,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          final updatedServicesList = state.servicesList
              .where((service) => service.id != event.serviceId)
              .toList();

          final updatedMyServicesList = state.myServicesList
              .where((service) => service.id != event.serviceId)
              .toList();

          final updatedOtherUserServices = state.otherUserServices
              .where((service) => service.id != event.serviceId)
              .toList();

          emit(
            state.copyWith(
              isLoading: false,
              servicesList: updatedServicesList,
              myServicesList: updatedMyServicesList,
              otherUserServices: updatedOtherUserServices,
              notifyStatus: NotifyStatus(
                message: 'Service deleted successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  void _onIsLoading(_IsLoading event, Emitter<ServicesState> emit) {
    emit(state.copyWith(isLoading: true));
  }

  void _onGetServicesEvent(
    _GetServicesEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      final int offset = event.skip ?? 0;
      final int limit = event.limit ?? 10;

      emit(
        state.copyWith(
          isLoading: true,
          servicesList: offset == 0 ? [] : state.servicesList,
        ),
      );

      Either<Failure, List<ServicesResponseModel>> servicesResponseEither =
          await _servicesRepo.getServices(
            skip: event.skip,
            limit: event.limit,
            latitude: event.latitude,
            longitude: event.longitude,
            radiusKm: event.radiusKm,
            categoryNames: event.categoryNames,
            minRating: event.minRating,
            search: event.search,
          );

      servicesResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          List<ServicesResponseModel> updatedServicesList;

          if (offset == 0) {
            // Replace data for refresh
            updatedServicesList = success;
          } else {
            // Add to existing list for pagination
            updatedServicesList = [...state.servicesList, ...success];
          }

          final bool hasMoreData = success.length == limit;

          emit(
            state.copyWith(
              isLoading: false,
              servicesList: updatedServicesList,
              currentOffset: offset + limit,
              hasMoreData: hasMoreData,
              notifyStatus: NotifyStatus(
                message: 'Services loaded successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  void _onGetServiceDetailsEvent(
    _GetServiceDetailsEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isLoading: true,
          serviceDetails: null,
          notifyStatus: null,
        ),
      );

      Either<Failure, ServicesResponseModel> serviceDetailsEither =
          await _servicesRepo.getServiceDetails(serviceId: event.serviceId);

      serviceDetailsEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (serviceDetails) {
          emit(
            state.copyWith(
              isLoading: false,
              serviceDetails: serviceDetails,
              notifyStatus: NotifyStatus(
                message: 'Service details loaded successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  void _onGetSimilarServicesEvent(
    _GetSimilarServicesEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));

      Either<Failure, List<ServicesResponseModel>> similarServicesEither =
          await _servicesRepo.getSimilarServices(
            city: event.city,
            category: event.category,
            excludeServiceId: event.excludeServiceId,
            limit: event.limit,
          );

      similarServicesEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (similarServices) {
          emit(
            state.copyWith(
              isLoading: false,
              similarServices: similarServices,
              notifyStatus: NotifyStatus(
                message: 'Similar services loaded successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  Future<void> _onGetMyServicesEvent(
    _GetMyServicesEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(state.copyWith(isMyServicesLoading: true));
      final Either<Failure, List<ServicesResponseModel>> myEither =
          await _servicesRepo.getMyServices();
      myEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isMyServicesLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (services) {
          emit(
            state.copyWith(
              isMyServicesLoading: false,
              myServicesList: services,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isMyServicesLoading: false,
          notifyStatus: NotifyStatus(message: 'An error occurred: $e'),
        ),
      );
    }
  }

  Future<void> _onUploadAadharEvent(
    _UploadAadharEvent event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isAadharUploading: true,
          isAadharUploadSuccess: false,
          notifyStatus: null,
        ),
      );

      final result = await _servicesRepo.uploadAadhar(
        serviceId: event.serviceId,
        aadharFile: event.aadharFile,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isAadharUploading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          emit(
            state.copyWith(
              isAadharUploading: false,
              isAadharUploadSuccess: true,
              notifyStatus: NotifyStatus(
                message: 'Verification is inprogress',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isAadharUploading: false,
          notifyStatus: NotifyStatus(message: e.toString()),
        ),
      );
    }
  }

  void _onLoadOtherUserServices(
    _LoadOtherUserServices event,
    Emitter<ServicesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoadingOtherUserServices: true));

      final result = await _servicesRepo.getUserServices(
        userId: event.userId,
        skip: event.skip,
        limit: event.limit,
      );

      result.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoadingOtherUserServices: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (services) {
          final bool hasMore = services.length >= event.limit;
          final List<ServicesResponseModel> updatedServices = [
            if (event.skip > 0) ...state.otherUserServices,
            ...services,
          ];

          emit(
            state.copyWith(
              isLoadingOtherUserServices: false,
              otherUserServices: updatedServices,
              hasMoreOtherUserServices: hasMore,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingOtherUserServices: false,
          notifyStatus: NotifyStatus(message: 'Failed to load services'),
        ),
      );
    }
  }
}
