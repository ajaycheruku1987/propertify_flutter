import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:propertify/utils/custom_toast.dart';

import '../../../core/failure.dart';
import '../../../core/notify_message.dart';
import '../../admin/models/callback_request_model.dart';
import '../models/sales_model.dart';
import '../models/sales_unit_model.dart';
import '../models/create_sales_data_model.dart';
import '../repo/sales_repo.dart';

part 'sales_bloc.freezed.dart';
part 'sales_event.dart';
part 'sales_state.dart';

class SalesBloc extends Bloc<SalesEvent, SalesState> {
  final SalesRepo _salesRepo;

  List<String>? _lastPropertyTypes;
  String? _lastCity;
  double? _lastLatitude;
  double? _lastLongitude;
  double? _lastRadiusKm;
  String? _lastSearch;
  String? _currentSearchQuery;

  SalesBloc(this._salesRepo) : super(const SalesState()) {
    on<_GetSalesEvent>(_onGetSalesEvent);
    on<_GetSaleDetailsEvent>(_onGetSaleDetailsEvent);
    on<_GetSalesProjectsByUserIdEvent>(_onGetSalesProjectsByUserIdEvent);
    on<_IsLoading>(_onIsLoading);
    on<_UpdateSalesDetailsEvent>(_onUpdateSalesDetailsEvent);
    on<_UpdateSalesMediaEvent>(_onUpdateSalesMediaEvent);
    on<_CreateSalesProjectEvent>(_onCreateSalesProjectEvent);
    on<_RequestCallbackEvent>(_onRequestCallbackEvent);
    on<_Reset>(_onReset);
    on<_GetProjectUnitsEvent>(_onGetProjectUnitsEvent);
    on<_AddProjectUnitEvent>(_onAddProjectUnitEvent);
    on<_EditProjectUnitEvent>(_onEditProjectUnitEvent);
    on<_GetProjectCallbacksEvent>(_onGetProjectCallbacksEvent);
    on<_DeleteCallbackEvent>(_onDeleteCallbackEvent);
  }

  void _onReset(_Reset event, Emitter<SalesState> emit) {
    emit(const SalesState());
  }

  void _onIsLoading(_IsLoading event, Emitter<SalesState> emit) {
    emit(state.copyWith(isLoading: true));
  }

  void _onGetSalesEvent(_GetSalesEvent event, Emitter<SalesState> emit) async {
    try {
      final int offset = event.offset ?? 0;
      final int limit = event.limit ?? 10;

      final List<String>? propertyTypes = event.propertyTypes ?? (offset == 0 ? null : _lastPropertyTypes);
      final String? city = event.city ?? (offset == 0 ? null : _lastCity);
      final double? latitude = event.latitude ?? (offset == 0 ? null : _lastLatitude);
      final double? longitude = event.longitude ?? (offset == 0 ? null : _lastLongitude);
      final double? radiusKm = event.radiusKm ?? (offset == 0 ? null : _lastRadiusKm);
      final String? search = event.search ?? (offset == 0 ? null : _lastSearch);

      if (offset == 0) {
        _lastPropertyTypes = propertyTypes;
        _lastCity = city;
        _lastLatitude = latitude;
        _lastLongitude = longitude;
        _lastRadiusKm = radiusKm;
        _lastSearch = search;
      }

      // Local search: fetch pages recursively and filter client-side
      if (search != null && search.trim().isNotEmpty) {
        final query = search.trim();
        _currentSearchQuery = query;

        int currentOffset = 0;
        final List<SaleRecord> accumulatedMatched = [];
        SalesModel? lastModel;

        emit(
          state.copyWith(
            isLoading: true,
            salesList: SalesModel(salerecords: []),
            currentOffset: 0,
            hasMoreData: true,
          ),
        );

        while (true) {
          if (_currentSearchQuery != query) return;

          final Either<Failure, SalesModel> salesResponseEither =
              await _salesRepo.getSales(
                propertyTypes: propertyTypes,
                city: city,
                latitude: latitude,
                longitude: longitude,
                radiusKm: radiusKm,
                search: null, // local filtering only
                limit: limit,
                offset: currentOffset,
              );

          if (_currentSearchQuery != query) return;

          bool shouldBreak = false;
          salesResponseEither.fold(
            (failure) {
              emit(
                state.copyWith(
                  isLoading: false,
                  notifyStatus: NotifyStatus(message: failure.message),
                ),
              );
              shouldBreak = true;
            },
            (success) {
              lastModel = success;
              final records = success.salerecords ?? [];
              if (records.isEmpty) {
                shouldBreak = true;
              } else {
                final lowercaseQuery = query.toLowerCase();
                final matched = records.where((sale) {
                  final nameMatch = sale.projectName?.toLowerCase().contains(lowercaseQuery) ?? false;
                  final descMatch = sale.description?.toLowerCase().contains(lowercaseQuery) ?? false;
                  final typeMatch = sale.propertyType?.toLowerCase().contains(lowercaseQuery) ?? false;
                  final cityMatch = sale.city?.toLowerCase().contains(lowercaseQuery) ?? false;
                  final addressMatch = sale.address?.toLowerCase().contains(lowercaseQuery) ?? false;
                  final locationMatch = sale.location?.toLowerCase().contains(lowercaseQuery) ?? false;
                  return nameMatch || descMatch || typeMatch || cityMatch || addressMatch || locationMatch;
                }).toList();

                accumulatedMatched.addAll(matched);

                emit(
                  state.copyWith(
                    salesList: (lastModel ?? SalesModel()).copyWith(
                      salerecords: List.from(accumulatedMatched),
                    ),
                    currentOffset: currentOffset + records.length,
                    hasMoreData: records.length == limit,
                  ),
                );

                if (records.length < limit) {
                  shouldBreak = true;
                }
              }
            },
          );

          if (shouldBreak) break;
          currentOffset += limit;
        }

        if (_currentSearchQuery == query) {
          emit(state.copyWith(isLoading: false, hasMoreData: false));
        }
        return;
      }

      // Search cleared — reset and load normally
      if (_currentSearchQuery != null) {
        _currentSearchQuery = null;
      }

      emit(
        state.copyWith(
          isLoading: true,
          salesList: offset == 0 ? SalesModel() : state.salesList,
        ),
      );

      Either<Failure, SalesModel> salesResponseEither = await _salesRepo
          .getSales(
            propertyTypes: propertyTypes,
            city: city,
            latitude: latitude,
            longitude: longitude,
            radiusKm: radiusKm,
            search: null,
            limit: limit,
            offset: offset,
          );

      salesResponseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              notifyStatus: NotifyStatus(message: failure.message),
            ),
          );
        },
        (success) {
          SalesModel updatedSalesList;

          if (offset == 0) {
            // Replace data for refresh
            updatedSalesList = success;
          } else {
            // Add to existing list for pagination
            updatedSalesList = success.copyWith(
              salerecords: [
                ...state.salesList?.salerecords ?? [],
                ...success.salerecords ?? [],
              ],
            );
          }

          final bool hasMoreData = (success.salerecords?.length ?? 0) == limit;

          emit(
            state.copyWith(
              isLoading: false,
              salesList: updatedSalesList,
              currentOffset: offset + limit,
              hasMoreData: hasMoreData,
              isSuccess: true,
              notifyStatus: NotifyStatus(message: 'Sales loaded successfully'),
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          notifyStatus: NotifyStatus(message: e.toString()),
        ),
      );
    }
  }

  void _onGetSaleDetailsEvent(
    _GetSaleDetailsEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, saleRecord: null));

      final Either<Failure, SaleRecord> responseEither = await _salesRepo
          .getSaleDetails(projectId: event.projectId);

      responseEither.fold(
        (failure) => emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        ),
        (saleRecord) => emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            saleRecord: saleRecord,
            notifyStatus: null,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(
            message: e.toString(),
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  void _onGetSalesProjectsByUserIdEvent(
    _GetSalesProjectsByUserIdEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, userSalesProjects: null));

      final Either<Failure, SalesModel> responseEither = await _salesRepo
          .getSalesProjectsByUserId(
            userId: event.userId,
            page: event.page,
            pageSize: event.pageSize,
          );

      responseEither.fold(
        (failure) => emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        ),
        (salesModel) => emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            userSalesProjects: salesModel,
            notifyStatus: null,
          ),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(
            message: e.toString(),
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  void _onCreateSalesProjectEvent(
    _CreateSalesProjectEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));

      final draft = state.createSalesDataModel;
      final Either<Failure, SalesModel> responseEither = await _salesRepo
          .createSalesProject(
            propertyType: event.propertyType,
            projectName: event.projectName,
            rera: event.rera,
            area: event.area,
            areaUnit: event.areaUnit,
            noOfUnits: event.noOfUnits,
            noOfFloors: event.noOfFloors,
            description: event.description ?? draft?.description,
            specifications: event.specifications ?? draft?.specifications,
            address: event.address ?? draft?.address,
            city: event.city ?? draft?.city,
            state: event.state ?? draft?.state,
            location: event.location ?? draft?.location,
            latitude: event.latitude ?? draft?.latitude,
            longitude: event.longitude ?? draft?.longitude,
            publicFacilities: event.publicFacilities ?? draft?.publicFacilities,
            minPrice: event.minPrice ?? draft?.minPrice,
            maxPrice: event.maxPrice ?? draft?.maxPrice,
            saleSpecification: event.saleSpecification ?? draft?.saleSpecification,
            possessionDate: event.possessionDate ?? draft?.possessionDate,
            images:
                draft?.imageFiles, // images are optional; handled in media step
            brochure: event.brochure ?? draft?.brochure,
          );

      responseEither.fold(
        (failure) => emit(
          state.copyWith(
            isLoading: false,
            isError: true,
            notifyStatus: NotifyStatus(
              message: failure.message,
              type: NotifyType.error,
            ),
          ),
        ),
        (successList) => emit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            saleRecord: successList.salerecords?.first,
            notifyStatus: NotifyStatus(
              message: 'Sales project created successfully',
              type: NotifyType.success,
            ),
          ),
        ),
      );
    } catch (e) {
      CustomToast.showErrorToast(msg: e.toString());
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(message: e.toString()),
        ),
      );
    }
  }

  void _onUpdateSalesDetailsEvent(
    _UpdateSalesDetailsEvent event,
    Emitter<SalesState> emit,
  ) {
    emit(state.copyWith(createSalesDataModel: event.createSalesDataModel));
  }

  void _onUpdateSalesMediaEvent(
    _UpdateSalesMediaEvent event,
    Emitter<SalesState> emit,
  ) {
    final current = state.createSalesDataModel;
    if (current == null) {
      emit(state.copyWith(createSalesDataModel: event.createSalesDataModel));
    } else {
      emit(
        state.copyWith(
          createSalesDataModel: current.copyWith(
            imageFiles: event.createSalesDataModel.imageFiles,
            brochure: event.createSalesDataModel.brochure,
            description: event.createSalesDataModel.description,
            specifications: event.createSalesDataModel.specifications,
          ),
        ),
      );
    }
  }

  void _onRequestCallbackEvent(
    _RequestCallbackEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));

      final responseEither = await _salesRepo.requestCallback(
        salesProjectId: event.salesProjectId,
      );

      responseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              isError: true,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
          CustomToast.showErrorToast(msg: failure.message);
        },
        (response) {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              notifyStatus: NotifyStatus(
                message:
                    response.message ??
                    'Callback request submitted successfully',
                type: NotifyType.success,
              ),
            ),
          );
          CustomToast.showSuccessToast(
            msg: response.message ?? 'Callback request submitted successfully',
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(
            message: e.toString(),
            type: NotifyType.error,
          ),
        ),
      );
      CustomToast.showErrorToast(msg: e.toString());
    }
  }

  void _onGetProjectUnitsEvent(
    _GetProjectUnitsEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));

      final responseEither = await _salesRepo.getProjectUnits(
        projectId: event.projectId,
      );

      responseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              isError: true,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
        },
        (response) {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              projectUnits: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(
            message: e.toString(),
            type: NotifyType.error,
          ),
        ),
      );
    }
  }

  void _onAddProjectUnitEvent(
    _AddProjectUnitEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));

      final responseEither = await _salesRepo.addProjectUnit(
        projectId: event.projectId,
        data: event.data,
      );

      responseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              isError: true,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
          CustomToast.showErrorToast(msg: failure.message);
        },
        (response) {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              notifyStatus: NotifyStatus(
                message: 'Unit added successfully',
                type: NotifyType.success,
              ),
            ),
          );
          CustomToast.showSuccessToast(msg: 'Unit added successfully');
          // Re-fetch project units
          add(SalesEvent.getProjectUnits(projectId: event.projectId));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(
            message: e.toString(),
            type: NotifyType.error,
          ),
        ),
      );
      CustomToast.showErrorToast(msg: e.toString());
    }
  }

  void _onEditProjectUnitEvent(
    _EditProjectUnitEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true, notifyStatus: null));

      final responseEither = await _salesRepo.editProjectUnit(
        unitId: event.unitId,
        data: event.data,
      );

      responseEither.fold(
        (failure) {
          emit(
            state.copyWith(
              isLoading: false,
              isError: true,
              notifyStatus: NotifyStatus(
                message: failure.message,
                type: NotifyType.error,
              ),
            ),
          );
          CustomToast.showErrorToast(msg: failure.message);
        },
        (response) {
          emit(
            state.copyWith(
              isLoading: false,
              isSuccess: true,
              notifyStatus: NotifyStatus(
                message: 'Unit updated successfully',
                type: NotifyType.success,
              ),
            ),
          );
          CustomToast.showSuccessToast(msg: 'Unit updated successfully');
          // Re-fetch project units
          add(SalesEvent.getProjectUnits(projectId: event.projectId));
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isError: true,
          notifyStatus: NotifyStatus(
            message: e.toString(),
            type: NotifyType.error,
          ),
        ),
      );
      CustomToast.showErrorToast(msg: e.toString());
    }
  }

  Future<void> _onGetProjectCallbacksEvent(
    _GetProjectCallbacksEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(callbacksLoading: true));
      final result = await _salesRepo.getCallbacksByProjectId(
        projectId: event.projectId,
      );
      result.fold(
        (failure) {
          emit(state.copyWith(
            callbacksLoading: false,
            notifyStatus: NotifyStatus(message: failure.message),
          ));
        },
        (callbacks) {
          emit(state.copyWith(
            callbacksLoading: false,
            projectCallbacks: callbacks,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        callbacksLoading: false,
        notifyStatus: NotifyStatus(message: e.toString()),
      ));
    }
  }

  Future<void> _onDeleteCallbackEvent(
    _DeleteCallbackEvent event,
    Emitter<SalesState> emit,
  ) async {
    try {
      emit(state.copyWith(callbacksLoading: true));
      final result = await _salesRepo.deleteCallback(
        callbackId: event.callbackId,
      );
      result.fold(
        (failure) {
          emit(state.copyWith(
            callbacksLoading: false,
            notifyStatus: NotifyStatus(message: failure.message),
          ));
          CustomToast.showErrorToast(msg: failure.message);
        },
        (_) {
          // Remove from local list immediately
          final updated = state.projectCallbacks
              .where((c) => c.id != event.callbackId)
              .toList();
          emit(state.copyWith(
            callbacksLoading: false,
            projectCallbacks: updated,
          ));
          CustomToast.showSuccessToast(msg: 'Request deleted');
          // Re-fetch to stay in sync
          add(SalesEvent.getProjectCallbacks(projectId: event.projectId));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        callbacksLoading: false,
        notifyStatus: NotifyStatus(message: e.toString()),
      ));
    }
  }
}
