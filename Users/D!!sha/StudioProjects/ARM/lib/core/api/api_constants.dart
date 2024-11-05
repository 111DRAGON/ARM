class ApiConstants {
  ///Base
  static const String baseUrl = 'http://109.176.197.152:8088/';

  ///Auth
  static const String login = 'api/v1/auth/login';

  ///city
  static const String getCities = 'api/v1/city/public';

  ///Region

  static const String getRegions = 'api/v1/region/public';

  ///Business

  static const String buyBusinessLicence = 'api/v1/business/buy-licence';

  static String deleteBusiness(int id) => 'api/v1/business/$id';
  static String deleteBusinessLicence(int id) => 'api/v2/region-authority/licence/business/$id/delete';
  static String getMyBusiness = 'api/v2/business/mine/all';

  static String getActivationBusinessLicence =
      'api/v2/region-authority/licence/business';
  static String getActivationBusiness =
      'api/v2/region-authority/business/initial-approval/all';
  static String activeBusiness(int id) =>
      'api/v2/region-authority/business/initial-approval/$id/approve';
  static String activeBusinessLicence(int id) =>
      'api/v2/region-authority/licence/business/$id/approve';

  /// Set Lock Status
  static String setLockStatus(int id) => 'api/v1/business/$id';

  ///  Announcement

  static const String getActivationAnnouncementLicences =
      'api/v2/region-authority/licence/announcement';
  static const String renewAnnouncementLicence = 'api/v1/my-announcement/renew';
  static String getAnnouncementLicences(int id) =>
      'api/v1/my-announcement/$id/licences';
  static String activateAnnouncementLicence(int id) =>
      'api/v2/region-authority/licence/announcement/$id/approve';
  static String deleteAnnouncementLicence(int id) =>
     ' api/v2/region-authority/licence/announcement/$id/delete';
  static String deleteAnnouncement(int id) => 'api/v1/my-announcement/$id';

  ///Offer

  static const String getActivationOfferLicences =
      'api/v2/region-authority/licence/offer';
  static String getOfferLicences(int id) => 'api/v1/my-offer/$id/licences';
  static String activateOfferLicence(int id) =>
      'api/v2/region-authority/licence/offer/$id/approve';
  static String deleteOfferLicence(int id) =>   'api/v2/region-authority/licence/offer/$id/delete';
  static String getOfferById(int id) => 'api/v1/offer/public/$id';

  ///Notification

  static String activateNotificationLicence(int id) =>
      'api/v2/region-authority/licence/notification/$id/approve';
  static String deleteNotification(int id) => 'api/v2/region-authority/licence/notification/$id/delete';
  static const String getActivationNotificationLicences =
      'api/v2/region-authority/licence/notification';

  ///ManagedRegion
  static const String getUsers =
      'api/v2/region-authority/business/ownership-transfer/user/all';
  static const String getRegionsMonthAccounts =
      'api/v2/region-authority/statistics/month-statistics';

  ///Transfer Business Ownership
  static const String transferBusinessOwnership =
      'api/v2/region-authority/business/ownership-transfer/transfer';
}
