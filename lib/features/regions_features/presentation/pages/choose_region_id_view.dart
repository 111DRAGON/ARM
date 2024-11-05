import 'package:arm/core/utils/custom_navigation.dart';
import 'package:arm/features/home_feature/presentation/pages/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';

import '../../../city_feature/presentation/controller/get_cities_controller/get_cities_cubit.dart';
import '../../../regions_features/presentation/controller/get_regions_controller/get_regions_cubit.dart';
import '../../../regions_features/presentation/controller/get_regions_controller/get_regions_state.dart';
import '../../../regions_features/presentation/pages/choose_region_city_section.dart';
import '../../../regions_features/presentation/pages/choose_region_list_view.dart';

class ChooseRegionIdView extends StatefulWidget {
  const ChooseRegionIdView({super.key});

  @override
  State<ChooseRegionIdView> createState() => _ChooseRegionIdViewState();
}

class _ChooseRegionIdViewState extends State<ChooseRegionIdView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetCitiesCubit>(context).getCities();
    BlocProvider.of<GetRegionsCubit>(context).chosenRegion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(""),
      body: Column(
        children: [
          const ChooseRegionCitySection(),
          Text(
            'اختر المنطقة',
            style: getSemiBoldStyle(fontSize: 20),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: BlocBuilder<GetRegionsCubit, GetRegionsState>(
              builder: (context, state) {
                if (state is GetRegionsInitialState) {
                  return Text(
                    'لم يتم اخيار مدينة بعد',
                    style: getMediumStyle(),
                  );
                } else if (state is GetRegionsLoadingState) {
                  return const LoadingState();
                } else if (state is GetRegionsFailureState) {
                  return FailureState(state.errorMessage);
                } else {
                  return ChooseRegionListView(
                      BlocProvider.of<GetRegionsCubit>(context).regions);
                }
              },
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          BlocBuilder<GetRegionsCubit, GetRegionsState>(
            builder: (context, state) {
              if (state is GetRegionsLoadingState) {
                return const LoadingState();
              } else {
                return CustomButton(
                    text: "إختيار منطقة",
                    backgroundColor: Colors.red,
                    onPressed: () async {
                      int? regionId = BlocProvider.of<GetRegionsCubit>(context)
                          .chosenRegion
                          ?.id;
                      if (regionId == null) {
                        await customToast(
                            'لم يتم اخيار منطقة برجاء اختيار منطقة',
                            ToastStatus.warning);
                      } else {
                        await BlocProvider.of<GetRegionsCubit>(context)
                            .selectRegion(
                                context,
                                BlocProvider.of<GetRegionsCubit>(context)
                                    .chosenRegion!);
                        context.push(const HomeView());
                      }
                    });
              }
            },
          ),
        ],
      ),
    );
  }
}
