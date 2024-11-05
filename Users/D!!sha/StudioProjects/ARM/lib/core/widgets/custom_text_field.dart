import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../recourses/styles_manger/styles_manager.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.controller,
    this.validator,
    this.obscureText,
    this.maxLine,
    this.height,
    this.onChanged, this.onTap,
  });
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Future<String?>  Function(String?)? onChanged;
  final  Function()? onTap;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? maxLine;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: SizedBox(
        height: height ?? 60,
        child: TextFormField(
          onTap: onTap??(){},
          onChanged: onChanged,
          controller: controller,
          textAlign: TextAlign.right,
          maxLines: maxLine ?? 1,
          validator: validator,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: ColorManager.primary,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20.r),
              ),
            ),
            hintStyle: getRegularStyle(
              color: ColorManager.primary,
            ),
            labelStyle: getRegularStyle(
              color: ColorManager.primary,
            ),
          ),
        ),
      ),
    );
  }
}
