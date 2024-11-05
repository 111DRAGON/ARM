import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../transfer_business_ownership_feature/presentation/manager/transfer_business_ownership_cubit.dart';
import '../../data/models/get_users_data_model.dart';

class GetUsersCard extends StatelessWidget {
  const GetUsersCard({
    super.key,
    required this.model,
    required this.userId,
    required this.businessId,
  });
  final GetUsersDataModel model;
  final String userId;
  final String businessId;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          customDialog(
            context: context,
            title: "هل انت متأكد من نقل الملكيه لهذا المستخدم",
            btnOkOnPress: () {
              BlocProvider.of<TransferBusinessOwnershipCubit>(context)
                  .transferBusinessOwnership(
                context: context,
                userId: userId,
                businessId: businessId,
              );
            },
            dialogType: DialogType.warning,
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
          decoration: BoxDecoration(
            boxShadow: customBoxShadow(),
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            children: [
              Text(
                model.number.toString(),
                style: getBoldStyle(color: ColorManager.primary, fontSize: 25),
              ),
              const Divider(
                height: 20,
                color: ColorManager.secondaryColor,
                thickness: 2,
                indent: 50,
                endIndent: 50,
              ),
              SizedBox(height: 20.h),
              customRow(":الاسم *",
                  " ${model.firstName.toString()} ${model.lastName.toString()}"),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}

customRow(String text, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Expanded(
        child: Text(
          value,
          textDirection: TextDirection.rtl,
          style: getMediumStyle(fontSize: 20),
        ),
      ),
      SizedBox(
        width: 10.h,
      ),
      Text(
        text,
        style: getMediumStyle(fontSize: 20),
      ),
    ],
  );
}
