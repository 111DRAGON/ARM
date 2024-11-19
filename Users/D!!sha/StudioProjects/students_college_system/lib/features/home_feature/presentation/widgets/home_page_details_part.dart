import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/auth_feature/presentation/pages/change_password_view.dart';
import 'package:students_college_system/features/home_feature/presentation/widgets/home_page_image_part.dart';
import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/utils/custom_box_shadow.dart';
import 'home_page_custom_row.dart';

class HomePageDetailsPart extends StatelessWidget {
  const HomePageDetailsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .40,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorManager.cardColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: customBoxShadow(),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {context.push(const ChangePasswordView());},
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: ColorManager.lightGrey,
                    child: Icon(
                      Icons.password,
                      size: 35,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const HomePageImagePart(),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: EdgeInsets.only(right: 40.w),
            child: const Column(
              children: [
                HomePageCustomRow(body: "منار ربيع", title: "الاسم"),
                HomePageCustomRow(
                    body: "كلية حاسبات والذكاءالاصطناعى", title: "الكليه"),
                HomePageCustomRow(body: "المعلومات الطبيه", title: "القسم"),
                HomePageCustomRow(body: "2024", title: "الدفعه"),
                HomePageCustomRow(body: "20020202020000", title: "الرقم"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
