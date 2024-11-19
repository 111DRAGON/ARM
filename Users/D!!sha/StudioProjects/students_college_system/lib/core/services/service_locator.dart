import 'package:get_it/get_it.dart';
import 'package:students_college_system/features/auth_feature/presentation/manager/sign_up_controller/sign_up_cubit.dart';
import '../../features/activate_feature/presentation/manager/activate_view_cubit.dart';
import '../../features/auth_feature/presentation/manager/change_password_controller/change_password_cubit.dart';
import '../../features/auth_feature/presentation/manager/login_controller/login_cubit.dart';
import '../../features/home_service_feature/presentation/controller/home_service_cubit.dart';
import '../../features/onboarding_feature/presentation/controller/on_boarding_cubit.dart';
import '../api/api_service.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator{
  void setup(){
    //API service
    sl.registerLazySingleton<ApiService>(() => ApiService());

//Cubits
    sl.registerFactory<OnBoardingCubit>(() => OnBoardingCubit());
    sl.registerFactory<LoginCubit>(() => LoginCubit());
    sl.registerFactory<SignUpCubit>(() => SignUpCubit());
    sl.registerFactory<ChangePasswordCubit>(() => ChangePasswordCubit());
    sl.registerFactory<HomeServiceCubit>(() => HomeServiceCubit());
    sl.registerFactory<ActivateViewCubit>(() => ActivateViewCubit());


  }
}