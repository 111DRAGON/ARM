import '../../../data/models/get_my_business_model.dart';

abstract class ActiveBusinessState {}

class ActiveBusinessInitialState extends ActiveBusinessState {}

class ActiveBusinessLoadingState extends ActiveBusinessState {}

class ActiveBusinessSuccessState extends ActiveBusinessState {
}

class ActiveBusinessFailureState extends ActiveBusinessState {
  final String errorMessage;

  ActiveBusinessFailureState(this.errorMessage);
}