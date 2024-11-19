import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/books_feature/presentation/pages/choosing_year_view.dart';
import 'package:students_college_system/features/exam_feature/presentation/pages/choosing_exam_view.dart';
import '../../../../core/recourses/image_manager/image_manager.dart';
import '../../../courses_feature/presentation/pages/registration_courses_view.dart';
import '../../../payment_feature/presentation/pages/payment_view.dart';
import 'home_page_custom_button.dart';

class HomePageGrid extends StatelessWidget {
  const HomePageGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: GridView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 1,
        ),
        children: [
          HomePageCustomButton(
            onTap: () {context.push(const ChoosingExamView());},
            text: 'الامتحانات',
            image: ImageManager.examImage,
          ),
          HomePageCustomButton(
            onTap: () {context.push(const ChoosingYearView());},
            text: 'الكتب الدراسية',
            image: ImageManager.booksImage,
          ),
          HomePageCustomButton(
            onTap: () { context.push(const RegistrationCoursesView());},
            text: 'تسجيل المواد',
            image: ImageManager.onlineImage,
          ),
          HomePageCustomButton(
            onTap: () {context.push(const PaymentView());},
            text: 'المصروفات',
            image: ImageManager.paymentImage,
          ),
        ],
      ),
    );
  }
}
