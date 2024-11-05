import 'package:arm/core/utils/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/repo/active_business_licence_repo.dart';
import '../get_active_business_licence_controller/get_active_business_licence_cubit.dart';
import 'active_business_licence_state.dart';

class ActiveBusinessLicenceCubit extends Cubit<ActiveBusinessLicenceState> {
  ActiveBusinessLicenceCubit(this.activeBusinessLicenceRepo)
      : super(ActiveBusinessLicenceInitialState());
  final ActiveBusinessLicenceRepo activeBusinessLicenceRepo;

  Future<void> activeBusinessLicence(
    id,
    BuildContext context,

  ) async {
    emit(ActiveBusinessLicenceLoadingState());

    final data =
        await activeBusinessLicenceRepo.activeBusinessLicence(id,);
    data.fold(
      (l) => emit(
        ActiveBusinessLicenceFailureState(l.errorMessage),
      ),
      (r) async {
        await customToast(r, ToastStatus.success);
        context.pop();
        BlocProvider.of<GetActivationBusinessLicenceCubit>(context)
            .getActivationBusinessLicence();

        emit(ActiveBusinessLicenceSuccessState());
      },
    );
  }
}
