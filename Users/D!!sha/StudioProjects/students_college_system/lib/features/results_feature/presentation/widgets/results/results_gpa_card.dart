import 'package:flutter/material.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class ResultsGpaCard extends StatelessWidget {
  const ResultsGpaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Align(alignment: Alignment.centerLeft,
      child: Container(
        height: MediaQuery.of(context).size.height*.09,
        width:  MediaQuery.of(context).size.width*.18,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.grey.shade500,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(60),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "GPA",
              style: getBoldStyle(color: ColorManager.grey),
            ),
            Text(
              "3.6",
              style:
              getBoldStyle(color: ColorManager.black, fontSize: 26),
            )
          ],
        ),
      ),
    );
  }
}
