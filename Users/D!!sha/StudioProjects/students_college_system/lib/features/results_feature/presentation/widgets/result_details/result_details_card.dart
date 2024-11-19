import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/results_feature/presentation/widgets/result_details/result_details_row.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';

class ResultDetailsCard extends StatelessWidget {
  const ResultDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsetsDirectional.symmetric(vertical: 10.h,horizontal: 20.w
    ),
      padding: const EdgeInsetsDirectional.all(20),
      height: MediaQuery.of(context).size.height * .19,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: ColorManager.grey,
        ),
        boxShadow: customBoxShadow(),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Web information systems",
                style: getSemiBoldStyle(fontSize: 18),
              )),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    boxShadow: customBoxShadow(),
                    border: Border.all(color: ColorManager.lightGrey),
                    borderRadius: BorderRadius.circular(90),
                    color: ColorManager.white),
                child: Center(
                    child: Text(
                  "A",
                  style: getSemiBoldStyle(fontSize: 22),
                )),
              )
            ],
          ),
          const ResultDetailsRow(body: "3h", title: "Hours"),
          const ResultDetailsRow(body: "1SE14", title: "Code"),
        ],
      ),
    );
  }
}
