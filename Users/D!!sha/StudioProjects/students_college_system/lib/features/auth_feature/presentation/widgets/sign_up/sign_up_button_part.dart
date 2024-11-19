import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/auth_feature/presentation/pages/login_view.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dialog.dart';

class SignUpButtonPart extends StatelessWidget {
  const SignUpButtonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        CustomButton(
          text: "إنشاء ",
          onPressed: () {
            customDialog(
                context: context,
                title:
                    '''ستصل لك كلمة المرور الخاصه بك علي بريدك الالكتروني التي ستسخدمها في الخطوه التالية''',
                btnOkOnPress: () {
                  context.push(const LoginView());
                },
                dialogType: DialogType.info);
          },
        ),
        SizedBox(
          height: 60.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                context.push(const LoginView());
              },
              child: Text(
                "إضغط هنا",
                style: getRegularStyle(color: ColorManager.primary),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              "إذا كان لديك حساب؟",
              style: getRegularStyle(color: ColorManager.grey),
            ),
          ],
        ),
      ],
    );
  }
}
