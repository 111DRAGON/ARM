import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../auth_feature/presentation/pages/login_view.dart';
import '../controller/on_boarding_cubit.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton(this.index, {super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainSemantics: true,
      maintainState: true,
      visible:
          index == (BlocProvider.of<OnBoardingCubit>(context).images.length - 1)
              ? true
              : false,
      child: CustomButton(
        text: "ابدء",
        width: 200.w,
        height: 40.h,
        onPressed: () {
          context.push(const LoginView());
        },
      ),
    );
  }
}
