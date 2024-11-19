import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_button.dart';
import 'package:students_college_system/features/exam_feature/presentation/pages/written_exam_view.dart';

import '../widgets/activate_exam/activate_exam_details_body.dart';


class ActivateExamsBody extends StatelessWidget {
  const ActivateExamsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .62,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ColorManager.cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const ActivateExamDetailsBody(),
                  CustomButton(
                    text: "حل الامتحان",
                    onPressed: () {context.push(const WrittenExamView());},
                    width: MediaQuery.of(context).size.width * .70,
                    height: 40.h,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
