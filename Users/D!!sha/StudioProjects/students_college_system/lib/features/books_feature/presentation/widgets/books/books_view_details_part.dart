import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/widgets/personal_info_row.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class BooksViewDetailsPart extends StatelessWidget {
  const BooksViewDetailsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(20),
      height: MediaQuery.of(context).size.height * .25,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 20.h),
          const PersonalInfoRow(),
          SizedBox(height: 20.h),
          Text(
            " الكتب الدراسية",
            style: getBoldStyle(fontSize: 20, color: ColorManager.white),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(height: 5.h),
          Text(
            "للفرقة الرابعه / الترم السابع",
            style: getBoldStyle(fontSize: 20, color: ColorManager.white),
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
