import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/widgets/custom_text_field.dart';

import '../../manager/change_password_controller/change_password_cubit.dart';
import '../../manager/change_password_controller/change_password_state.dart';

class ChangePasswordTextFormPart extends StatelessWidget {
  const ChangePasswordTextFormPart({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePasswordCubit cubit =
        BlocProvider.of<ChangePasswordCubit>(context);
    return Form(
      key: cubit.key,
      child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        buildWhen: (previous, current) =>
            current is ChangePasswordPasswordVisibilityState,
        builder: (context, state) {
          return Column(
            children: [
              CustomTextFormField(
                controller: cubit.oldPasswordController,
                suffixIcon: IconButton(
                  onPressed: cubit.changeOldPasswordVisibility,
                  icon: Icon(
                    cubit.oldPasswordObscure
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                labelText: "كلمة المرور",
                obscureText: cubit.oldPasswordObscure,
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل كلمة المرور';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                controller: cubit.newPasswordController1,
                suffixIcon: IconButton(
                  onPressed: cubit.changeNewPasswordVisibility1,
                  icon: Icon(
                    cubit.newPasswordObscure1
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                labelText: "كلمة المرور",
                obscureText: cubit.newPasswordObscure1,
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل كلمة المرور';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomTextFormField(
                controller: cubit.newPasswordController2,
                suffixIcon: IconButton(
                  onPressed: cubit.changeNewPasswordVisibility2,
                  icon: Icon(
                    cubit.newPasswordObscure2
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
                labelText: "كلمة المرور",
                obscureText: cubit.newPasswordObscure2,
                textInputType: TextInputType.visiblePassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'من فضلك ادخل كلمة المرور';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
