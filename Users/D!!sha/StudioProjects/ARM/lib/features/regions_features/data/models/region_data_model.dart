import 'package:equatable/equatable.dart';

class RegionDataModel extends Equatable{
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final int cityId;

  const RegionDataModel({
    required this.id,
    required this.name,
    required this.cityId,
    required this.latitude,
    required this.longitude,
  });

  factory RegionDataModel.fromJson(Map<String, dynamic> json) {
    return RegionDataModel(
      id: json['id'],
      name: json['name'],
      cityId: json['cityId'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  @override
  List<Object?> get props => [
    name,
    id,
    cityId,
    latitude,
    longitude,
  ];
}
