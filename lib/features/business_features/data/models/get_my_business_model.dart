import 'package:equatable/equatable.dart';

import 'get_my_business_data_model.dart';

class GetMyBusinessModel extends Equatable {
  final bool success;
  final String message;
  final List<GetMyBusinessDataModel> data;

  const GetMyBusinessModel(
    this.success,
    this.message,
    this.data,
  );

  factory GetMyBusinessModel.fromJson(Map<String, dynamic> json) {
    return GetMyBusinessModel(
      json['success'],
      json['message'],
      List.from(json['data']['content'] as List)
          .map((e) => GetMyBusinessDataModel.fromJson(e))
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
