class GetActivationOfferLicencesDataModel {
  final int id;
  final String requestedAt;
  final Business business;
  final Offer offer;
  final Plan plan;

  GetActivationOfferLicencesDataModel({
    required this.id,
    required this.requestedAt,
    required this.business,
    required this.offer,
    required this.plan,
  });

  factory GetActivationOfferLicencesDataModel.fromJson(
      Map<String, dynamic> json) {
    return GetActivationOfferLicencesDataModel(
      id: json['id'],
      requestedAt: json['requestedAt'],
      business: Business.fromJson(json['business']),
      offer: Offer.fromJson(json['offer']),
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

  Business({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.regionName,
    required this.logo,
  });

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

class Offer {
  final int id;
  final String title;
  final String description;
  final String poster;

  Offer(
      {required this.id,
        required this.title,
        required this.description,
        required this.poster});

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      poster: json['poster'],
    );
  }
}

class Plan {
  final int id;
  final String name;
  final num cost;
  final num days;

  Plan(
      {required this.id,
        required this.name,
        required this.cost,
        required this.days});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      days: json['days'],
    );
  }
}
