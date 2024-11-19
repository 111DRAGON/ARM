import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/image_manager/image_manager.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import 'book_details_image_part.dart';
import 'details_card.dart';

class BookDetailsPart extends StatelessWidget {
  const BookDetailsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: ColorManager.secondaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(40.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const BookDetailsImagePart(
            image: ImageManager.bookCoverImage,
            bookTitle: 'C++ fundamental',
            bookWriter: 'Dr: Ahmed',
          ),
          SizedBox(height: 20.h),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailsCard(
                  title: 'الصفحات',
                  body: '120',
                ),
                DetailsCard(
                  title: "الترم",
                  body: 'السابع',
                ),
                DetailsCard(
                  title: 'الفرقة',
                  body: 'الرابعة',
                ),
                DetailsCard(
                  title: 'القسم',
                  body: 'medical',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
