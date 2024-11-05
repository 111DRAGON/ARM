
import 'package:arm/core/utils/custom_navigation.dart';
import 'package:arm/features/transfer_business_ownership_feature/presentation/manager/transfer_business_ownership_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../data/models/transfer_business_ownership_body.dart';
import '../../data/models/transfer_business_ownership_model.dart';
import '../../data/repo/transfer_business_ownership_repo.dart';

class TransferBusinessOwnershipCubit
    extends Cubit<TransferBusinessOwnershipState> {
  final TransferBusinessOwnershipRepo transferBusinessOwnershipRepo;

  TransferBusinessOwnershipCubit(this.transferBusinessOwnershipRepo)
      : super(TransferBusinessOwnershipInitialState());

  Future<void> transferBusinessOwnership({
    required BuildContext context,
    required String userId,
    required String businessId,

  }) async {
    emit(TransferBusinessOwnershipLoadingState());
TransferBusinessOwnershipBody body=TransferBusinessOwnershipBody( userId: userId, businessId:businessId);
    final Either<Failure, TransferBusinessOwnershipModel> data =
        await transferBusinessOwnershipRepo.transferBusinessOwnership(body );

    data.fold(
      (l) async {

        await customToast(l.errorMessage, ToastStatus.error);
        emit(TransferBusinessOwnershipFailureState(l.errorMessage));
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        context.pop();
        emit(TransferBusinessOwnershipSuccessState(r));
      },
    );
  }
}
