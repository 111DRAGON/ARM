import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../recourses/color_manager/color_manager.dart';
import '../recourses/styles_manger/styles_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.width,
    this.fontSize,
  });

  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.sp,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: SizedBox(
        height: 45.h,
        width: 300.w,
        child: MaterialButton(
          color: backgroundColor ?? ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(30.r),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: getSemiBoldStyle(
              color: foregroundColor ?? ColorManager.white,
              fontSize: fontSize ?? 18,
            ),
          ),
        ),
      ),
    );
  }
}
