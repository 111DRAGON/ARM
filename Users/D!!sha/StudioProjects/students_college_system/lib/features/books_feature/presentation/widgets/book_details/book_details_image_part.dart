import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class BookDetailsImagePart extends StatelessWidget {
  const BookDetailsImagePart({super.key, required this.image, required this.bookTitle, required this.bookWriter});
final String image;
final String bookTitle;
final String bookWriter;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .40,
          width: MediaQuery.of(context).size.width * .70,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(40.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 80.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    onPressed: () {context.pop();},
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                SizedBox(height: 50.h),
                Text(
                  bookTitle,
                  style: getBoldStyle(
                    fontSize: 20,
                    color: ColorManager.black,
                  ),
                ),
                Text(
                  bookWriter,
                  style: getSemiBoldStyle(
                    fontSize: 16,
                    color: ColorManager.grey,
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * .09,
            right: MediaQuery.of(context).size.width* .55,
            child: Container(
              height: MediaQuery.of(context).size.height * .23,
              width: MediaQuery.of(context).size.width* .33,
              decoration:  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),fit: BoxFit.fill
                ),
              ),
            ))
      ],
    );
  }
}
