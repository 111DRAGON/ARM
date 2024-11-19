import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/features/auth_feature/presentation/pages/sign_up_view.dart';
import 'package:students_college_system/features/home_service_feature/presentation/pages/home_services_view.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/widgets/custom_button.dart';

class LoginButtonPart extends StatelessWidget {
  const LoginButtonPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [ SizedBox(
      height: 20.h,
    ),
      CustomButton(
        text: "تسجيل ",
        onPressed: () {context.push(const HomeServicesView());},
        iconData: Icons.login,
      ),
      SizedBox(
        height: 30.h,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {context.push(const SignUpView());},
            child:   Text("إضغط هنا",style: getRegularStyle(color: ColorManager.primary),),
          ), SizedBox(
            width: 5.w,
          ),
          Text("إذا لم يكن لديك حساب؟",style: getRegularStyle(color: ColorManager.grey),),

        ],
      ),],);
  }
}
