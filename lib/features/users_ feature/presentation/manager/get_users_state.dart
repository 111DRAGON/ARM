




import '../../data/models/get_users_model.dart';

class GetUsersState {}

class GetUsersInitialState extends GetUsersState {}

class GetUsersLoadingState extends GetUsersState {}

class GetUsersSuccessState extends GetUsersState {
  final GetUsersModel model;

  GetUsersSuccessState(this.model);
}

class GetUsersFailureState extends GetUsersState {
  final String errorMessage;

  GetUsersFailureState(this.errorMessage);
}
