import 'package:flutter/material.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/features/exam_feature/presentation/pages/mcq_exam_view.dart';
import 'package:students_college_system/features/exam_feature/presentation/widgets/written_exam/written_exam_answer_part.dart';

import '../widgets/exam_button_row.dart';

class WrittenExamView extends StatelessWidget {
  const WrittenExamView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "السؤال الأول", context: context),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const WrittenExamAnswerPart(),
            ExamButtonRow(nextOnPressedKey: () {context.push(const MCQExamView());  },),
          ],
        ),
      ),
    );
  }
}
