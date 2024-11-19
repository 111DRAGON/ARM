import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/core/widgets/custom_button.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/custom_bottom_sheet.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/payment_custom_card.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/payment_info_card.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/payment_slider_part.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/payment_swiper_part.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "طرق الدفع", context: context),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const PaymentSwiperPart(),
            SizedBox(height: 10.h),
            Text(
              "معلومات عن المصورفات",
              style: getMediumStyle(fontSize: 20),
            ),
            SizedBox(height: 10.h),
            const PaymentInfoCard(),
            SizedBox(height: 40.h),
            const PaymentSliderPart(),
            SizedBox(height: 20.h),
            const PaymentSliderPart(),
            const Spacer(),
            CustomButton(
              text: "ادفع الان",
              onPressed: () {
                customBottomSheet(context: context);
              },
              iconData: Icons.payment,
            ),
          ],
        ),
      ),
    );
  }
}
