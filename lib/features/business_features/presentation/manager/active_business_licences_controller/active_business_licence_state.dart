import '../../../data/models/get_my_business_model.dart';

abstract class ActiveBusinessLicenceState {}

class ActiveBusinessLicenceInitialState extends ActiveBusinessLicenceState {}

class ActiveBusinessLicenceLoadingState extends ActiveBusinessLicenceState {}

class ActiveBusinessLicenceSuccessState extends ActiveBusinessLicenceState {
}

class ActiveBusinessLicenceFailureState extends ActiveBusinessLicenceState {
  final String errorMessage;

  ActiveBusinessLicenceFailureState(this.errorMessage);
}