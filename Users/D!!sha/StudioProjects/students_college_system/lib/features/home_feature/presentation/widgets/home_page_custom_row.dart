import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';

class HomePageCustomRow extends StatelessWidget {
  const HomePageCustomRow({super.key, required this.body, required this.title});
final String body;
final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          body,
          style: getMediumStyle(color: ColorManager.grey),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          ": $title",
          style: getBoldStyle(),
        )
      ],
    );
  }
}
