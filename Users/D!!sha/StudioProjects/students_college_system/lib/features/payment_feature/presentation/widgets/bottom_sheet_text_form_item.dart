import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/custom_text_field.dart';

class BottomSheetTextFormItem extends StatelessWidget {
  const BottomSheetTextFormItem({
    super.key,
    required this.name,
    required this.textFormName,
  });
  final String name;
  final String textFormName;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            name,
            style: getMediumStyle(color: ColorManager.secondaryColor),
          ),
        ),
        SizedBox(
          height: 10.h
        ),
        CustomTextFormField(hintText: textFormName),
        SizedBox(height: 10.h),
      ],
    );
  }
}
