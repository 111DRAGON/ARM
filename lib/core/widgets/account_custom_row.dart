import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../recourses/color_manager/color_manager.dart';
import '../recourses/styles_manger/styles_manager.dart';
import 'custom_box_shadow.dart';

class AccountCustomRow extends StatelessWidget {
  const AccountCustomRow({super.key, required this.text, required this.value, this.color, this.textWidth});
final String text;
final String value;
final double? textWidth;

 final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: customBoxShadow(),
        color: color ?? ColorManager.amber,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width*.20,
            child: Text(
              value,
              textDirection: TextDirection.rtl,
              style: getMediumStyle(fontSize: 15),
            ),
          ),
SizedBox(width: 5.w,),
          SizedBox(width:textWidth ??MediaQuery.of(context).size.width*.20,
            child: Text(
              text,
              style: getMediumStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );;
  }
}
