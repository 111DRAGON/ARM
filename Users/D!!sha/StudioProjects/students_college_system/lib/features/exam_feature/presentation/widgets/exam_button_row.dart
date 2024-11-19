import 'package:flutter/cupertino.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/widgets/custom_button.dart';

class ExamButtonRow extends StatelessWidget {
  const ExamButtonRow({super.key, required this.nextOnPressedKey});
final Function()nextOnPressedKey;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(
            text: "السابق",
            onPressed: () {context.pop();},
            width: MediaQuery.of(context).size.width * .45,
            backgroundColor: ColorManager.scaffoldBackGroundColor,
            foregroundColor: ColorManager.grey,
            iconData: CupertinoIcons.arrow_left_circle_fill),
        CustomButton(
          text: "التالى",
          onPressed: nextOnPressedKey,
          width: MediaQuery.of(context).size.width * .45,
          backgroundColor: ColorManager.primary,
          foregroundColor: ColorManager.white,
          iconData: CupertinoIcons.arrow_right_circle_fill,
        ),
      ],
    );
  }
}
