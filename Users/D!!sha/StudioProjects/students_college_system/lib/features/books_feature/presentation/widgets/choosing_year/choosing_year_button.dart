import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_box_shadow.dart';

class ChoosingYearButton extends StatelessWidget {
  const ChoosingYearButton(
      {super.key,
      required this.onTap,
      required this.text,
      required this.image});
  final Function() onTap;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .07,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: customBoxShadow(),
          ),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios_new),
              Expanded(
                  child: Text(
                text,
                style: getMediumStyle(fontSize: 18),
                textDirection: TextDirection.rtl,
              )),
              SizedBox(width: 20.w),
              Container(
                height: MediaQuery.of(context).size.height * .050,
                width: MediaQuery.of(context).size.width * .10,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                        fit: BoxFit.fill)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
