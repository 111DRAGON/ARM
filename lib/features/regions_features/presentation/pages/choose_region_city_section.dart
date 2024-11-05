import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/widgets/failure_state.dart';
import '../../../../../core/widgets/loading_state.dart';
import '../../../city_feature/presentation/controller/get_cities_controller/get_cities_cubit.dart';
import '../../../city_feature/presentation/controller/get_cities_controller/get_cities_state.dart';
import '../../../city_feature/presentation/pages/choose_city_list_view.dart';

class ChooseRegionCitySection extends StatelessWidget {
  const ChooseRegionCitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'اختر المدينة',
          style: getSemiBoldStyle(fontSize: 20),
        ),
        SizedBox(height: 20.h),
        BlocBuilder<GetCitiesCubit,GetCitiesState>(
          builder: (context, state) {
            if(state is GetCitiesLoadingState){
              return const LoadingState();
            }
            else if(state is GetCitiesFailureState){
              return FailureState(state.errorMessage);
            }
            else {
              return SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 100.h,
                child: ChooseRegionCitySectionListView(BlocProvider.of<GetCitiesCubit>(context).models),
              );
            }
          },
        ),
      ],
    );
  }
}
