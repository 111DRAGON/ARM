import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/api/failure.dart';
import '../../../data/models/get_my_business_body.dart';
import '../../../data/models/get_my_business_model.dart';
import '../../../data/repo/get_my_business_repo.dart';
import 'get_my_business_state.dart';

class GetMyBusinessCubit extends Cubit<GetMyBusinessState> {
  GetMyBusinessCubit(this.getMyBusinessRepo)
      : super(GetMyBusinessInitialState());
  final GetMyBusinessRepo getMyBusinessRepo;
 TextEditingController? searchKeyword= TextEditingController();

  Future<void> getMyBusiness() async {
    emit(GetMyBusinessLoadingState());
    GetMyBusinessBody body = GetMyBusinessBody(

      searchKeyword: searchKeyword?.text??"",

    );
    final Either<Failure, GetMyBusinessModel> data =
        await getMyBusinessRepo.getMyBusiness(body);

    data.fold(
      (l) => emit(GetMyBusinessFailureState(l.errorMessage)),
      (r) => emit(GetMyBusinessSuccessState(r)),
    );
  }
}
