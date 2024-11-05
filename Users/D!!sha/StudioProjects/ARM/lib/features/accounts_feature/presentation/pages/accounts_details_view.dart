import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/account_custom_row.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/models/get_regions_month_accounts_model.dart';
import '../widgets/account_announcement_details_card.dart';
import '../widgets/account_business_details_card.dart';
import '../widgets/account_notification_details_card.dart';
import '../widgets/account_offer_details_card.dart';
import '../widgets/accounts_details_section_title.dart';

class AccountsDetailsView extends StatelessWidget {
  final GetRegionsMonthAccountsDataModel model;

  const AccountsDetailsView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("الدخل الشهرى"),
      body:SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          const AccountsDetailsSectionTitle('حسابات الاماكن'),
          AccountBusinessDetailsCard(model: model,),
          const AccountsDetailsSectionTitle('حسابات الاعلانات'),
         AccountAnnouncementDetailsCard(model: model,),
          const AccountsDetailsSectionTitle('حسابات العروض'),
          AccountOfferDetailsCard(model: model,),
          const AccountsDetailsSectionTitle('حسابات الاشعرات'),
          AccountNotificationDetailsCard(model: model,),
          const AccountsDetailsSectionTitle('حسابات المجموع الكلى'),
          SizedBox(height: 20.h,),
          AccountCustomRow(
              text: "مجموع المبلغ الكلى للشهر ", value: model.totalCost.toString(),color: Colors.blue,textWidth: 170.w,),
          SizedBox(height: 20.h,),


        ],),
      ),
    );
  }
}
