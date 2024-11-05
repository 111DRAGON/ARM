class GetActivationBusinessLicenceDataModel {
  final int id;
  final String requestedAt;
  final Business business;
  final Plan plan;

  GetActivationBusinessLicenceDataModel(
      {required this.id,
      required this.requestedAt,
      required this.business,
      required this.plan});

  factory GetActivationBusinessLicenceDataModel.fromJson(Map<String, dynamic> json) {
    return GetActivationBusinessLicenceDataModel(
      id: json['id'],
      requestedAt: json['requestedAt'],
      business: Business.fromJson(json['business']),
      plan: Plan.fromJson(json['plan']),
    );
  }
}

class Business {
  final int id;
  final String name;
  final String description;
  final String address;
  final String regionName;
  final String logo;

  Business(
      {required this.id,
      required this.name,
      required this.description,
      required this.address,
      required this.regionName,
      required this.logo});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      address: json['address'],
      regionName: json['region']['name'],
      logo: json['logo'],
    );
  }
}

class Plan {
  final int id;
  final String name;
  final double cost;
  final int days;

  Plan(
      {required this.id,
      required this.name,
      required this.cost,
      required this.days});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      name: json['name'],
      cost:  json['cost'],
      days:  json['days'],
    );

  }
}
