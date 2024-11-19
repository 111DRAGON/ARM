import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class ResultDetailsRow extends StatelessWidget {
  const ResultDetailsRow({
    super.key,
    required this.body,
    required this.title,
  });
  final String body;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            size: 8,
            color: ColorManager.grey,
          ),SizedBox(width: 5.w,),
          Text(
            title,
            style: getMediumStyle(
              color: ColorManager.grey,
            ),
          ),
          Text(
            ":  $body",
            style: getMediumStyle(
              color: ColorManager.grey,
            ),
          ),
        ],
      ),
    );
  }
}
