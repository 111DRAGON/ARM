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
    this.height,
    this.fontSize, this.iconData,
  });

  final String text;
  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.sp,
      shadowColor: ColorManager.secondaryColor,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.r),
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
      ),
      child: SizedBox(
        height: height ?? MediaQuery.of(context).size.height * .06,
        width: width ?? MediaQuery.of(context).size.width * .90,
        child: MaterialButton(
            color: backgroundColor ?? ColorManager.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.r),
              ),
            ),
            onPressed: onPressed,
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData  ??Icons.arrow_circle_left_outlined,
                  color: foregroundColor??ColorManager.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  text,
                  style: getSemiBoldStyle(
                    color: foregroundColor ?? ColorManager.white,
                    fontSize: fontSize ?? 18,
                  ),
                ),


              ],
            )),
      ),
    );
  }
}
