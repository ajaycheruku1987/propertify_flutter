import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../models/request_response_model.dart';
import '../repo/requests_repo.dart';

part 'requests_bloc.freezed.dart';
part 'requests_event.dart';
part 'requests_state.dart';

class RequestsBloc extends Bloc<RequestsEvent, RequestsState> {
  final RequestsRepo _requestsRepo;

  RequestsBloc(this._requestsRepo) : super(const RequestsState()) {
    on<_GetRequestsEvent>(_onGetRequestsEvent);
    on<_GetRequestDetailsEvent>(_onGetRequestDetailsEvent);
    on<_CreateRequestEvent>(_onCreateRequestEvent);
    on<_UpdateRequestEvent>(_onUpdateRequestEvent);
    on<_DeleteRequestEvent>(_onDeleteRequestEvent);
    on<_IsLoading>(_onIsLoading);
    on<_GetMyRequestsEvent>(_onGetMyRequestsEvent);
    on<_Reset>(_onReset);
  }

  void _onReset(_Reset event, Emitter<RequestsState> emit) {
    emit(const RequestsState());
  }

  void _onIsLoading(_IsLoading event, Emitter<RequestsState> emit) {
    emit(_mergeState(isLoading: true));
  }

  Future<void> _onGetRequestsEvent(
    _GetRequestsEvent event,
    Emitter<RequestsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoading: true));

      final Either<Failure, List<RequestResponseModel>> requestsEither =
          await _requestsRepo.getRequests(
            skip: event.skip,
            limit: event.limit,
            latitude: event.latitude,
            longitude: event.longitude,
            radiusKm: event.radiusKm,
            search: event.search,
          );

      requestsEither.fold(
        (failure) {
          emit(
            _mergeState(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (requests) {
          final int offset = event.skip ?? 0;
          final int limit = event.limit ?? requests.length;
          final bool hasMoreData = requests.length == limit;

          final List<RequestResponseModel> updatedList = [
            if (offset > 0) ...state.requestsList,
            ...requests,
          ];

          emit(
            _mergeState(
              isLoading: false,
              requestsList: updatedList,
              currentOffset: offset + limit,
              hasMoreData: hasMoreData,
              notifyStatus: NotifyStatus(
                message: 'Requests loaded successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  Future<void> _onGetRequestDetailsEvent(
    _GetRequestDetailsEvent event,
    Emitter<RequestsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoading: true));

      final Either<Failure, RequestResponseModel> detailsEither =
          await _requestsRepo.getRequestDetails(requestId: event.requestId);

      detailsEither.fold(
        (failure) {
          emit(
            _mergeState(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (details) {
          emit(
            _mergeState(
              isLoading: false,
              requestDetails: details,
              notifyStatus: NotifyStatus(
                message: 'Request details loaded successfully',
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }

  Future<void> _onCreateRequestEvent(
    _CreateRequestEvent event,
    Emitter<RequestsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoading: true));

      final Either<Failure, RequestResponseModel> createEither =
          await _requestsRepo.createRequest(
            title: event.title,
            category: event.category,
            state: event.state,
            city: event.city,
            address: event.address,
            budget: event.budget,
            description: event.description,
            termsAgreed: event.termsAgreed,
            latitude: event.latitude,
            longitude: event.longitude,
          );

      createEither.fold(
        (failure) {
          CustomToast.showErrorToast(msg: failure.message);
          emit(_mergeState(isLoading: false));
        },
        (createdRequest) {
          emit(
            _mergeState(
              isLoading: false,
              requestDetails: createdRequest,
              notifyStatus: NotifyStatus(
                message: 'Request created successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onUpdateRequestEvent(
    _UpdateRequestEvent event,
    Emitter<RequestsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoading: true));

      final Either<Failure, RequestResponseModel> updateEither =
          await _requestsRepo.updateRequest(
            requestId: event.requestId,
            title: event.title,
            category: event.category,
            state: event.state,
            city: event.city,
            address: event.address,
            budget: event.budget,
            description: event.description,
            termsAgreed: event.termsAgreed,
            latitude: event.latitude,
            longitude: event.longitude,
          );

      updateEither.fold(
        (failure) {
          CustomToast.showErrorToast(msg: failure.message);
          emit(_mergeState(isLoading: false));
        },
        (updatedRequest) {
          final updatedRequestsList = state.requestsList.map((request) {
            return request.id == updatedRequest.id ? updatedRequest : request;
          }).toList();

          final updatedMyRequestsList = state.myRequestsList.map((request) {
            return request.id == updatedRequest.id ? updatedRequest : request;
          }).toList();

          emit(
            _mergeState(
              isLoading: false,
              requestDetails: updatedRequest,
              requestsList: updatedRequestsList,
              myRequestsList: updatedMyRequestsList,
              notifyStatus: NotifyStatus(
                message: 'Request updated successfully',
                type: NotifyType.success,
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  Future<void> _onDeleteRequestEvent(
    _DeleteRequestEvent event,
    Emitter<RequestsState> emit,
  ) async {
    try {
      emit(_mergeState(isLoading: true));

      final Either<Failure, bool> deleteEither = await _requestsRepo
          .deleteRequest(requestId: event.requestId);

      deleteEither.fold(
        (failure) {
          CustomToast.showErrorToast(msg: failure.message);
          emit(_mergeState(isLoading: false));
        },
        (success) {
          final updatedList = state.requestsList
              .where((request) => request.id != event.requestId)
              .toList();

          final updatedMyList = state.myRequestsList
              .where((request) => request.id != event.requestId)
              .toList();

          emit(
            _mergeState(
              isLoading: false,
              requestsList: updatedList,
              myRequestsList: updatedMyList,
              notifyStatus: NotifyStatus(
                message: 'Request deleted successfully',
                type: NotifyType.success,
              ),
            ),
          );
          CustomToast.showSuccessToast(msg: 'Request deleted successfully');
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  RequestsState _mergeState({
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
    RequestResponseModel? requestDetails,
    List<RequestResponseModel>? requestsList,
    List<RequestResponseModel>? myRequestsList,
    int? currentOffset,
    bool? hasMoreData,
    NotifyStatus? notifyStatus,
    bool? isMyRequestsLoading,
  }) {
    return RequestsState(
      isLoading: isLoading ?? state.isLoading,
      isError: isError ?? state.isError,
      isSuccess: isSuccess ?? state.isSuccess,
      requestDetails: requestDetails ?? state.requestDetails,
      requestsList: requestsList ?? state.requestsList,
      myRequestsList: myRequestsList ?? state.myRequestsList,
      currentOffset: currentOffset ?? state.currentOffset,
      hasMoreData: hasMoreData ?? state.hasMoreData,
      notifyStatus: notifyStatus ?? state.notifyStatus,
      isMyRequestsLoading: isMyRequestsLoading ?? state.isMyRequestsLoading,
    );
  }

  Future<void> _onGetMyRequestsEvent(
    _GetMyRequestsEvent event,
    Emitter<RequestsState> emit,
  ) async {
    try {
      emit(_mergeState(isMyRequestsLoading: true));

      final Either<Failure, List<RequestResponseModel>> myEither =
          await _requestsRepo.getMyRequests();

      myEither.fold(
        (failure) {
          emit(
            _mergeState(
              isMyRequestsLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (requests) {
          emit(
            _mergeState(isMyRequestsLoading: false, myRequestsList: requests),
          );
        },
      );
    } catch (e) {
      emit(
        _mergeState(
          isMyRequestsLoading: false,
          notifyStatus: NotifyStatus(
            message: 'An error occurred: ${e.toString()}',
          ),
        ),
      );
    }
  }
}
