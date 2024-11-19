import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class MCQExamAnswerPart extends StatelessWidget {
  const MCQExamAnswerPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Container(
            height: MediaQuery.of(context).size.height * .43,
            width: double.infinity,
            padding: const EdgeInsetsDirectional.all(20),
            decoration: BoxDecoration(
              color: CupertinoColors.lightBackgroundGray,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Text(
                  "Which of the following is used to output text to the console in C++?",
                  style: getSemiBoldStyle(),
                ),
                SizedBox(height: 20.h),
                Expanded(
                    child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      mcqCard(context: context, text: "std::output"),
                  itemCount: 4,
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

mcqCard({required BuildContext context, required String text}) {
  return Container(
    height: MediaQuery.of(context).size.height * .06,
    width: double.infinity,
    margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
    padding: const EdgeInsetsDirectional.all(10),
    decoration: BoxDecoration(
      color: ColorManager.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Text(
          text,
          style: getRegularStyle(color: ColorManager.grey),
        ),
      ],
    ),
  );
}
