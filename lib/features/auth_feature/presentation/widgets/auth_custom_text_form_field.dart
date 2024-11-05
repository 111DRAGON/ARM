
import 'package:flutter/material.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';




class AuthCustomTextFormField extends StatelessWidget {
  const AuthCustomTextFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.text,
    this.controller,
    this.validator,
    this.obscureText,
  });
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(textAlign:TextAlign.right,
          validator: validator,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: prefixIcon == null ? null : Icon(prefixIcon,color: ColorManager.primary,),
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle:  getRegularStyle(color: ColorManager.primary,),
            labelStyle:  getRegularStyle(color: ColorManager.primary,)
          ),
        );
  }
}
