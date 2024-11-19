import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/utils/custom_box_shadow.dart';

class PaymentCustomCard extends StatelessWidget {
  const PaymentCustomCard({
    super.key,
    required this.height,
    required this.width,
    required this.body,
  });
  final Widget body;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.cardColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: customBoxShadow(),
        border: Border.all(color: ColorManager.lightGrey)
      ),
      height: height,
      width: width,
      child: body,
    );
  }
}
