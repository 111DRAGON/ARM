
import 'get_activation_announcement_licence_data_model.dart';

class GetActivationAnnouncementLicencesModel {
  final bool success;
  final String message;
  final List<GetActivationAnnouncementLicencesDataModel> data;

  GetActivationAnnouncementLicencesModel(
      {required this.success, required this.message, required this.data});

  factory GetActivationAnnouncementLicencesModel.fromJson(Map<String, dynamic> json) {
    return GetActivationAnnouncementLicencesModel(
      success: json['success'],
      message: json['message'],
      data: List.from(
        (json['data']["content"] as List).map((e) => GetActivationAnnouncementLicencesDataModel.fromJson(e)),
      ),
    );
  }
}

