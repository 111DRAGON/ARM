import 'package:flutter/material.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';

import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/features/results_feature/presentation/widgets/result_details/result_details_card.dart';

import '../../../../core/utils/custom_gradient.dart';

class ResultsDetailsView extends StatelessWidget {
  const ResultsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "الترم الاول", context: context),
      body: Container(
          decoration:
               BoxDecoration(gradient: customGradient()),
          child: ListView.builder(
            itemBuilder: (context, index) => const ResultDetailsCard(),
            itemCount: 9,
          )),
    );
  }
}
