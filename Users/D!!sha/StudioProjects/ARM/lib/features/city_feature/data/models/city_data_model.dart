import 'package:equatable/equatable.dart';

class CityDataModel extends Equatable {
  final int id;
  final String name;

  const CityDataModel(
    this.id,
    this.name,
  );

  factory CityDataModel.fromJson(Map<String, dynamic> json) {
    return CityDataModel(
      json['id'],
      json['name'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
