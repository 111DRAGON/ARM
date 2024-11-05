import 'get_users_data_model.dart';

class GetUsersModel {
  final bool success;
  final String message;
  final List<GetUsersDataModel> data;

  GetUsersModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetUsersModel.fromJson(Map<String, dynamic> json) {
    return GetUsersModel(
      success: json['success'],
      message: json['message'],
      data: List.from(
        (json['data']["content"] as List)
            .map((e) => GetUsersDataModel.fromJson(e)),
      ),
    );
  }
}
