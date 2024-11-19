import 'package:flutter/cupertino.dart';
import '../../../../../core/recourses/color_manager/color_manager.dart';
import 'choosing_exam_subject_card.dart';

class ChoosingExamSubjectsPart extends StatelessWidget {
  const ChoosingExamSubjectsPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: MediaQuery.of(context).size.height * .68,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(40),
          ),
          border: Border.all(
            color: CupertinoColors.lightBackgroundGray,
            width: 2.5,
          ),
        ),
        child:ListView.builder(itemBuilder: (context, index) => const ChoosingExamSubjectCard(),itemCount: 20,),
      ),
    );
  }
}
