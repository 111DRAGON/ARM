import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/image_manager/image_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class ChoosingYearDetailsPart extends StatelessWidget {
  const ChoosingYearDetailsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Container(
          height: 200.h,
          width: 200.h,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(ImageManager.onBoarding4Image),
            fit: BoxFit.fill,
          )),
        ),
        SizedBox(height: 30.h),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            "إختر الفرقة الدراسية",
            style: getSemiBoldStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }
}
