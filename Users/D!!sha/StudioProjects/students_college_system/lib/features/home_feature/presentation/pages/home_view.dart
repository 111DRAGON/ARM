import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/features/home_feature/presentation/widgets/home_page_details_part.dart';
import 'package:students_college_system/features/home_feature/presentation/widgets/home_page_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const HomePageDetailsPart(),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "اضافات للطالب",
                    style: getBoldStyle(fontSize: 20),
                  ),
                ),
                const HomePageGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
