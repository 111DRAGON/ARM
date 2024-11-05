import 'package:arm/core/models/get_pending_approval%20_body.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/api/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/get_activation_notification_licence_model.dart';
import '../../../data/repo/get_activation_notification_licence_repo.dart';
import 'get_activation_notification_licence_state.dart';

class GetActivationNotificationLicencesCubit extends Cubit<GetActivationNotificationLicenceState> {
  final GetActivationNotificationLicencesRepo getActivationNotificationLicencesRepo;

  GetActivationNotificationLicencesCubit(this.getActivationNotificationLicencesRepo) : super(GetActivationNotificationLicenceInitialState());

  Future<void> getGetActivationNotificationLicence() async {
    emit(GetActivationNotificationLicenceLoadingState());
    final String? regionId = await SecureStorage.read('regionId');
    GetPendingApprovalBody body=GetPendingApprovalBody(regionId: regionId!);
    final Either<Failure, GetActivationNotificationLicencesModel> data =
    await getActivationNotificationLicencesRepo.getActivationNotificationLicences(body);
    data.fold(
          (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(
          GetActivationNotificationLicenceFailureState(l.errorMessage),
        );
      },
          (r) async {
        await customToast(r.message, ToastStatus.success);
        emit(
          GetActivationNotificationLicenceSuccessState(r),
        );
      },
    );
  }
}
