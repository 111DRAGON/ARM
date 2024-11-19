import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_confirm_dialog.dart';
import 'package:students_college_system/features/auth_feature/presentation/widgets/custom_auth_page.dart';
import 'package:students_college_system/features/home_service_feature/presentation/pages/home_services_view.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../manager/change_password_controller/change_password_cubit.dart';
import '../widgets/change_password/change_password_text_form_part.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<ChangePasswordCubit>(),
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const CustomAuthPart(text: "تغير كلمة المرور"),
              const ChangePasswordTextFormPart(),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                text: "تغير ",
                onPressed: () {
                  customConfirmDialog(
                      context: context,
                      title: "تم تغبير كلمة المرور بنجاح",
                      btnOkOnPress: () {
                        context.push(
                          const HomeServicesView(),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
