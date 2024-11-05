import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../data/models/get_users_body.dart';
import '../../data/models/get_users_model.dart';
import '../../data/repo/get_users_repo.dart';
import 'get_users_state.dart';

class GetUsersCubit extends Cubit<GetUsersState> {
  final GetUsersRepo getUsersRepo;

  GetUsersCubit(this.getUsersRepo) : super(GetUsersInitialState());
  TextEditingController? searchKeyword= TextEditingController();

  Future<void> getUsers() async {
    emit(GetUsersLoadingState());
    GetUsersBody body = GetUsersBody(searchKeyword: searchKeyword?.text??""


      );
    final Either<Failure, GetUsersModel> data =
        await getUsersRepo.getUsers(body);

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(
          GetUsersFailureState(l.errorMessage),
        );
      },
      (r) async {
        await customToast(r.message, ToastStatus.success);
        emit(
          GetUsersSuccessState(r),
        );
      },
    );
  }
}
