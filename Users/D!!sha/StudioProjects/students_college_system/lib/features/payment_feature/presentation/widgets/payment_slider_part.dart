import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/payment_custom_card.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';

class PaymentSliderPart extends StatelessWidget {
  const PaymentSliderPart({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentCustomCard(
        height: MediaQuery.of(context).size.height * .10,
        width: MediaQuery.of(context).size.width,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "+12000",
                    style: getRegularStyle(),
                  ),
                  Text(
                    "-1000",
                    style: getRegularStyle(color: ColorManager.grey),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      "التيرم الاول",
                      style: getMediumStyle(),
                    ),
                  ),
                  Slider(
                    value: 90,
                    onChanged: (value) {},
                    max: 120,
                    min: 0,
                    activeColor: ColorManager.secondaryColor,
                    inactiveColor: Colors.blue,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
