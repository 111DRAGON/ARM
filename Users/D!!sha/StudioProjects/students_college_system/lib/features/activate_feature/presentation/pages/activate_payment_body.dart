import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/image_manager/image_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/features/activate_feature/presentation/widgets/activate_payment/activate_payment_card.dart';
import '../widgets/activate_payment/activate_payment_row.dart';

class ActivatePaymentBody extends StatelessWidget {
  const ActivatePaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .62,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              ImageManager.visaCardImage,
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width * .90,
            ),
            Text(
              "معلومات عن بطاقتك",
              style: getSemiBoldStyle(),
            ),
            const ActivatePaymentRow(
              icon: Icons.credit_card_outlined,
              title: "Card Number",
              value: "1234 345 2323 1232",
            ),
            const ActivatePaymentRow(
              icon: Icons.date_range,
              title: "Expiry Date",
              value: "09/25",
            ),
            const ActivatePaymentRow(
              icon: Icons.lock,
              title: "CVV Code",
              value: "555",
            ),
            SizedBox(height: 20.h),
            const ActivatePaymentCard(
              icon: Icons.add_circle,
              title: "المصروفات المدفوعة",
              value: "12000",
              iconColor: Colors.orange,
            ),
            const ActivatePaymentCard(
              icon: Icons.remove_circle,
              title: "المصروفات المتبقية",
              value: "1000",
              iconColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
