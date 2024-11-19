import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/widgets/custom_button.dart';

class WrittenExamAnswerPart extends StatelessWidget {
  const WrittenExamAnswerPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Text(
            "What is the purpose of the #include <iostream> directive in a C++ program?",
            style: getSemiBoldStyle(),
          ),
          SizedBox(height: 20.h),
          CustomButton(
            text: "Answer",
            onPressed: () {},
            width: MediaQuery.of(context).size.width*.50,
            height: MediaQuery.of(context).size.height*.06,
            iconData: Icons.edit_calendar,
          ),
          SizedBox(height: 20.h),
          Container(
            height: MediaQuery.of(context).size.height*.40,
            width: double.infinity,
            padding: const EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: CupertinoColors.lightBackgroundGray,
                width: 2.5,
              ),
            ),
            child: Text(
              "The #include <iostream> directive is used to include the input-output stream library in a C++ program. This allows the program to use functions like std::cout for output and std::cin for input, which are essential for basic console interactions in C++.",
              style: getMediumStyle(
                color: ColorManager.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
