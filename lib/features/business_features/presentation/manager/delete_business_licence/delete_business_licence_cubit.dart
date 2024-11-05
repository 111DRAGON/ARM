import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/failure.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/delete_business_licence_model.dart';
import '../../../data/repo/delete_business_licence_repo.dart';
import '../get_active_business_licence_controller/get_active_business_licence_cubit.dart';
import 'delete_business_licence_state.dart';

class DeleteBusinessLicenceCubit extends Cubit<DeleteBusinessLicenceState> {
  final DeleteBusinessLicenceRepo deleteBusinessLicenceRepo;

  DeleteBusinessLicenceCubit(this.deleteBusinessLicenceRepo)
      : super(DeleteBusinessLicenceInitialState());

  Future<void> deleteBusinessLicence({
    required BuildContext context,
    required int id,
  }) async {
    emit(DeleteBusinessLicenceLoadingState());

    final Either<Failure, DeleteBusinessLicenceModel> data =
        await deleteBusinessLicenceRepo.deleteBusinessLicence(id);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        context.pop();

        emit(DeleteBusinessLicenceFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        await BlocProvider.of<GetActivationBusinessLicenceCubit>(context)
            .getActivationBusinessLicence();
        emit(DeleteBusinessLicenceSuccessState(r));
      },
    );
  }
}
