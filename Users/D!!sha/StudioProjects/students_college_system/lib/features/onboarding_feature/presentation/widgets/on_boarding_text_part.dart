import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import '../controller/on_boarding_cubit.dart';
import '../controller/on_boarding_state.dart';
import 'on_boarding_button.dart';

class OnBoardingTextPart extends StatelessWidget {
  const OnBoardingTextPart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        final OnBoardingCubit onBoardingCubit =
        BlocProvider.of<OnBoardingCubit>(context);

        return Container(
          height: MediaQuery.of(context).size.height * .35,
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.r),
            ),
          ),
          padding: const EdgeInsetsDirectional.all(30),
          child: Column(
            children: [
              Text(
                onBoardingCubit.data[onBoardingCubit.index].title,
                style: getBoldStyle(
                  fontSize: 22,
                  color: ColorManager.black,
                ),
                textDirection: TextDirection.rtl,
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                onBoardingCubit.data[onBoardingCubit.index].supTitle,
                style: getRegularStyle(
                  color: ColorManager.grey,
                ),
                textDirection: TextDirection.rtl,
              ),
              const Spacer(),
              OnboardingButton(onBoardingCubit.index)
            ],
          ),
        );
      },
    );
  }
}

