import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/exam_feature/presentation/widgets/choosing_exam/choosing_exam_subjects_part.dart';
import 'package:students_college_system/features/exam_feature/presentation/widgets/choosing_exam/choosing_exam_toggle.dart';

import '../widgets/choosing_exam/choosing_exam_app_bar.dart';

class ChoosingExamView extends StatelessWidget {
  const ChoosingExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const ChoosingExamAppBar(),
                SizedBox(height: 20.h),
                const ChoosingExamToggle(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
          const ChoosingExamSubjectsPart(),
        ],
      ),
    );
  }
}
