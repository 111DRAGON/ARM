import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key, required this.title, required this.body});
final String title;
final String body;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * .10,
      width: MediaQuery.of(context).size.width * .22,
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: customBoxShadow(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: getSemiBoldStyle(color: ColorManager.white),
          ),
          Text(
            body,
            style: getRegularStyle(color: ColorManager.white),
          )
        ],
      ),
    );
  }
}
