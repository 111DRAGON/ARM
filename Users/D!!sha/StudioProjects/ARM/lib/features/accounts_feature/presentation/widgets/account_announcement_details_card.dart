import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/widgets/account_custom_row.dart';
import '../../data/models/get_regions_month_accounts_model.dart';

class AccountAnnouncementDetailsCard extends StatelessWidget {
  const AccountAnnouncementDetailsCard({super.key, required this.model});
  final GetRegionsMonthAccountsDataModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return accountDetailsCard(
                cost: model.announcementStatistics[index].planCost,
                totalCost: model.announcementStatistics[index].totalCost,
                name: model.announcementStatistics[index].planName,
                days: model.announcementStatistics[index].planDays,
                paidCount: model
                    .announcementStatistics[index].paidRegularLicencesCount,
                unPaidCount: model
                    .announcementStatistics[index].paidPremiumLicencesCount,
                premiumCost:
                    model.announcementStatistics[index].planPremiumCost,
              );
            },
            itemCount: model.announcementStatistics.length,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

accountDetailsCard({
  required num cost,
  required String name,
  required num paidCount,
  required num unPaidCount,
  required num days,
  required num totalCost,
  required num premiumCost,

}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 10.h),
    child: Container(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 5.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: customBoxShadow(),
        color: ColorManager.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Row(
              children: [
                AccountCustomRow(
                    text: "عدد الايام", value: days.toString()),
                SizedBox(
                  width: 5.w,
                ),
                AccountCustomRow(
                    text: "       :الاسم", value: name.toString()),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              AccountCustomRow(
                  text: "س.خ المميزه", value: premiumCost.toString()),
              SizedBox(
                width: 5.w,
              ),
              AccountCustomRow(
                  text: "س.خ العاديه", value: cost.toString()),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              AccountCustomRow(
                  text: "ع.خ المميزه", value: unPaidCount.toString()),
              SizedBox(
                width: 5.w,
              ),
              AccountCustomRow(
                  text: "ع.خ العاديه", value: paidCount.toString()),
            ],
          ),
          SizedBox(height: 10.h),
          AccountCustomRow(
              text: "مجموع المبلغ الكلى للخطط ", value: totalCost.toString(),textWidth: 170.w,)
        ],
      ),
    ),
  );
}

