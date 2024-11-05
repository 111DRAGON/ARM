import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/utils/custom_navigation.dart';
import '../controller/login_controller/login_cubit.dart';
import '../controller/login_controller/login_state.dart';
import 'custom text form field.dart';

class LoginPageTextFieldSection extends StatelessWidget {
  const LoginPageTextFieldSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final LoginCubit cubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: cubit.key,
      child: Column(
        children: [
          AuthCustomTextFormField(
            hintText: 'رقم الهاتف',
            suffixIcon: Icons.phone,
            controller: cubit.phoneController,
            textInputType: TextInputType.phone,
            validator: (value){
              if(value!.isEmpty){
                return 'من فضلك ادخل رقم الهاتف';
              }
            },
          ),
          SizedBox(height: 30.h),
          BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) => AuthCustomTextFormField(
              obscureText: cubit.passwordObscure,
              hintText: 'كلمة المرور',
              controller: cubit.passwordController,
              suffixIcon: Icons.password,
              prefixIcon: IconButton(
                onPressed: cubit.changePasswordVisibility,
                icon: Icon(
                  cubit.passwordObscure ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              textInputType: TextInputType.visiblePassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'من فضلك ادخل كلمة المرور';
                }
              },
            ),
          ),
          SizedBox(height: 10.h),

        ],
      ),
    );
  }
}
