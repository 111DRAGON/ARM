class TransferBusinessOwnershipModel {
  bool success;
  String message;

  TransferBusinessOwnershipModel({
    required this.success,
    required this.message,
  });

  factory TransferBusinessOwnershipModel.fromJson(Map<String, dynamic> json) {
    return TransferBusinessOwnershipModel(
      success: json['success'],
      message: json['message'],
    );
  }
}
