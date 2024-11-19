import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/auth_feature/presentation/manager/sign_up_controller/sign_up_cubit.dart';
import 'package:students_college_system/features/auth_feature/presentation/widgets/custom_auth_page.dart';
import '../../../../core/services/service_locator.dart';
import '../widgets/sign_up/sign_up_button_part.dart';
import '../widgets/sign_up/sign_up_text_form_part.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<SignUpCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAuthPart(text: "إنشاء حساب جديدٍ"),
              SizedBox(height: 40.h),
              const SignUpTextFormPart(),
              const SignUpButtonPart()
            ],
          ),
        ),
      ),
    );
  }
}
