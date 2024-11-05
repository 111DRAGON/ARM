import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/widgets/custom_box_shadow.dart';
import '../../../regions_features/presentation/controller/get_regions_controller/get_regions_cubit.dart';
import '../../data/models/city_data_model.dart';
import '../controller/get_cities_controller/get_cities_cubit.dart';

class ChooseRegionCityListViewItem extends StatelessWidget {
  const ChooseRegionCityListViewItem(this.model,{super.key});
  final CityDataModel model;
  @override
  Widget build(BuildContext context) {

    final bool isChosen = BlocProvider.of<GetCitiesCubit>(context).chosenItem?.id == model.id;

    return GestureDetector(
      onTap: () async{
        BlocProvider.of<GetCitiesCubit>(context).chooseCity(model);
        await BlocProvider.of<GetRegionsCubit>(context).getRegions(chosenId: model.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 16.w, vertical: 16.h),
        margin: EdgeInsets.symmetric(
            horizontal: 8.w, vertical: 12.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          boxShadow: customBoxShadow(),
          color: isChosen ? ColorManager.primary :  ColorManager.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          model.name,
          style: getRegularStyle(
            fontSize: 20,
            color: isChosen ? ColorManager.white : ColorManager.primary,
          ),
        ),
      ),
    );
  }
}
