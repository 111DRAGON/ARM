import 'package:equatable/equatable.dart';

import 'city_data_model.dart';

class CitiesModel extends Equatable {
  final bool success;
  final String message;
  final List<CityDataModel> data;

  const CitiesModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) {
    return CitiesModel(
      success: json['success'],
      message: json['message'],
      data: List.from(
        (json['data'] as List).map((e) => CityDataModel.fromJson(e)),
      ),
    );
  }

  @override
  List<Object?> get props => [
        message,
        success,
        data,
      ];
}
