import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/core/widgets/custom_button.dart';
import 'package:students_college_system/core/widgets/custom_dialog.dart';
import 'package:students_college_system/features/courses_feature/presentation/pages/successfully_registered_subjects.dart';

import '../widgets/registration_courses/custom_registration_courses_button.dart';

class RegistrationCoursesView extends StatelessWidget {
  const RegistrationCoursesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(text: "تسجيل المواد", context: context),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    const CustomRegistrationCoursesButton(),
                itemCount: 8,
              ),
            ),
            CustomButton(
                text: "تسجيل",
                onPressed: () {
                  customDialog(
                    context: context,
                    title: '''اجمالي عدد الساعات التي سجلتها
                   18 Hours ''',
                    btnOkOnPress: () {
                      context.push(const SuccessfullyRegisteredSubjects());
                    },
                    btnCancelText: "إلغاء",
                    btnOkText: "ارسال",
                    dialogType: DialogType.success,
                  );
                }),
            SizedBox(height: 20.h),
          ],
        ));
  }
}
