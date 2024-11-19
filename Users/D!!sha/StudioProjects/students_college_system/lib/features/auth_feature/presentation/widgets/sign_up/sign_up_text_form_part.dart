import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/core/widgets/custom_text_field.dart';
import 'package:students_college_system/features/auth_feature/presentation/manager/sign_up_controller/sign_up_cubit.dart';


class SignUpTextFormPart extends StatelessWidget {
  const SignUpTextFormPart({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpCubit cubit = BlocProvider.of<SignUpCubit>(context);
    return Form(
      key: cubit.key,
      child: CustomTextFormField(controller: cubit.emailController,
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
    );
  }
}
