import 'package:arm/core/widgets/custom_bottom_sheet.dart';
import 'package:arm/features/business_features/presentation/manager/delete_business_licence/delete_business_licence_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/custom_button.dart';
import '../manager/active_business_licences_controller/active_business_licence_cubit.dart';
import '../manager/delete_business_controller/delete_business_cubit.dart';
import '../pages/active_business_view.dart';

class GetActivationBusinessLicenceCard extends StatelessWidget {
  const GetActivationBusinessLicenceCard({
    super.key,
    required this.name,
    required this.id,
    required this.description,
    required this.address,
    required this.days,
    required this.cost,
    required this.image,
  });
  final String name;
  final String description;
  final String address;
  final int id;
  final String image;
  final int days;
  final double cost;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customBottomSheet(
            context: context,
            okOnPressed: () async {
              await BlocProvider.of<ActiveBusinessLicenceCubit>(context)
                  .activeBusinessLicence(
                id,
                context,
              );
            },
            deleteOnPressed: () async {
              await BlocProvider.of<DeleteBusinessLicenceCubit>(context)
                  .deleteBusinessLicence(
                context: context,
                id: id,
              );
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r)),
                    boxShadow: customBoxShadow(),
                    color: ColorManager.white,
                    image: DecorationImage(
                        image: NetworkImage(image), fit: BoxFit.fill),
                  )),
              SizedBox(
                height: 10.h,
              ),
              customRow(": الاسم", name),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      description,
                      textDirection: TextDirection.rtl,
                      style: getMediumStyle(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Text(
                    ": الوصف",
                    style: getMediumStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              customRow(": العنوان", address),
              SizedBox(height: 10.h),
              customRow(": السعر المدفوع", cost.toString()),
              SizedBox(height: 10.h),
              customRow(": ايام العرض", days.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
