import 'package:flutter/material.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class ResultInfoRow extends StatelessWidget {
  const ResultInfoRow({super.key, required this.body, required this.title,});
  final String body;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          Text(
            title,
            style: getMediumStyle(color:ColorManager.black,fontSize: 12),
          ),

          Text(
            ":  $body",
            style: getBoldStyle(color: ColorManager.secondaryColor,fontSize: 12),
          ),

        ],
      ),
    );
  }
}
