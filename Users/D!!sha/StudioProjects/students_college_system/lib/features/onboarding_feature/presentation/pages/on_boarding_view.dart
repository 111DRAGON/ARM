import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import '../../../../core/services/service_locator.dart';
import '../controller/on_boarding_cubit.dart';
import '../controller/on_boarding_state.dart';
import '../widgets/on_boarding_image_section.dart';
import '../widgets/on_boarding_skip_section.dart';
import '../widgets/on_boarding_text_part.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<OnBoardingCubit>(),
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        builder: (context, state) {
          final OnBoardingCubit onBoardingCubit =
              BlocProvider.of<OnBoardingCubit>(context);

          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Column(
                children: [
                  OnBoardingSkipSection(onBoardingCubit.index),
                  const OnBoardingImageSection(),
                  const Spacer(),
                  const OnBoardingTextPart()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
