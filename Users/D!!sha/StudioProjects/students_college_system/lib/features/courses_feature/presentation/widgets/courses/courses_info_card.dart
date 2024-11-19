import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';

class CoursesInfoCard extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Function() onTap;
  final List<String> items;

  const CoursesInfoCard({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding:  EdgeInsets.all(20.sp),
        decoration: BoxDecoration(
          color: color,
          borderRadius:  BorderRadius.only(
            topRight: Radius.circular(50.r),
            bottomLeft: Radius.circular(50.r),
          ),
          boxShadow: customBoxShadow(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(title, style: getBoldStyle()),
                  SizedBox(height: 10.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: items.map((item) {
                      return Row(
                        children: [
                          const Icon(Icons.circle,
                              size: 5, color: ColorManager.black),
                          SizedBox(width: 5.w),
                          Expanded(
                            child:
                                Text(item, style: getRegularStyle(fontSize: 12)),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Icon(icon, size: 40.sp, color: ColorManager.black),
          ],
        ),
      ),
    );
  }
}
