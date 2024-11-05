import 'package:arm/core/models/get_pending_approval%20_body.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/api/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../data/models/get_activation_business_licence_model.dart';
import '../../../data/models/get_activation_business_model.dart';
import '../../../data/repo/get_activation_business_licence_repo.dart';
import '../../../data/repo/get_activation_business_repo.dart';
import 'get_active_business_licence_state.dart';

class GetActivationBusinessLicenceCubit
    extends Cubit<GetActivationBusinessLicenceState> {
  GetActivationBusinessLicenceCubit(this.getActivationBusinessLicenceRepo)
      : super(GetActivationBusinessLicenceInitialState());
  final GetActivationBusinessLicenceRepo getActivationBusinessLicenceRepo;

  Future<void> getActivationBusinessLicence() async {
    emit(GetActivationBusinessLicenceLoadingState());
    final String? regionId = await SecureStorage.read('regionId');
    GetPendingApprovalBody body = GetPendingApprovalBody(regionId: regionId!);
    final Either<Failure, GetActivationBusinessLicenceModel> data =
        await getActivationBusinessLicenceRepo
            .getActivationBusinessLicence(body);

    data.fold(
      (l) => emit(GetActivationBusinessLicenceFailureState(l.errorMessage)),
      (r) => emit(GetActivationBusinessLicenceSuccessState(r)),
    );
  }
}
