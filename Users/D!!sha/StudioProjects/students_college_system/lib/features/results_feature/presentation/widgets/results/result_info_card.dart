import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/results_feature/presentation/pages/results_details_view.dart';
import 'package:students_college_system/features/results_feature/presentation/widgets/results/result_info_row.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';

class ResultInfoCard extends StatelessWidget {
  const ResultInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(onTap: (){context.push(const ResultsDetailsView());},
      child: Container(
        height: MediaQuery.of(context).size.height * .13,
        width: MediaQuery.of(context).size.width * .40,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: customBoxShadow(),
          border: Border.all(color: ColorManager.grey),
        ),
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "الترم الاول",
                    style: getMediumStyle(
                        color: ColorManager.grey, fontSize: 12),
                  ),
                ),
                const Icon(
                  Icons.double_arrow_rounded,
                  color: ColorManager.secondaryColor,
                ),
              ],
            ),
            const ResultInfoRow(
              title: "GAP",
              body: "3.6",
            ),
            const ResultInfoRow(
              title: "Percentage",
              body: "96%",
            ),
          ],
        ),
      ),
    );
  }
}
