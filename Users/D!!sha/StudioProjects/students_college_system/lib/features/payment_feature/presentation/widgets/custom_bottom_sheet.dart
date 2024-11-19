import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/recourses/image_manager/image_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_button.dart';
import 'package:students_college_system/core/widgets/custom_confirm_dialog.dart';
import 'package:students_college_system/features/home_service_feature/presentation/pages/home_services_view.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/bottom_sheet_text_form.dart';

customBottomSheet({
  required BuildContext context,
}) async {
  return showModalBottomSheet(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.do_not_disturb),
              ),
              Text(
                "تفاصيل الدفع",
                style: getSemiBoldStyle(fontSize: 20),
              ),
            ],
          ),
          const BottomSheetTextForm(),
          SizedBox(height: 10.h),
          CustomButton(
            text: "ادفع الان",
            onPressed: () {
              customConfirmDialog(image: ImageManager.paymentAcceptedImage,
                  context: context,
                  title: "تم الدفع بنجاح",
                  btnOkOnPress: () {
                    context.push(const HomeServicesView());
                  });
            },
            iconData: Icons.payment,
          )
        ]),
      ),
    ),
  );
}
