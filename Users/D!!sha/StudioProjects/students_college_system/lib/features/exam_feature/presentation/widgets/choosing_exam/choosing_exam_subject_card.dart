import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/exam_feature/presentation/pages/written_exam_view.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';

class ChoosingExamSubjectCard extends StatelessWidget {
  const ChoosingExamSubjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){context.push(const WrittenExamView());},
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(vertical: 10,horizontal: 20),
        height: MediaQuery.of(context).size.height * .12,
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: ColorManager.grey,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "C++ Fundamental",
                  style: getMediumStyle(),
                ),
                Text(
                  "IS14E5 / 3h",
                  style: getRegularStyle(
                      color: ColorManager.grey, fontSize: 12),
                ),
              ],
            ),
            Text(
              "Dr: Ahmed mohamed",
              style:
                  getRegularStyle(color: ColorManager.grey, fontSize: 12),
            ),const SizedBox(height: 5,),
            Row(
              children: [
                textContainer(text: "Midterm"),
                const SizedBox(
                  width: 20,
                ),
                textContainer(text:"20 marks"),
                const Spacer(),
                const Icon(
                  CupertinoIcons.arrow_right_circle,
                  color: ColorManager.primary,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
textContainer({required String text, Color ?color,}){return   Container(
  height: 25.h,
  width: 100.w,
  decoration: BoxDecoration(
    color: color??ColorManager.cardColor,
    borderRadius: BorderRadius.circular(10),
  ),
  child: Center(
    child: Text(
      text,
      style:
      getMediumStyle(fontSize: 10, color: Colors.red),
    ),
  ),
);}