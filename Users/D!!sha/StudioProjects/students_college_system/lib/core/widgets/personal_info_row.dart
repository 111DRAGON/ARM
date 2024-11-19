import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';

import '../recourses/color_manager/color_manager.dart';
import '../recourses/image_manager/image_manager.dart';
import '../recourses/styles_manger/styles_manager.dart';

class PersonalInfoRow extends StatelessWidget {
  const PersonalInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(onPressed: (){context.pop();}, icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: ColorManager.white,
        ),),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "منار ربيع",
                style: getRegularStyle(
                    fontSize: 12, color: ColorManager.white),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(height: 5.h),
              Text(
                "الفرقة الرابعه / الترم السابع",
                style: getRegularStyle(
                    fontSize: 12, color: ColorManager.white),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Container(
          height: 50.h,
          width: 50.w,
          decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  ImageManager.womanImage,
                ),
                fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ],
    );
  }
}
