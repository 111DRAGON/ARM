import 'package:flutter/material.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class SuccessfullyRegisteredRow extends StatelessWidget {
  const SuccessfullyRegisteredRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Web information system",
            style: getSemiBoldStyle(),
          ),
          Text(
            "1SE14  /  3h",
            style: getRegularStyle(
              color: ColorManager.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
