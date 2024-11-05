import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../business_features/presentation/pages/active_business_view.dart';
import '../../data/models/get_activation_notification_licence_data_model.dart';
import '../manager/activate_notification_licence/activate_notification_licence_cubit.dart';
import '../manager/delete_notification/delete_notification_cubit.dart';

class GetActivationNotificationCard extends StatelessWidget {
  const GetActivationNotificationCard({
    super.key,
    required this.model,
    required this.id,
  });
  final GetActivationNotificationLicencesDataModel model;
  final int id;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                CustomButton(
                    text: 'نعم بدفع ',
                    backgroundColor: ColorManager.primary,
                    foregroundColor: ColorManager.white,
                    onPressed: () async {
                      await BlocProvider.of<ActivateNotificationLicenceCubit>(
                              context)
                          .activateNotificationLicence(
                        context: context,
                        id: id,
                      );
                    }),
                SizedBox(height: 20.h),
                CustomButton(
                    text: 'لا',
                    backgroundColor: ColorManager.red,
                    foregroundColor: ColorManager.white,
                    onPressed: () async {
                      await BlocProvider.of<DeleteNotificationCubit>(context)
                          .deleteNotification(context: context, id: id, );
                    }),
              ],
            ),
          ),
        );
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
                      image: NetworkImage(model.business.logo),
                      fit: BoxFit.fill),
                ),
              ),
              customRow(": الاسم", model.business.name),
              SizedBox(height: 10.h),
              customRow(": الوصف", model.business.description),
              SizedBox(height: 10.h),
              customRow(": العنوان", model.business.address),
              SizedBox(height: 10.h),
              customRow(": البلد", model.business.regionName),
              SizedBox(height: 10.h),
              customRow(": المبلغ المدفوع", model.plan.cost.toString()),
              SizedBox(height: 10.h),
              customRow(": عدد الاشعارات ", model.plan.count.toString()),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
