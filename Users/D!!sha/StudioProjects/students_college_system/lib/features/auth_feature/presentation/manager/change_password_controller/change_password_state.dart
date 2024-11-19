
abstract class ChangePasswordState {}

class ChangePasswordInitialState extends ChangePasswordState {}

class ChangePasswordLoadingState extends ChangePasswordState {}

class ChangePasswordSuccessState extends ChangePasswordState {

}

class ChangePasswordFailureState extends ChangePasswordState {
  final String errorMessage;

  ChangePasswordFailureState(this.errorMessage);
}

class ChangePasswordPasswordVisibilityState extends ChangePasswordState {}
