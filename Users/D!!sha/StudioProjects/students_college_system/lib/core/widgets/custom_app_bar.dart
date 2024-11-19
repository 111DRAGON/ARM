import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';

AppBar customAppBar({
  required String text,
  required BuildContext context,
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: ColorManager.scaffoldBackGroundColor,
    elevation: 0,
    title: Container(height: 55,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                text,
                style: getMediumStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.black,
              size: 20.0,
            ),
          )
        ],
      ),
    ),
  );
}
