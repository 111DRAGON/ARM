import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/core/widgets/custom_button.dart';
import 'package:students_college_system/features/activate_feature/presentation/manager/activate_view_cubit.dart';
import 'package:students_college_system/features/activate_feature/presentation/widgets/acivate_vew/activate_view_button_row.dart';

import '../../../../core/services/service_locator.dart';

class ActivateView extends StatelessWidget {
  const ActivateView({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => sl.get<ActivateViewCubit>(),

      child: Scaffold(
        appBar: customAppBar(text: "المقررات", context: context),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const ActivateViewButtonRow(),
              SizedBox(height: 20.h),
              BlocBuilder<ActivateViewCubit, ActivateViewState>(
                builder: (context, state) {
                  final cubit = context.read<ActivateViewCubit>();
                  return cubit.activateViewBody[cubit.pageNum];
                },
              ),
              CustomButton(
                text: "تحديث الصفحة",
                onPressed: () {},
                iconData: CupertinoIcons.arrow_clockwise,
                backgroundColor: ColorManager.secondaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
