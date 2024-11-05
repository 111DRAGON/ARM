class GetActivationAnnouncementLicencesDataModel {
  final int id;
  final String requestedAt;
  final bool premium;
  final Business business;
  final Announcement announcement;
  final Plan plan;

  GetActivationAnnouncementLicencesDataModel({
    required this.id,
    required this.requestedAt,
    required this.premium,
    required this.business,
    required this.announcement,
    required this.plan,
  });

  factory GetActivationAnnouncementLicencesDataModel.fromJson(
      Map<String, dynamic> json) {
    return GetActivationAnnouncementLicencesDataModel(
      id: json['id'],
      requestedAt: json['requestedAt'],
      premium: json['premium'],
      business: Business.fromJson(json['business']),
      announcement: Announcement.fromJson(json['announcement']),
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

class Announcement {
  final int id;
  final String title;
  final String description;
  final String poster;

  Announcement(
      {required this.id,
      required this.title,
      required this.description,
      required this.poster});

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
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
  final num premiumCost;
  final num days;

  Plan(
      {required this.id,
      required this.name,
      required this.cost,
      required this.premiumCost,
      required this.days});

  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['id'],
      name: json['name'],
      cost: json['cost'],
      premiumCost: json['premiumCost'],
      days: json['days'],
    );
  }
}
