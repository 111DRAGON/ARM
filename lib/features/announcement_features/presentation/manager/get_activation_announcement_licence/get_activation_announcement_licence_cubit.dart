import 'package:arm/core/models/get_pending_approval%20_body.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/api/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/get_activation_announcement_licence_model.dart';
import '../../../data/repo/get_activation_announcement_licence_repo.dart';
import 'get_activation_announcement_licence_state.dart';

class GetActivationAnnouncementLicencesCubit
    extends Cubit<GetActivationAnnouncementLicenceState> {
  final GetActivationAnnouncementLicencesRepo
      getActivationAnnouncementLicencesRepo;

  GetActivationAnnouncementLicencesCubit(
      this.getActivationAnnouncementLicencesRepo)
      : super(GetActivationAnnouncementLicenceInitialState());

  Future<void> getGetActivationAnnouncementLicence( ) async {
    emit(GetActivationAnnouncementLicenceLoadingState());
    final String? regionId = await SecureStorage.read('regionId');
    GetPendingApprovalBody body=GetPendingApprovalBody(regionId: regionId!);
    final Either<Failure, GetActivationAnnouncementLicencesModel> data =
        await getActivationAnnouncementLicencesRepo
            .getActivationAnnouncementLicences(body);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(
          GetActivationAnnouncementLicenceFailureState(l.errorMessage),
        );
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        emit(
          GetActivationAnnouncementLicenceSuccessState(r),
        );
      },
    );
  }
}
