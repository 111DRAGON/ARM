import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/widgets/personal_info_row.dart';

class ChoosingExamAppBar extends StatelessWidget {
  const ChoosingExamAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(20),
      height: MediaQuery.of(context).size.height * .15,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 30.h),
          const PersonalInfoRow(),

        ],
      ),
    );
  }
}
