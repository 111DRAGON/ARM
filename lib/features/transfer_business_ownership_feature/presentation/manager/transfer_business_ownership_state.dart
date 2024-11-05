




import '../../data/models/transfer_business_ownership_model.dart';

sealed class TransferBusinessOwnershipState {}

final class TransferBusinessOwnershipInitialState extends TransferBusinessOwnershipState {}

final class TransferBusinessOwnershipLoadingState extends TransferBusinessOwnershipState {}

final class TransferBusinessOwnershipSuccessState extends TransferBusinessOwnershipState {
  final TransferBusinessOwnershipModel model;

  TransferBusinessOwnershipSuccessState(this.model);
}

final class TransferBusinessOwnershipFailureState extends TransferBusinessOwnershipState {
  final String errorMessage;

  TransferBusinessOwnershipFailureState(this.errorMessage);
}
