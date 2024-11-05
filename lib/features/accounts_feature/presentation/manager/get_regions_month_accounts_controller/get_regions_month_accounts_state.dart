import '../../../data/models/get_regions_month_accounts_model.dart';

abstract class GetRegionsMonthAccountsState {}

 class GetRegionsMonthAccountsInitialState extends GetRegionsMonthAccountsState {}
 class GetRegionsMonthAccountsLoadingState extends GetRegionsMonthAccountsState {}
 class GetRegionsMonthAccountsSuccessState extends GetRegionsMonthAccountsState {
  final GetRegionsMonthAccountsDataModel model;
  GetRegionsMonthAccountsSuccessState(this.model);
}
 class GetRegionsMonthAccountsFailureState extends GetRegionsMonthAccountsState {
  final String errorMessage;

  GetRegionsMonthAccountsFailureState(this.errorMessage);
}

 class GetRegionsMonthAccountsChangedState extends GetRegionsMonthAccountsState {}


