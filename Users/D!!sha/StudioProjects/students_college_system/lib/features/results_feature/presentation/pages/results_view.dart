import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/features/results_feature/presentation/widgets/results/result_fl_chart.dart';
import 'package:students_college_system/features/results_feature/presentation/widgets/results/result_view_grid.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/utils/custom_gradient.dart';
import '../widgets/results/results_gpa_card.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "النتائج", context: context),
      body: Container(
        decoration:  BoxDecoration(
            gradient: customGradient(),),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const ResultsGpaCard(),
                SizedBox(height: 20.h),
                const ResultFlChart(),
                const ResultViewGrid(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
