import 'package:arm/core/utils/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/repo/business_repo.dart';
import '../../pages/get_activation_business_licence_view.dart';
import '../get_activation_business_controller/get_activation_business_cubit.dart';
import '../get_active_business_licence_controller/get_active_business_licence_cubit.dart';
import 'delete_business_state.dart';

class DeleteBusinessCubit extends Cubit<DeleteBusinessState> {
  final BusinessRepo repo;

  DeleteBusinessCubit(this.repo) : super(DeleteBusinessInitialState());

  Future<void> deleteBusiness(BuildContext context, int id, ) async {
    emit(DeleteBusinessLoadingState());
    final result = await repo.deleteBusiness(id);
    result.fold((l) async {
      await customToast(l.errorMessage, ToastStatus.error);
      context.push(const GetActivationBusinessLicenceView());
      emit(DeleteBusinessFailureState(l.errorMessage));
    }, (r) async {
      await customToast(r, ToastStatus.success);
      context.pop();
      BlocProvider.of<GetActivationBusinessCubit>(context)
          .getActivationBusiness();

      emit(DeleteBusinessSuccessState());
    });
  }
}
