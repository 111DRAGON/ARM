import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';

class CustomAuthPart extends StatelessWidget {
  const CustomAuthPart({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height:MediaQuery.of(context).size.height*.43,
          width: MediaQuery.of(context).size.width,
          color: ColorManager.scaffoldBackGroundColor,
        ),
        Positioned(
          top: -100.h,
          right: -100.w,
          child: const CircleAvatar(
            radius: 210,
            backgroundColor: ColorManager.cardColor,
          ),
        ),
        Positioned(
          top: 100.h,
          right: 10.w,
          child: Row(
            children: [
              Text(
                text,
                style: getBoldStyle(fontSize: 20),
                textDirection: TextDirection.rtl,
              ),

              IconButton(onPressed: (){context.pop();}, icon: const Icon(
                Icons.arrow_forward_ios_outlined,
              ),)
            ],
          ),
        )
      ],
    );
  }
}
