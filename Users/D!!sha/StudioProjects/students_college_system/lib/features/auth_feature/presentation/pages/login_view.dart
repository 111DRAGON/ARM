import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/features/auth_feature/presentation/widgets/custom_auth_page.dart';
import 'package:students_college_system/features/auth_feature/presentation/widgets/login/login_button_part.dart';
import 'package:students_college_system/features/auth_feature/presentation/widgets/login/login_text_form_part.dart';
import '../../../../core/services/service_locator.dart';
import '../manager/login_controller/login_cubit.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<LoginCubit>(),
      child: const Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomAuthPart(text: "تسجيل الدخول"),
              LoginTextFormPart(),
              LoginButtonPart()

            ],
          ),
        ),
      ),
    );
  }
}
