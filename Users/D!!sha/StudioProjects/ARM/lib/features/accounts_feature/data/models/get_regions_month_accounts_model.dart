class GetRegionsMonthAccountsModel {
  final bool success;
  final String message;
  final GetRegionsMonthAccountsDataModel data;

  GetRegionsMonthAccountsModel(
      {required this.success, required this.message, required this.data});

  factory GetRegionsMonthAccountsModel.fromJson(Map<String, dynamic> json) {
    return GetRegionsMonthAccountsModel(
      success: json['success'],
      message: json['message'],
      data: GetRegionsMonthAccountsDataModel.fromJson(json['data']),
    );
  }
}

class GetRegionsMonthAccountsDataModel {
  final List<AnnouncementStatistics> announcementStatistics;
  final List<BusinessStatistics> businessStatistics;
  final List<NotificationStatistics> notificationStatistics;
  final List<OfferStatistics> offerStatistics;
  final num totalCost;

  GetRegionsMonthAccountsDataModel(
      {required this.announcementStatistics,
      required this.businessStatistics,
      required this.notificationStatistics,
      required this.offerStatistics,
      required this.totalCost});

  factory GetRegionsMonthAccountsDataModel.fromJson(Map<String, dynamic> json) {
    return GetRegionsMonthAccountsDataModel(
      announcementStatistics: List.from(
        (json['announcementStatistics'] as List)
            .map((e) => AnnouncementStatistics.fromJson(e)),
      ),
      businessStatistics: List.from(
        (json['businessStatistics'] as List)
            .map((e) => BusinessStatistics.fromJson(e)),
      ),
      notificationStatistics: List.from(
        (json['notificationStatistics'] as List)
            .map((e) => NotificationStatistics.fromJson(e)),
      ),
      offerStatistics: List.from(
        (json['offerStatistics'] as List)
            .map((e) => OfferStatistics.fromJson(e)),
      ),
      totalCost: json['totalCost'],
    );
  }
}

class AnnouncementStatistics {
  final num paidRegularLicencesCount;
  final num paidPremiumLicencesCount;
  final num unpaidRegularLicencesCount;
  final num unpaidPremiumLicencesCount;
  final num totalRegularLicencesCount;
  final num totalPremiumLicencesCount;
  final num totalLicencesCount;
  final String planName;
  final num planCost;
  final num planPremiumCost;
  final num planDays;
  final num totalRegularCost;
  final num totalPremiumCost;
  final num totalCost;

  AnnouncementStatistics({
    required this.paidRegularLicencesCount,
    required this.paidPremiumLicencesCount,
    required this.unpaidRegularLicencesCount,
    required this.unpaidPremiumLicencesCount,
    required this.totalRegularLicencesCount,
    required this.totalPremiumLicencesCount,
    required this.totalLicencesCount,
    required this.planName,
    required this.planCost,
    required this.planPremiumCost,
    required this.planDays,
    required this.totalRegularCost,
    required this.totalPremiumCost,
    required this.totalCost,
  });

  factory AnnouncementStatistics.fromJson(Map<String, dynamic> json) {
    return AnnouncementStatistics(
      paidRegularLicencesCount: json['paidRegularLicencesCount'],
      paidPremiumLicencesCount: json['paidPremiumLicencesCount'],
      unpaidRegularLicencesCount: json['unpaidRegularLicencesCount'],
      unpaidPremiumLicencesCount: json['unpaidPremiumLicencesCount'],
      totalRegularLicencesCount: json['totalRegularLicencesCount'],
      totalPremiumLicencesCount: json['totalPremiumLicencesCount'],
      totalLicencesCount: json['totalLicencesCount'],
      planName: json['planName'],
      planCost: json['planCost'],
      planPremiumCost: json['planPremiumCost'],
      planDays: json['planDays'],
      totalRegularCost: json['totalRegularCost'],
      totalPremiumCost: json['totalPremiumCost'],
      totalCost: json['totalCost'],
    );
  }
}

class BusinessStatistics {
  final num paidLicencesCount;
  final num unpaidLicencesCount;
  final num totalLicencesCount;
  final String planName;
  final num planCost;
  final num planDays;
  final num totalCost;

  BusinessStatistics(
      {required this.paidLicencesCount,
      required this.unpaidLicencesCount,
      required this.totalLicencesCount,
      required this.planName,
      required this.planCost,
      required this.planDays,
      required this.totalCost});

  factory BusinessStatistics.fromJson(Map<String, dynamic> json) {
    return BusinessStatistics(
      paidLicencesCount: json['paidLicencesCount'],
      unpaidLicencesCount: json['unpaidLicencesCount'],
      totalLicencesCount: json['totalLicencesCount'],
      planName: json['planName'],
      planCost: json['planCost'],
      planDays: json['planDays'],
      totalCost: json['totalCost'],
    );
  }
}

class NotificationStatistics {
  final num paidLicencesCount;
  final num unpaidLicencesCount;
  final num totalLicencesCount;
  final String planName;
  final num planCost;
  final num count;
  final num totalCost;

  NotificationStatistics(
      {required this.paidLicencesCount,
      required this.unpaidLicencesCount,
      required this.totalLicencesCount,
      required this.planName,
      required this.planCost,
      required this.count,
      required this.totalCost});

  factory NotificationStatistics.fromJson(Map<String, dynamic> json) {
    return NotificationStatistics(
      paidLicencesCount: json['paidLicencesCount'],
      unpaidLicencesCount: json['unpaidLicencesCount'],
      totalLicencesCount: json['totalLicencesCount'],
      planName: json['planName'],
      planCost: json['planCost'],
      count: json['count'],
      totalCost: json['totalCost'],
    );
  }
}

class OfferStatistics {
  final num paidLicencesCount;
  final num unpaidLicencesCount;
  final num totalLicencesCount;
  final String planName;
  final num planCost;
  final num planDays;
  final num totalCost;

  OfferStatistics(
      {required this.paidLicencesCount,
      required this.unpaidLicencesCount,
      required this.totalLicencesCount,
      required this.planName,
      required this.planCost,
      required this.planDays,
      required this.totalCost});

  factory OfferStatistics.fromJson(Map<String, dynamic> json) {
    return OfferStatistics(
      paidLicencesCount: json['paidLicencesCount'],
      unpaidLicencesCount: json['unpaidLicencesCount'],
      totalLicencesCount: json['totalLicencesCount'],
      planName: json['planName'],
      planCost: json['planCost'],
      planDays: json['planDays'],
      totalCost: json['totalCost'],
    );
  }
}
