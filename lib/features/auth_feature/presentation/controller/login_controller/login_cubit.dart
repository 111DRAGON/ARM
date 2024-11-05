import 'package:arm/core/utils/custom_navigation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/api/failure.dart';

import '../../../../../core/storage/secure_storage.dart';
import '../../../../../core/widgets/custom_toast.dart';
import '../../../../regions_features/presentation/pages/choose_region_id_view.dart';
import '../../../data/login_data/model/login_body.dart';
import '../../../data/login_data/model/login_model.dart';
import '../../../data/login_data/repo/login_admin_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginAdminRepo loginAdminRepo;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
  }

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool passwordObscure = true;

  LoginCubit(this.loginAdminRepo) : super(LoginInitialState());

  Future<void> login(BuildContext context) async {
    emit(LoginLoadingState());

    LoginBody body = LoginBody(
      phone: phoneController.text,
      password: passwordController.text,
    );

    final Either<Failure, LoginModel> data = await loginAdminRepo.login(body);

    data.fold(
          (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(LoginFailureState(l.errorMessage));
      },
          (r) async {

        await SecureStorage.write('token', r.data);
        await customToast('تم تسجيل الدخول بنجاح', ToastStatus.success);
         context.pushReplacement( const ChooseRegionIdView());
        emit(LoginSuccessState(r));
      },
    );
  }

  void changePasswordVisibility() {
    passwordObscure = !passwordObscure;
    emit(LoginChangedState());
  }
}
