import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  late TextEditingController oldPasswordController;
  late TextEditingController newPasswordController1;
  late TextEditingController newPasswordController2;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool oldPasswordObscure = true;
  bool newPasswordObscure1 = true;
  bool newPasswordObscure2 = true;

  ChangePasswordCubit() : super(ChangePasswordInitialState()) {
    newPasswordController1 = TextEditingController();
    newPasswordController2 = TextEditingController();
    oldPasswordController = TextEditingController();
  }

  Future<void> login(BuildContext context) async {
    emit(ChangePasswordLoadingState());
  }

  void changeOldPasswordVisibility() {
    oldPasswordObscure = !oldPasswordObscure;
    emit(ChangePasswordPasswordVisibilityState());
  }

  void changeNewPasswordVisibility1() {
    newPasswordObscure1 = !newPasswordObscure1;
    emit(ChangePasswordPasswordVisibilityState());
  }

  void changeNewPasswordVisibility2() {
    newPasswordObscure2 = !newPasswordObscure2;
    emit(ChangePasswordPasswordVisibilityState());
  }

  @override
  Future<void> close() {
    oldPasswordController.dispose();
    newPasswordController1.dispose();
    newPasswordController2.dispose();

    return super.close();
  }
}
