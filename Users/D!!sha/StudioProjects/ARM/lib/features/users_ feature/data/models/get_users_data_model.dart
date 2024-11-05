

class GetUsersDataModel {
  final int id;
  final String number;
  final String firstName;
  final String lastName;


  GetUsersDataModel({
    required this.id,
    required this.firstName,
    required this. lastName,
    required this.number,
  });

  factory GetUsersDataModel.fromJson(Map<String, dynamic> json) {
    return GetUsersDataModel(
      id: json['id'],
      number: json['phoneNumber'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}
