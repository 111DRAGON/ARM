import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/payment_feature/presentation/widgets/bottom_sheet_text_form_item.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/custom_text_field.dart';

class BottomSheetTextForm extends StatelessWidget {
  const BottomSheetTextForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const BottomSheetTextFormItem(
          name: "الاسم",
          textFormName: "اسم صاحب الفيزا",
        ),
        const BottomSheetTextFormItem(
          name: "رقم الفيزا",
          textFormName: "xxxx xxxx xxxx xxxx",
        ),
        Row(
          children: [
            const Expanded(
              child: BottomSheetTextFormItem(
                name: "CCV code",
                textFormName: "xxx",
              ),
            ),
            SizedBox(width: 10.h),
            const Expanded(
              child: BottomSheetTextFormItem(
                name: "تاريخ الانتهاء",
                textFormName: "MM/YY",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
