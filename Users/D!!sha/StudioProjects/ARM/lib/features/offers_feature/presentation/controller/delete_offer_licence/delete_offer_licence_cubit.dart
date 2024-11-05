import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/failure.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/delete_offer_licence_model.dart';
import '../../../data/repo/delete_offer_licence_repo.dart';
import '../get_activation_offer_licence/get_activation_offer_licence_cubit.dart';
import 'delete_offer_licence_state.dart';

class DeleteOfferLicenceCubit
    extends Cubit<DeleteOfferLicenceState> {
  final DeleteOfferLicenceRepo deleteOfferLicenceRepo;

  DeleteOfferLicenceCubit(this.deleteOfferLicenceRepo)
      : super(DeleteOfferLicenceInitialState());

  Future<void> deleteOfferLicence({
    required BuildContext context,

    required int id,
  }) async {
    emit(DeleteOfferLicenceLoadingState());

    final Either<Failure, DeleteOfferLicenceModel> data =
        await deleteOfferLicenceRepo.deleteOfferLicence( id);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        context.pop();

        emit(DeleteOfferLicenceFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        await BlocProvider.of<GetActivationOfferLicencesCubit>(context)
            .getGetActivationOfferLicence();
        emit(DeleteOfferLicenceSuccessState(r));
      },
    );
  }
}
