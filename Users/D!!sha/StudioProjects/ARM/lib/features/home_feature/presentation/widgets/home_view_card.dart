import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/custom_box_shadow.dart';

class HomeViewCard extends StatelessWidget {
  const HomeViewCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color,
  });
  final IconData icon;
  final String text;
  final Function() onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color?? ColorManager.primary,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: customBoxShadow(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: ColorManager.white,
            ),
            SizedBox(height: 12.h),
            Text(
              text,
              style: getRegularStyle(fontSize: 24, color: ColorManager.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
