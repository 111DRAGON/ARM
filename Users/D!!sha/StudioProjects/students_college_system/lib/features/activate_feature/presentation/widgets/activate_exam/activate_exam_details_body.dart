import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/image_manager/image_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../exam_feature/presentation/widgets/choosing_exam/choosing_exam_subject_card.dart';

class ActivateExamDetailsBody extends StatelessWidget {
  const ActivateExamDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Column(
        children: [
          Image.asset(
            ImageManager.youngWomanImage,
            height: MediaQuery.of(context).size.height * .15,
          ),
          Text(
            "تم رفع امتحان مادة ",
            style: getBoldStyle(color: ColorManager.grey),
          ),
          Text(
            "C++ Fundamental",
            style: getBoldStyle(color: ColorManager.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textContainer(text: "Midterm", color: ColorManager.white),
              SizedBox(
                width: 20.w,
              ),
              textContainer(
                  text: "20 marks", color: ColorManager.white),
            ],
          ),
          SizedBox(height: 20.h),
          textContainer(text: "mcq", color: ColorManager.white),
        ],
      ),
    );
  }
}
