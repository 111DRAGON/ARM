import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/image_manager/image_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/core/widgets/custom_button.dart';

customConfirmDialog({
  required BuildContext context,
  required String title,
  String? buttonText,
  String? image,

  required Function() btnOkOnPress,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                image??ImageManager.youngWomanImage,
                height: MediaQuery.of(context).size.height * .15,
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: getSemiBoldStyle(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: buttonText ?? "رجوع",
                onPressed: btnOkOnPress,
                width: 150,
                height: 40,
              ),
            ],
          ),
        ),
      );
    },
  );
}
