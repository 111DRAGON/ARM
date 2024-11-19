import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/features/home_service_feature/presentation/widgets/custom_bottom_nav_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../controller/home_service_cubit.dart';

class HomeServicesView extends StatelessWidget {
  const HomeServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<HomeServiceCubit>(),
      child: BlocBuilder<HomeServiceCubit, HomeServiceState>(
        builder: (context, state) {
          final cubit = context.read<HomeServiceCubit>();

          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CustomBottomNavBar(
              onTap: (index) => cubit.changeCurrentIndex(index),
              currentIndex: cubit.currentIndex,
            ),
          );
        },
      ),
    );
  }
}
