import 'package:flutter/material.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/core/widgets/custom_confirm_dialog.dart';
import 'package:students_college_system/features/home_service_feature/presentation/pages/home_services_view.dart';

import '../widgets/exam_button_row.dart';
import '../widgets/mcq_exam/mcq_exam_answer_part.dart';

class MCQExamView extends StatelessWidget {
  const MCQExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "السؤال الثانى", context: context),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const MCQExamAnswerPart(),
            ExamButtonRow(
              nextOnPressedKey: () {
                customConfirmDialog(
                  context: context,
                  title: '! تم حل الامتحان بنجاح  ',
                  btnOkOnPress: () {
                    context.push(const HomeServicesView());
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
