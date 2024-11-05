import 'package:arm/core/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../../../business_features/presentation/pages/active_business_view.dart';
import '../../data/models/get_activation_announcement_licence_data_model.dart';
import '../manager/activate_announcement_licence/activate_announcement_licence_cubit.dart';
import '../manager/delete_announcement_licence/delete_announcement_licence_cubit.dart';

class GetActivationAnnouncementCard extends StatelessWidget {
  const GetActivationAnnouncementCard({
    super.key,
    required this.model,
    required this.id,
  });
  final GetActivationAnnouncementLicencesDataModel model;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {customBottomSheet(context: context, okOnPressed:  () async {
        await BlocProvider.of<ActivateAnnouncementLicenceCubit>(
            context)
            .activateAnnouncementLicence(
          context: context, id: id, );
      }, deleteOnPressed:  () async {
        await BlocProvider.of<DeleteAnnouncementLicenceCubit>(context)
            .deleteAnnouncement(
          context: context, id: id,);
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
                      image: NetworkImage(model.announcement.poster.toString()),
                      fit: BoxFit.fill),
                ),
              ),
              customRow(":اسم الاعلان", model.announcement.title.toString()),
              SizedBox(height: 10.h),
              customRow(
                  ": وصف الاعلان ", model.announcement.description.toString()),
              customRow(":  إعلان مميز", model.premium.toString()),
              SizedBox(height: 10.h),
              customRow(
                  ": سعر الاعلان العادى", model.plan.cost.toString()),
              SizedBox(height: 10.h),
              customRow(
                  ": سعر الاعلان المميز", model.plan.premiumCost.toString()),
              SizedBox(height: 10.h),
              customRow(": عدد الايام ", model.plan.days.toString()),
              SizedBox(height: 10.h),
              customRow(":  المنطقة", model.business.regionName),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
