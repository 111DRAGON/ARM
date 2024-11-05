abstract class DeleteBusinessState {}


class DeleteBusinessInitialState extends DeleteBusinessState {}

class DeleteBusinessLoadingState extends DeleteBusinessState {}

class DeleteBusinessSuccessState extends DeleteBusinessState {}

class DeleteBusinessFailureState extends DeleteBusinessState {
  final String errorMessage;

  DeleteBusinessFailureState(this.errorMessage);
}
