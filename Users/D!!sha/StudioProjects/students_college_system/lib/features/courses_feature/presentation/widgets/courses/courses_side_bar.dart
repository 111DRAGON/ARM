import 'package:flutter/material.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          const Icon(
            Icons.expand_circle_down_rounded,
            color: ColorManager.black,
            size: 16,
          ),
          const SizedBox(height: 5),
          Container(
            height: MediaQuery.of(context).size.height*.16,
            width: 5,
            color: ColorManager.secondaryColor,
          ),
        ],
      ),
    );
  }
}
