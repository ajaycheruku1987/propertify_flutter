part of 'sales_bloc.dart';

@freezed
class SalesState with _$SalesState {
  const factory SalesState({
    @Default(false) bool isLoading,
    @Default(false) bool isError,
    @Default(false) bool isSuccess,
    SalesModel? salesList,
    SaleRecord? saleRecord,
    SalesModel? userSalesProjects,
    @Default(0) int currentOffset,
    @Default(false) bool hasMoreData,
    CreateSalesDataModel? createSalesDataModel,
    SalesUnitResponseModel? projectUnits,
    @Default([]) List<CallbackRequestModel> projectCallbacks,
    @Default(false) bool callbacksLoading,
    NotifyStatus? notifyStatus,
  }) = _SalesState;
}
