
import 'package:arm/features/announcement_features/presentation/manager/delete_announcement_licence/delete_announcement_licence_cubit.dart';
import 'package:arm/features/business_features/presentation/manager/delete_business_licence/delete_business_licence_cubit.dart';
import 'package:arm/features/offers_feature/presentation/controller/delete_offer_licence/delete_offer_licence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/recourses/theme_manger/theme_manager.dart';
import 'core/services/service_locator.dart';
import 'core/storage/secure_storage.dart';
import 'features/accounts_feature/presentation/manager/get_regions_month_accounts_controller/get_regions_month_accounts_cubit.dart';
import 'features/announcement_features/presentation/manager/activate_announcement_licence/activate_announcement_licence_cubit.dart';
import 'features/announcement_features/presentation/manager/get_activation_announcement_licence/get_activation_announcement_licence_cubit.dart';
import 'features/auth_feature/presentation/controller/login_controller/login_cubit.dart';
import 'features/auth_feature/presentation/pages/login_view.dart';
import 'features/business_features/presentation/manager/active_business_controller/active_business_cubit.dart';
import 'features/business_features/presentation/manager/active_business_licences_controller/active_business_licence_cubit.dart';
import 'features/business_features/presentation/manager/delete_business_controller/delete_business_cubit.dart';
import 'features/business_features/presentation/manager/get_activation_business_controller/get_activation_business_cubit.dart';
import 'features/business_features/presentation/manager/get_active_business_licence_controller/get_active_business_licence_cubit.dart';
import 'features/business_features/presentation/manager/get_my_business_controller/get_my_business_cubit.dart';
import 'features/city_feature/presentation/controller/get_cities_controller/get_cities_cubit.dart';
import 'features/home_feature/presentation/pages/home_view.dart';
import 'features/notification_feature/presentation/manager/activate_notification_licence/activate_notification_licence_cubit.dart';
import 'features/notification_feature/presentation/manager/delete_notification/delete_notification_cubit.dart';
import 'features/notification_feature/presentation/manager/get_activation_notification_licence/get_activation_notification_licence_cubit.dart';
import 'features/offers_feature/presentation/controller/activate_offer_licence/activate_offer_licence_cubit.dart';
import 'features/offers_feature/presentation/controller/get_activation_offer_licence/get_activation_offer_licence_cubit.dart';
import 'features/regions_features/presentation/controller/get_regions_controller/get_regions_cubit.dart';
import 'features/transfer_business_ownership_feature/presentation/manager/transfer_business_ownership_cubit.dart';
import 'features/users_ feature/presentation/manager/get_users_cubit.dart';

bool hasToken = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  hasToken = await SecureStorage.hasValue('token');
  ServiceLocator().setup();

  runApp(const ARM());
}

class ARM extends StatelessWidget {
  const ARM({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => sl.get<LoginCubit>()),
        BlocProvider<DeleteBusinessLicenceCubit>(create: (context) => sl.get<DeleteBusinessLicenceCubit>()),
        BlocProvider<ActivateOfferLicenceCubit>(create: (context) => sl.get<ActivateOfferLicenceCubit>()),
        BlocProvider<GetActivationAnnouncementLicencesCubit>(create: (context) => sl.get<GetActivationAnnouncementLicencesCubit>()),
        BlocProvider<ActiveBusinessLicenceCubit>(create: (context) => sl.get<ActiveBusinessLicenceCubit>()),
        BlocProvider<GetActivationBusinessLicenceCubit>(create: (context) => sl.get<GetActivationBusinessLicenceCubit>()),
        BlocProvider<GetRegionsMonthAccountsCubit>(create: (context) => sl.get<GetRegionsMonthAccountsCubit>()),
        BlocProvider<GetCitiesCubit>(create: (context) => sl.get<GetCitiesCubit>()),
        BlocProvider<GetRegionsCubit>(create: (context) => sl.get<GetRegionsCubit>()),
        BlocProvider<GetUsersCubit>(create: (context) => sl.get<GetUsersCubit>()),
        BlocProvider<DeleteNotificationCubit>(create: (context) => sl.get<DeleteNotificationCubit>()),
        BlocProvider<GetActivationNotificationLicencesCubit>(create: (context) => sl.get<GetActivationNotificationLicencesCubit>()),
        BlocProvider<ActivateNotificationLicenceCubit>(create: (context) => sl.get<ActivateNotificationLicenceCubit>()),
        BlocProvider<DeleteOfferLicenceCubit>(create: (context) => sl.get<DeleteOfferLicenceCubit>()),
        BlocProvider<DeleteBusinessCubit>(create: (context) => sl.get<DeleteBusinessCubit>()),
        BlocProvider<ActiveBusinessCubit>(create: (context) => sl.get<ActiveBusinessCubit>()),
        BlocProvider<GetActivationBusinessCubit>(create: (context) => sl.get<GetActivationBusinessCubit>()),
        BlocProvider<GetMyBusinessCubit>(create: (context) => sl.get<GetMyBusinessCubit>()),
        BlocProvider<GetActivationOfferLicencesCubit>(create: (context) => sl.get<GetActivationOfferLicencesCubit>()),
        BlocProvider<DeleteAnnouncementLicenceCubit>(create: (context) => sl.get<DeleteAnnouncementLicenceCubit>()),
        BlocProvider<TransferBusinessOwnershipCubit>(create: (context) => sl.get<TransferBusinessOwnershipCubit>()),
        BlocProvider<ActivateAnnouncementLicenceCubit>(create: (context) => sl.get<ActivateAnnouncementLicenceCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(380, 785),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getAppTheme(),
            home: hasToken ? const HomeView() : const LoginView(),
          );
        },
      ),
    );
  }
}
