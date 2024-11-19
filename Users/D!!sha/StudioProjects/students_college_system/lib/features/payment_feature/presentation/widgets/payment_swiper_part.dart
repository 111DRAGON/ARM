import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/image_manager/image_manager.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/payment_custom_card.dart';

class PaymentSwiperPart extends StatelessWidget {
  const PaymentSwiperPart({super.key});
  @override
  Widget build(BuildContext context) {
    final List visa = [
      ImageManager.visaCardImage,
      ImageManager.visaCard2Image,
      ImageManager.visaCard3Image,
    ];

    return PaymentCustomCard(
        height: MediaQuery.of(context).size.height * .20,
        width: MediaQuery.of(context).size.width,
        body: Padding(
          padding:  EdgeInsets.all(10.sp),
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                visa[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: visa.length,
            itemWidth: MediaQuery.of(context).size.width*.70,
            layout: SwiperLayout.STACK,
          ),
        ));
  }
}
