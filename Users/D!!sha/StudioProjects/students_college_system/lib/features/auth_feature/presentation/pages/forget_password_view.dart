import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_button.dart';
import 'package:students_college_system/features/auth_feature/presentation/manager/sign_up_controller/sign_up_cubit.dart';
import 'package:students_college_system/features/auth_feature/presentation/widgets/custom_auth_page.dart';
import 'package:students_college_system/features/home_service_feature/presentation/pages/home_services_view.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../widgets/sign_up/sign_up_text_form_part.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<SignUpCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAuthPart(text: "نسيت كلمة المرور"),
              SizedBox(
                  height: 40.h
              ),
              const SignUpTextFormPart(),  SizedBox(
                height: 20.h,
              ),
              CustomButton(
                text: "التالى ",
                onPressed: () {  customDialog(
                    context: context,
                    title: '''ستصل لك كلمة المرور الخاصه بك علي بريدك الالكتروني التي ستسخدمها في الخطوه التالية''',
                    btnOkOnPress: () {context.push(const HomeServicesView());},
                    dialogType: DialogType.info);},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
