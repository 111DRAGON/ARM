import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/api/failure.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/activate_notification_licence_model.dart';
import '../../../data/repo/activate_notification_licence_repo.dart';
import '../get_activation_notification_licence/get_activation_notification_licence_cubit.dart';
import 'activate_notification_licence_state.dart';

class ActivateNotificationLicenceCubit
    extends Cubit<ActivateNotificationLicenceState> {
  final ActivateNotificationLicenceRepo activateNotificationLicenceRepo;

  ActivateNotificationLicenceCubit(this.activateNotificationLicenceRepo)
      : super(ActivateNotificationLicenceInitialState());

  Future<void> activateNotificationLicence({
    required BuildContext context,
    required int id,
  }) async {
    emit(ActivateNotificationLicenceLoadingState());
    final Either<Failure, ActivateNotificationLicenceModel> data =
        await activateNotificationLicenceRepo.activateNotificationLicence(id,);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(ActivateNotificationLicenceFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        BlocProvider.of<GetActivationNotificationLicencesCubit>(context)
            .getGetActivationNotificationLicence();
        emit(ActivateNotificationLicenceSuccessState(r));
      },
    );
  }
}
