import 'package:flutter/material.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';



class AuthCustomAppBar extends StatelessWidget {
  const AuthCustomAppBar(this.title,{super.key});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        Text(
          title,
          style: getRegularStyle(
            fontSize: 16,
            color: ColorManager.primary,
          ),
        ),
      ],
    );
  }
}
