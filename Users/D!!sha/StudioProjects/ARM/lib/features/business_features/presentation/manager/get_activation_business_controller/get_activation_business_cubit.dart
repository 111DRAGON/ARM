import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/api/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../data/models/get_activation_business_model.dart';
import '../../../../../core/models/get_pending_approval _body.dart';
import '../../../data/repo/get_activation_business_repo.dart';
import 'get_activation_business_state.dart';

class GetActivationBusinessCubit extends Cubit<GetActivationBusinessState> {
  GetActivationBusinessCubit(this.getActivationBusinessRepo)
      : super(GetActivationBusinessInitialState());
  final GetActivationBusinessRepo getActivationBusinessRepo;

  Future<void> getActivationBusiness( ) async {
    emit(GetActivationBusinessLoadingState());
    final String? regionId = await SecureStorage.read('regionId');
    GetPendingApprovalBody body=GetPendingApprovalBody(regionId: regionId!);
    final Either<Failure, GetActivationBusinessModel> data =
        await getActivationBusinessRepo.getActivationBusiness(body);

    data.fold(
      (l) => emit(GetActivationBusinessFailureState(l.errorMessage)),
      (r) => emit(GetActivationBusinessSuccessState(r)),
    );
  }
}
