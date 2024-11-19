import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/payment_custom_card.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';

class PaymentInfoCard extends StatelessWidget {
  const PaymentInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return   PaymentCustomCard(
      height: MediaQuery.of(context).size.height * .12,
      width: MediaQuery.of(context).size.width,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      ":  المصاريف المطلوبة",
                      style: getMediumStyle(),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "المدفوع: 12000جنيها",
                      style: getMediumStyle(
                        fontSize: 11,
                        color: ColorManager.grey,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "المتبقي: 23000جنيها",
                      style: getMediumStyle(
                        fontSize: 11,
                        color: ColorManager.grey,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),);
  }
}
