import 'package:arm/core/utils/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../data/repo/active_business_repo.dart';
import '../../pages/get_activation_business_view.dart';
import 'active_business_state.dart';

class ActiveBusinessCubit extends Cubit<ActiveBusinessState>{
  ActiveBusinessCubit(this.activeBusinessRepo):super(ActiveBusinessInitialState());
  final ActiveBusinessRepo activeBusinessRepo;

  Future<void> activeBusiness(id,  BuildContext context,)async{
    emit(ActiveBusinessLoadingState());

      final  data = await activeBusinessRepo.activeBusiness(id);
    data.fold(
          (l) => emit(
            ActiveBusinessFailureState(l.errorMessage),
      ),
          (r) async {
        await customToast(r, ToastStatus.success);
        context.push( const GetActivationBusinessView());
        emit(ActiveBusinessSuccessState());
      },
    );


  }
}