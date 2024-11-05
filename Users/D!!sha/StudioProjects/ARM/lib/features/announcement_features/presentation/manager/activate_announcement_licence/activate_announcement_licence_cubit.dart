import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/failure.dart';

import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/activate_announcement_licence_model.dart';
import '../../../data/repo/activate_announcement_licence_repo.dart';
import '../get_activation_announcement_licence/get_activation_announcement_licence_cubit.dart';
import 'activate_announcement_licence_state.dart';

class ActivateAnnouncementLicenceCubit
    extends Cubit<ActivateAnnouncementLicenceState> {
  final ActivateAnnouncementLicenceRepo activateAnnouncementLicenceRepo;

  ActivateAnnouncementLicenceCubit(this.activateAnnouncementLicenceRepo)
      : super(ActivateAnnouncementLicenceInitialState());

  Future<void> activateAnnouncementLicence({
    required BuildContext context,
    required int id,
  }) async {
    emit(ActivateAnnouncementLicenceLoadingState());

    final Either<Failure, ActivateAnnouncementLicenceModel> data =
        await activateAnnouncementLicenceRepo.activateAnnouncementLicence(
            id, );

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(ActivateAnnouncementLicenceFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        BlocProvider.of<GetActivationAnnouncementLicencesCubit>(context)
            .getGetActivationAnnouncementLicence();
        emit(ActivateAnnouncementLicenceSuccessState(r));
      },
    );
  }
}
