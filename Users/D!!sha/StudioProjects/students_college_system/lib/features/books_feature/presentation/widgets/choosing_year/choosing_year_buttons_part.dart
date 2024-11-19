import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/books_feature/presentation/pages/book_details_view.dart';

import '../../../../../core/recourses/image_manager/image_manager.dart';
import '../../pages/books_view.dart';
import 'choosing_year_button.dart';

class ChoosingYearButtonsPart extends StatelessWidget {
  const ChoosingYearButtonsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [  SizedBox(height: 20.h),
      ChoosingYearButton(
        onTap: () {context.push(const BooksView());},
        text: "الفرقة الاولى",
        image: ImageManager.yearOneImage,
      ),
      ChoosingYearButton(
        onTap: () {context.push(const BooksView());},
        text: "الفرقة الثانية",
        image: ImageManager.yearTwoImage,
      ),
      ChoosingYearButton(
        onTap: () {context.push(const BooksView());},
        text: "الفرقة الثالثة",
        image: ImageManager.yearThreeImage,
      ),
      ChoosingYearButton(
        onTap: () {context.push(const BooksView());},
        text: "الفرقة الرابعة",
        image: ImageManager.yearFourImage,
      ),],);
  }
}
