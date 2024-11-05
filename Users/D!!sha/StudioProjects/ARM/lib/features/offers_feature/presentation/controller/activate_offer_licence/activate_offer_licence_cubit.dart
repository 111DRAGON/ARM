import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/failure.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/activate_offer_licence_model.dart';
import '../../../data/repo/activate_offer_licence_repo.dart';
import '../get_activation_offer_licence/get_activation_offer_licence_cubit.dart';
import 'activate_offer_licence_state.dart';

class ActivateOfferLicenceCubit
    extends Cubit<ActivateOfferLicenceState> {
  final ActivateOfferLicenceRepo activateOfferLicenceRepo;

  ActivateOfferLicenceCubit(this.activateOfferLicenceRepo)
      : super(ActivateOfferLicenceInitialState());

  Future<void> activateOfferLicence({
    required BuildContext context,
    required int id,

  }) async {
    emit(ActivateOfferLicenceLoadingState());

    final Either<Failure, ActivateOfferLicenceModel> data =
        await activateOfferLicenceRepo.activateOfferLicence(id,);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(ActivateOfferLicenceFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        BlocProvider.of<GetActivationOfferLicencesCubit>(context)
            .getGetActivationOfferLicence();
        emit(ActivateOfferLicenceSuccessState(r));
      },
    );
  }
}
