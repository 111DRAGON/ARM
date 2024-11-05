import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../data/models/get_regions_month_accounts_body.dart';
import '../../../data/models/get_regions_month_accounts_model.dart';
import '../../../data/repo/get_regions_month_accounts_repo.dart';
import '../../pages/accounts_details_view.dart';
import 'get_regions_month_accounts_state.dart';

class GetRegionsMonthAccountsCubit extends Cubit<GetRegionsMonthAccountsState> {
  final GetRegionsMonthAccountsRepo getRegionsMonthAccountsRepo;
  GetRegionsMonthAccountsCubit(
    this.getRegionsMonthAccountsRepo,
  ) : super(GetRegionsMonthAccountsInitialState());

   String ?date;

  Future<void> getRegionsMonthAccounts(
    BuildContext context,
  ) async {
    emit(GetRegionsMonthAccountsLoadingState());
    final String? regionId = await SecureStorage.read('regionId');

    GetRegionsMonthAccountsBody body =
        GetRegionsMonthAccountsBody(regionId: regionId!, date: date!);
    final Either<Failure, GetRegionsMonthAccountsModel> data =
        await getRegionsMonthAccountsRepo.getRegionsMonthAccounts(
      body,
    );

    data.fold((l) async {
      await customToast(l.errorMessage, ToastStatus.error);
      emit(GetRegionsMonthAccountsFailureState(l.errorMessage));
    }, (r) async {
      await customToast(r.message, ToastStatus.success);
      context.push(AccountsDetailsView(model:r.data ,));

      emit(GetRegionsMonthAccountsSuccessState(r.data));
    });
  }
}
