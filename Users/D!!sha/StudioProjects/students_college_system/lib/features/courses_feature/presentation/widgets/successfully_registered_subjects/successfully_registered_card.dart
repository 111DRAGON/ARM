import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/courses_feature/presentation/widgets/successfully_registered_subjects/successfully_registered_row.dart';
import 'package:students_college_system/features/home_service_feature/presentation/pages/home_services_view.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';
import '../../../../../core/widgets/custom_button.dart';

class SuccessfullyRegisteredCard extends StatelessWidget {
  const SuccessfullyRegisteredCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: ColorManager.cardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: customBoxShadow()),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => const SuccessfullyRegisteredRow(),
            itemCount: 7,
          ),
          SizedBox(height: 10.h),
          CustomButton(
            text: "طباعة",
            onPressed: () {context.push(const HomeServicesView());},
            iconData: Icons.print,
            height: MediaQuery.of(context).size.height * .055,
          ),
        ],
      ),
    );
  }
}
