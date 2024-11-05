import 'package:equatable/equatable.dart';

import 'get_activation_business_data_model.dart';
import 'get_activation_business_licence_data_model.dart';
import 'get_my_business_data_model.dart';

class GetActivationBusinessLicenceModel extends Equatable {
  final bool success;
  final String message;
  final List<GetActivationBusinessLicenceDataModel> data;

  const GetActivationBusinessLicenceModel(
    this.success,
    this.message,
    this.data,
  );

  factory GetActivationBusinessLicenceModel.fromJson(Map<String, dynamic> json) {
    return GetActivationBusinessLicenceModel(
      json['success'],
      json['message'],
      List.from(json['data']['content'] as List)
          .map((e) => GetActivationBusinessLicenceDataModel.fromJson(e))
          .toList(),
    );
  }

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
