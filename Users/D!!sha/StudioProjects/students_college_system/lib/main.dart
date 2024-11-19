import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/home_service_feature/presentation/pages/home_services_view.dart';
import 'core/recourses/theme_manger/theme_manager.dart';
import 'core/services/service_locator.dart';
import 'features/onboarding_feature/presentation/pages/on_boarding_view.dart';
import 'features/payment_feature/presentation/pages/payment_view.dart';
import 'features/results_feature/presentation/pages/results_details_view.dart';
import 'features/results_feature/presentation/pages/results_view.dart';

void main() async {
  ServiceLocator().setup();
  runApp(const StudentsCollegeSystem());
}

class StudentsCollegeSystem extends StatelessWidget {
  const StudentsCollegeSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          home: const OnBoardingView(),
        );
      },
    );
  }
}
