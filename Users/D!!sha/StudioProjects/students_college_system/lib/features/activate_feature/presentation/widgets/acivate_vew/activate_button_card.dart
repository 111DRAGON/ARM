import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../../core/utils/custom_box_shadow.dart';

class ActivateButtonCard extends StatelessWidget {
  const ActivateButtonCard({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .06,
        width: MediaQuery.of(context).size.width * .22,
        decoration: BoxDecoration(
            color: ColorManager.scaffoldBackGroundColor,
            borderRadius: BorderRadius.circular(20.r),
            boxShadow: customBoxShadow(),
            border: Border.all(
              color: ColorManager.lightGrey,
            )),
        child: Center(
          child: Text(
            title,
            style: getSemiBoldStyle(color: ColorManager.black),
          ),
        ),
      ),
    );
  }
}
