import '../../../data/login_data/model/login_model.dart';

abstract class LoginState {}

 class LoginInitialState extends LoginState {}
 class LoginLoadingState extends LoginState {}
 class LoginSuccessState extends LoginState {
  final LoginModel model;
  LoginSuccessState(this.model);
}
 class LoginFailureState extends LoginState {
  final String errorMessage;

  LoginFailureState(this.errorMessage);
}

 class LoginChangedState extends LoginState {}

