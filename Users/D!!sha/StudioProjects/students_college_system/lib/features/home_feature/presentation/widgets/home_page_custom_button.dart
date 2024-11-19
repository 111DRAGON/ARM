import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/utils/custom_box_shadow.dart';

class HomePageCustomButton extends StatelessWidget {
  const HomePageCustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.image,
  });
  final Function() onTap;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .20,
        width: MediaQuery.of(context).size.width * .40,
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(color: ColorManager.secondaryColor),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .11,
              width: MediaQuery.of(context).size.height * .11,
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  boxShadow: customBoxShadow(),
                  borderRadius: BorderRadius.circular(30.r),
                  image:  DecorationImage(
                    image: AssetImage(image),
                  )),
            ),
            SizedBox(height: 5.h),
            Text(
             text,
              style: getBoldStyle(),
            ),
            SizedBox(height: 5.h),
            const Icon(
              Icons.double_arrow_sharp,
              color: ColorManager.secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}
