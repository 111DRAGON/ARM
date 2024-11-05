import 'package:arm/core/widgets/custom_bottom_sheet.dart';
import 'package:arm/features/offers_feature/presentation/controller/delete_offer_licence/delete_offer_licence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../business_features/presentation/pages/active_business_view.dart';
import '../../data/models/get_activation_offer_licence_data_model.dart';
import '../controller/activate_offer_licence/activate_offer_licence_cubit.dart';

class GetActivationOfferCard extends StatelessWidget {
  const GetActivationOfferCard({
    super.key,
    required this.model,
    required this.id,
  });
  final GetActivationOfferLicencesDataModel model;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {customBottomSheet(context: context, okOnPressed: () async {
        await BlocProvider.of<ActivateOfferLicenceCubit>(context)
            .activateOfferLicence(
          context: context, id: id, );
      }, deleteOnPressed: () async {
        await BlocProvider.of<DeleteOfferLicenceCubit>(context)
            .deleteOfferLicence(
          context: context, id: id, );
      });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: customBoxShadow(),
          color: ColorManager.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: customBoxShadow(),
                  color: ColorManager.white,
                  image: DecorationImage(
                      image: NetworkImage(model.offer.poster.toString()),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 10.h),
              customRow(":عنوان العرض", model.offer.title),
              SizedBox(height: 10.h),
              customRow(":وصف العرض", model.offer.description),
              SizedBox(height: 10.h),
              customRow(": سعر العرض ", model.plan.cost.toString()),
              SizedBox(height: 10.h),
              customRow(": عدد الايام ", model.plan.days.toString()),
              SizedBox(height: 10.h),
              customRow(
                ": المنطقه ",
                model.business.regionName,
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
