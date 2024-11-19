import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/on_boarding_cubit.dart';

class OnBoardingImageSection extends StatelessWidget {
  const OnBoardingImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final OnBoardingCubit onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);

    return Container(
      height: MediaQuery.of(context).size.height * .45,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      child: PageView(
          physics: const BouncingScrollPhysics(),
          controller: onBoardingCubit.pageController,
          onPageChanged: (value) => onBoardingCubit.onPageChanged(value),
          children: onBoardingCubit.images.map((e) => Image.asset(e)).toList()),
    );
  }
}
