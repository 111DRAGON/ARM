import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/failure.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/delete_notification_model.dart';
import '../../../data/repo/delete_notification_repo.dart';
import '../get_activation_notification_licence/get_activation_notification_licence_cubit.dart';
import 'delete_notification_state.dart';

class DeleteNotificationCubit extends Cubit<DeleteNotificationState> {
  final DeleteNotificationRepo deleteNotificationRepo;

  DeleteNotificationCubit(this.deleteNotificationRepo)
      : super(DeleteNotificationInitialState());

  Future<void> deleteNotification(
      {required BuildContext context, required int id,}) async {
    emit(DeleteNotificationLoadingState());

    final Either<Failure, DeleteNotificationModel> data =
        await deleteNotificationRepo.deleteNotification(id);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(DeleteNotificationFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        await BlocProvider.of<GetActivationNotificationLicencesCubit>(context)
            .getGetActivationNotificationLicence();
        emit(DeleteNotificationSuccessState(r));

      },
    );
  }
}
