import 'package:equatable/equatable.dart';

import 'region_data_model.dart';

class RegionsModel extends Equatable {
  final bool success;
  final String message;
  final List<RegionDataModel> data;

  const RegionsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory RegionsModel.fromJson(Map<String, dynamic> json) {
    return RegionsModel(
      success: json['success'],
      message: json['message'],
      data: List.from(
        (json['data'] as List).map(
          (e) => RegionDataModel.fromJson(e),
        ),
      ),
    );
  }

  @override
  List<Object?> get props => [
        data,
        success,
        message,
      ];
}
