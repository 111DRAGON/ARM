import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_text_field.dart';
import 'package:students_college_system/features/auth_feature/presentation/pages/forget_password_view.dart';

import '../../manager/login_controller/login_cubit.dart';
import '../../manager/login_controller/login_state.dart';

class LoginTextFormPart extends StatelessWidget {
  const LoginTextFormPart({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.key,
      child: Column(
        children: [
          CustomTextFormField(controller: cubit.idController,
            suffixIcon: const Icon(FontAwesomeIcons.idCard),
            labelText: "الرقم القومى",
            textInputType: TextInputType.phone,
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل الرقم القومى';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextFormField(controller: cubit.emailController,
            suffixIcon: const Icon(Icons.email_outlined),
            labelText: "البريد الاكترونى",
            textInputType: TextInputType.emailAddress,
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل البريد الاكترونى';
              }
              return null;
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) =>
            current is LoginPasswordVisibilityState,
            builder: (context, state) {
              return CustomTextFormField(
                controller: cubit.passwordController,
                suffixIcon: IconButton(
                  onPressed: cubit.changePasswordVisibility,
                  icon: Icon(
                    cubit.passwordObscure ? Icons.visibility : Icons
                        .visibility_off,
                  ),
                ),
                labelText: "كلمة المرور",
                obscureText: cubit.passwordObscure,
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل كلمة المرور';
                  }
                  return null;
                },
              );
            },
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w),
            child: Align(alignment:Alignment.topRight,child: TextButton(onPressed: (){context.push(const ForgetPasswordView());}, child: const Text("هل نسيت كلمة المرور؟"))),
          )
        ],
      ),
    );
  }
}
