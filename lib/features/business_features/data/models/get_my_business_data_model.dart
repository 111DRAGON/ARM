import 'package:equatable/equatable.dart';

class GetMyBusinessDataModel extends Equatable {
  final int id;
  final String name;
  final String description;
  final String address;
  final String logo;
  final bool deleted;

  const GetMyBusinessDataModel(
    this.id,
    this.name,
    this.description,
    this.address,
    this.logo, this.deleted,
  );

  factory GetMyBusinessDataModel.fromJson(Map<String, dynamic> json) {
    return GetMyBusinessDataModel(
      json['id'],
      json['name'],
      json['description'],
      json['address'],
      json['logo'],
      json['deleted'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        address,
        logo,
    deleted
      ];
}
