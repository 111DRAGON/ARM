import 'package:arm/core/models/get_pending_approval%20_body.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/get_activation_offer_licence_model.dart';
import '../../../data/repo/get_activation_offer_licence_repo.dart';
import 'get_activation_offer_licence_state.dart';

class GetActivationOfferLicencesCubit
    extends Cubit<GetActivationOfferLicenceState> {
  final GetActivationOfferLicencesRepo getActivationOfferLicencesRepo;

  GetActivationOfferLicencesCubit(
    this.getActivationOfferLicencesRepo,
  ) : super(GetActivationOfferLicenceInitialState());

  Future<void> getGetActivationOfferLicence() async {
    emit(GetActivationOfferLicenceLoadingState());
    final String? regionId = await SecureStorage.read('regionId');
    GetPendingApprovalBody body = GetPendingApprovalBody(regionId: regionId!);
    final Either<Failure, GetActivationOfferLicencesModel> data =
        await getActivationOfferLicencesRepo.getActivationOfferLicences(body);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(
          GetActivationOfferLicenceFailureState(l.errorMessage),
        );
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        emit(
          GetActivationOfferLicenceSuccessState(r),
        );
      },
    );
  }
}
