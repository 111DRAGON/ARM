import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class SubjectsCustomRow extends StatelessWidget {
  const SubjectsCustomRow({super.key, required this.body, required this.title, this.titleColor, this.bodyColor});
final String body;
final String title;
  final Color?titleColor;
  final Color?bodyColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            body,
            style: getMediumStyle(color: bodyColor??ColorManager.white),
          ),
          SizedBox(
            width: 7.w,
          ),
          Text(
            ":  $title",
            style: getBoldStyle(color:titleColor?? ColorManager.white),
          )
        ],
      ),
    );
  }
}
