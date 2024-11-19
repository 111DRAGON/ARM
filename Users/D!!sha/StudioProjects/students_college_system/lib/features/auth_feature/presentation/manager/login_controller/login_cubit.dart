import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController idController;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  bool passwordObscure = true;

  LoginCubit() : super(LoginInitialState()) {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    idController = TextEditingController();
  }

  Future<void> login(BuildContext context) async {
    emit(LoginLoadingState());


  }

  void changePasswordVisibility() {
    passwordObscure = !passwordObscure;
    emit(LoginPasswordVisibilityState());
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    idController.dispose();

    return super.close();
  }
}
