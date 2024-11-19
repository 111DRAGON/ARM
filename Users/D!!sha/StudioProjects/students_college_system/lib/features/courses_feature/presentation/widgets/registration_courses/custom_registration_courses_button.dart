import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';

class CustomRegistrationCoursesButton extends StatelessWidget {
  const CustomRegistrationCoursesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .07,
      width: double.infinity,
      margin:
          const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: customBoxShadow(),
        border: Border.all(
          color: ColorManager.lightGrey,
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Web information system",
                style: getSemiBoldStyle(
                  color: ColorManager.secondaryColor,
                ),
              ),
              Text(
                "code: 1SE14 / Hours: 3hs",
                style: getSemiBoldStyle(color: ColorManager.grey, fontSize: 12),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add_circle,
              size: 30,
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
    );
  }
}
