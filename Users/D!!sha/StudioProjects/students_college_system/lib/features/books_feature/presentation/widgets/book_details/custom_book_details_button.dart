import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';

class CustomBookDetailsButton extends StatelessWidget {
  const CustomBookDetailsButton({super.key, required this.text, required this.iconData, required this.onTap,});
  final String text;
  final IconData iconData;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap ,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.scaffoldBackGroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: customBoxShadow(),
          border: Border.all(
            color: ColorManager.primary,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(iconData, color: ColorManager.primary),
            Text(
              text,
              style: getSemiBoldStyle(
                color: ColorManager.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
