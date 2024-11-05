import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../recourses/color_manager/color_manager.dart';
import 'custom_button.dart';

customBottomSheet({
  required BuildContext context,
  required Function() okOnPressed,
  required Function() deleteOnPressed,
}) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 30.h),
          CustomButton(
              text: 'نعم بدفع ',
              backgroundColor: ColorManager.primary,
              foregroundColor: ColorManager.white,
              onPressed:okOnPressed,),
          SizedBox(height: 20.h),
          CustomButton(
              text: 'لا',
              backgroundColor: ColorManager.red,
              foregroundColor: ColorManager.white,
              onPressed: deleteOnPressed,),
        ],
      ),
    ),
  );
}
