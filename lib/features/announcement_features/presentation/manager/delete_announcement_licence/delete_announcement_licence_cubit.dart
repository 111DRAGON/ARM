import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/failure.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/delete_announcement_licence_model.dart';
import '../../../data/repo/delete_announcement_licence_repo.dart';
import '../get_activation_announcement_licence/get_activation_announcement_licence_cubit.dart';
import 'delete_announcement_licence_state.dart';

class DeleteAnnouncementLicenceCubit
    extends Cubit<DeleteAnnouncementLicenceState> {
  final DeleteAnnouncementLicenceRepo deleteAnnouncementRepo;

  DeleteAnnouncementLicenceCubit(this.deleteAnnouncementRepo)
      : super(DeleteAnnouncementLicenceInitialState());

  Future<void> deleteAnnouncement({
    required BuildContext context,

    required int id,
  }) async {
    emit(DeleteAnnouncementLicenceLoadingState());


    final Either<Failure, DeleteAnnouncementLicenceModel> data =
        await deleteAnnouncementRepo.deleteAnnouncementLicence( id);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        context.pop();

        emit(DeleteAnnouncementLicenceFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        await BlocProvider.of<GetActivationAnnouncementLicencesCubit>(context)
            .getGetActivationAnnouncementLicence();
        emit(DeleteAnnouncementLicenceSuccessState(r));
      },
    );
  }
}
