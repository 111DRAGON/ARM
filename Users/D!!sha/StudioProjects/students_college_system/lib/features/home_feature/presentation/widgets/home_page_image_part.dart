import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/image_manager/image_manager.dart';

class HomePageImagePart extends StatelessWidget {
  const HomePageImagePart({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * .18,
      margin: const EdgeInsetsDirectional.symmetric(vertical: 12),
      width: MediaQuery.of(context).size.width * .65,
      decoration: BoxDecoration(
          color: ColorManager.cardColor,
          border: const Border(
            top: BorderSide(color: ColorManager.primary, width: 3),
            left: BorderSide(color: ColorManager.primary, width: 3),
            bottom:
            BorderSide(color: ColorManager.primary, width: 3),
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(90.r),
            right: Radius.circular(10.r),
          )),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(3.0.sp),
          child: CircleAvatar(
            radius: 68.r,
            backgroundImage:
            const AssetImage(ImageManager.womanImage),
          ),
        ),
      ),
    );
  }
}
