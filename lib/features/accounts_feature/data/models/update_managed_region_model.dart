

class UpdateManagedRegionsModel {
  final bool success;
  final String message;

  UpdateManagedRegionsModel({
    required this.success,
    required this.message,
  });

  factory UpdateManagedRegionsModel.fromJson(Map<String, dynamic> json) {
    return UpdateManagedRegionsModel(
      success: json['success'],
      message: json['message'],

    );
  }
}

