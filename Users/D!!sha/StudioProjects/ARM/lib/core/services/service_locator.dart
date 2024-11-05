import 'package:arm/features/accounts_feature/data/repo/get_regions_month_accounts_repo.dart';
import 'package:arm/features/announcement_features/data/repo/delete_announcement_licence_repo.dart';
import 'package:arm/features/announcement_features/presentation/manager/delete_announcement_licence/delete_announcement_licence_cubit.dart';
import 'package:arm/features/notification_feature/data/repo/activate_notification_licence_repo.dart';
import 'package:arm/features/notification_feature/presentation/manager/delete_notification/delete_notification_cubit.dart';
import 'package:arm/features/offers_feature/data/repo/delete_offer_licence_repo.dart';
import 'package:arm/features/offers_feature/presentation/controller/delete_offer_licence/delete_offer_licence_cubit.dart';
import 'package:arm/features/transfer_business_ownership_feature/data/repo/transfer_business_ownership_repo.dart';
import 'package:arm/features/users_%20feature/data/repo/get_users_repo.dart';
import 'package:get_it/get_it.dart';
import '../../features/accounts_feature/presentation/manager/get_regions_month_accounts_controller/get_regions_month_accounts_cubit.dart';
import '../../features/announcement_features/data/repo/activate_announcement_licence_repo.dart';
import '../../features/announcement_features/data/repo/get_activation_announcement_licence_repo.dart';
import '../../features/announcement_features/presentation/manager/activate_announcement_licence/activate_announcement_licence_cubit.dart';
import '../../features/announcement_features/presentation/manager/get_activation_announcement_licence/get_activation_announcement_licence_cubit.dart';
import '../../features/auth_feature/data/login_data/repo/login_admin_repo.dart';
import '../../features/auth_feature/presentation/controller/login_controller/login_cubit.dart';
import '../../features/business_features/data/repo/active_business_licence_repo.dart';
import '../../features/business_features/data/repo/active_business_repo.dart';
import '../../features/business_features/data/repo/business_repo.dart';
import '../../features/business_features/data/repo/delete_business_licence_repo.dart';
import '../../features/business_features/data/repo/get_activation_business_licence_repo.dart';
import '../../features/business_features/data/repo/get_activation_business_repo.dart';
import '../../features/business_features/data/repo/get_my_business_repo.dart';
import '../../features/business_features/presentation/manager/active_business_controller/active_business_cubit.dart';
import '../../features/business_features/presentation/manager/active_business_licences_controller/active_business_licence_cubit.dart';
import '../../features/business_features/presentation/manager/delete_business_controller/delete_business_cubit.dart';
import '../../features/business_features/presentation/manager/delete_business_licence/delete_business_licence_cubit.dart';
import '../../features/business_features/presentation/manager/get_activation_business_controller/get_activation_business_cubit.dart';
import '../../features/business_features/presentation/manager/get_active_business_licence_controller/get_active_business_licence_cubit.dart';
import '../../features/business_features/presentation/manager/get_my_business_controller/get_my_business_cubit.dart';
import '../../features/city_feature/data/repo/city_repo.dart';
import '../../features/city_feature/presentation/controller/get_cities_controller/get_cities_cubit.dart';
import '../../features/notification_feature/data/repo/delete_notification_repo.dart';
import '../../features/notification_feature/data/repo/get_activation_notification_licence_repo.dart';
import '../../features/notification_feature/presentation/manager/activate_notification_licence/activate_notification_licence_cubit.dart';
import '../../features/notification_feature/presentation/manager/get_activation_notification_licence/get_activation_notification_licence_cubit.dart';
import '../../features/offers_feature/data/repo/activate_offer_licence_repo.dart';
import '../../features/offers_feature/data/repo/get_activation_offer_licence_repo.dart';
import '../../features/offers_feature/presentation/controller/activate_offer_licence/activate_offer_licence_cubit.dart';
import '../../features/offers_feature/presentation/controller/get_activation_offer_licence/get_activation_offer_licence_cubit.dart';
import '../../features/regions_features/data/repo/regions_repo.dart';
import '../../features/regions_features/presentation/controller/get_regions_controller/get_regions_cubit.dart';
import '../../features/transfer_business_ownership_feature/presentation/manager/transfer_business_ownership_cubit.dart';
import '../../features/users_ feature/presentation/manager/get_users_cubit.dart';
import '../api/api_service.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator{
  void setup(){
    ///API service
    sl.registerLazySingleton<ApiService>(() => ApiService());

    ///Repositories
   sl.registerLazySingleton<GetRegionsMonthAccountsRepo>(() => GetRegionsMonthAccountsRepo(sl()));
   sl.registerLazySingleton<LoginAdminRepo>(() => LoginAdminRepo(sl()));
   sl.registerLazySingleton<CityRepo>(() => CityRepo(sl()));
   sl.registerLazySingleton<ActivateNotificationLicenceRepo>(() => ActivateNotificationLicenceRepo(sl()));
   sl.registerLazySingleton<RegionRepo>(() => RegionRepo(sl()));
   sl.registerLazySingleton<DeleteOfferLicenceRepo>(() => DeleteOfferLicenceRepo(sl()));
   sl.registerLazySingleton<GetUsersRepo>(() => GetUsersRepo(sl()));
   sl.registerLazySingleton<ActiveBusinessRepo>(() => ActiveBusinessRepo(sl()));
   sl.registerLazySingleton<BusinessRepo>(() => BusinessRepo(sl()));
   sl.registerLazySingleton<ActiveBusinessLicenceRepo>(() => ActiveBusinessLicenceRepo(sl()));
   sl.registerLazySingleton<GetActivationBusinessRepo>(() => GetActivationBusinessRepo(sl()));
   sl.registerLazySingleton<GetMyBusinessRepo>(() => GetMyBusinessRepo(sl()));
   sl.registerLazySingleton<ActivateOfferLicenceRepo>(() => ActivateOfferLicenceRepo(sl()));
   sl.registerLazySingleton<DeleteAnnouncementLicenceRepo>(() => DeleteAnnouncementLicenceRepo(sl()));
   sl.registerLazySingleton<GetActivationNotificationLicencesRepo>(() => GetActivationNotificationLicencesRepo(sl()));
   sl.registerLazySingleton<GetActivationOfferLicencesRepo>(() => GetActivationOfferLicencesRepo(sl()));
   sl.registerLazySingleton<GetActivationAnnouncementLicencesRepo>(() => GetActivationAnnouncementLicencesRepo(sl()));
   sl.registerLazySingleton<ActivateAnnouncementLicenceRepo>(() => ActivateAnnouncementLicenceRepo(sl()));
   sl.registerLazySingleton<DeleteNotificationRepo>(() => DeleteNotificationRepo(sl()));
   sl.registerLazySingleton<GetActivationBusinessLicenceRepo>(() => GetActivationBusinessLicenceRepo(sl()));
   sl.registerLazySingleton<TransferBusinessOwnershipRepo>(() => TransferBusinessOwnershipRepo(sl()));
   sl.registerLazySingleton<DeleteBusinessLicenceRepo>(() => DeleteBusinessLicenceRepo(sl()));


    ///Cubits
   sl.registerFactory<GetRegionsMonthAccountsCubit>(() => GetRegionsMonthAccountsCubit(sl()));
   sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
   sl.registerFactory<DeleteOfferLicenceCubit>(() => DeleteOfferLicenceCubit(sl()));
   sl.registerFactory<ActivateOfferLicenceCubit>(() => ActivateOfferLicenceCubit(sl()));
   sl.registerFactory<DeleteAnnouncementLicenceCubit>(() => DeleteAnnouncementLicenceCubit(sl()));
   sl.registerFactory<GetActivationAnnouncementLicencesCubit>(() => GetActivationAnnouncementLicencesCubit(sl()));
   sl.registerFactory<ActivateAnnouncementLicenceCubit>(() => ActivateAnnouncementLicenceCubit(sl()));
   sl.registerFactory<GetActivationBusinessLicenceCubit>(() => GetActivationBusinessLicenceCubit(sl()));
   sl.registerFactory<GetCitiesCubit>(() => GetCitiesCubit(sl()));
   sl.registerFactory<ActivateNotificationLicenceCubit>(() => ActivateNotificationLicenceCubit(sl()));
   sl.registerFactory<GetRegionsCubit>(() => GetRegionsCubit(sl()));
   sl.registerFactory<GetUsersCubit>(() => GetUsersCubit(sl()));
   sl.registerFactory<GetActivationOfferLicencesCubit>(() => GetActivationOfferLicencesCubit(sl()));
   sl.registerFactory<ActiveBusinessLicenceCubit>(() => ActiveBusinessLicenceCubit(sl()));
   sl.registerFactory<DeleteBusinessCubit>(() => DeleteBusinessCubit(sl()));
   sl.registerFactory<ActiveBusinessCubit>(() => ActiveBusinessCubit(sl()));
   sl.registerFactory<GetActivationBusinessCubit>(() => GetActivationBusinessCubit(sl()));
   sl.registerFactory<GetMyBusinessCubit>(() => GetMyBusinessCubit(sl()));
   sl.registerFactory<DeleteNotificationCubit>(() => DeleteNotificationCubit(sl()));
   sl.registerFactory<GetActivationNotificationLicencesCubit>(() => GetActivationNotificationLicencesCubit(sl()));
   sl.registerFactory<TransferBusinessOwnershipCubit>(() => TransferBusinessOwnershipCubit(sl()));
   sl.registerFactory<DeleteBusinessLicenceCubit>(() => DeleteBusinessLicenceCubit(sl()));




  }
}