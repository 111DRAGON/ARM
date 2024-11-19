import 'package:flutter/material.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import '../widgets/subjects/subjects_drop_list_card.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(
          text: "المواد الدراسية",
          context: context,
        ),
        body: ListView.builder(
          itemCount: 9,
          itemBuilder: (context, index) {
            return const SubjectsDropListCard();
          },
        ));
  }
}
