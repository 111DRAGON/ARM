import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/books_feature/presentation/pages/book_details_view.dart';

import '../../../../../core/recourses/image_manager/image_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class BooksViewBookIconCard extends StatelessWidget {
  const BooksViewBookIconCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){context.push(const BookDetailsView(),);},
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Container(
            height: MediaQuery.of(context).size.height*.16,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  ImageManager.bookCoverImage,
                ),
              ),
            ),
          ),
          Text(
            "c++ fundamental",
            style: getMediumStyle(fontSize: 12),
          ),
          Text(
            "dr: solom",
            style: getMediumStyle(fontSize: 12, color: ColorManager.grey),
          ),
        ],
      ),
    );
  }
}
