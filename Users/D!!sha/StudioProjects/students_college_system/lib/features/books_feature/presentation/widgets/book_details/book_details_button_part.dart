import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import 'custom_book_details_button.dart';

class BookDetailsButtonPart extends StatelessWidget {
  const BookDetailsButtonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "لتحميل و قراءة الكتاب",
              style: getSemiBoldStyle(color: ColorManager.black),
            ),
          ),
          SizedBox(height: 20.h),
          CustomBookDetailsButton(
            text: "تحميل الكتاب",
            iconData: CupertinoIcons.arrow_down_to_line,
            onTap: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomBookDetailsButton(
            text: "قراءة الكتاب",
            iconData: CupertinoIcons.book,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
