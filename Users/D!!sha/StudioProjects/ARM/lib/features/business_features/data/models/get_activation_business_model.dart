import 'package:equatable/equatable.dart';

import 'get_activation_business_data_model.dart';
import 'get_my_business_data_model.dart';

class GetActivationBusinessModel extends Equatable {
  final bool success;
  final String message;
  final List<GetActivationBusinessDataModel> data;

  const GetActivationBusinessModel(
    this.success,
    this.message,
    this.data,
  );

  factory GetActivationBusinessModel.fromJson(Map<String, dynamic> json) {
    return GetActivationBusinessModel(
      json['success'],
      json['message'],
      List.from(json['data']['content'] as List)
          .map((e) => GetActivationBusinessDataModel.fromJson(e))
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
