import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/recourses/color_manager/color_manager.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });
  final Function(int?)? onTap;
  final int? currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      backgroundColor: ColorManager.scaffoldBackGroundColor,
      currentIndex: currentIndex!,
      onTap: onTap,
      iconSize: 20,
      unselectedItemColor: ColorManager.grey,
      selectedFontSize: 16,
      selectedItemColor: ColorManager.secondaryColor,
      items:   const [
        BottomNavigationBarItem(
          label: "التحديثات",
          icon: Icon(FontAwesomeIcons.envelopesBulk),
        ),
        BottomNavigationBarItem(
          label: "النتائج",
          icon: Icon(FontAwesomeIcons.squarePollVertical),
        ),
        BottomNavigationBarItem(
          label: "المقررات",
          icon: Icon(Icons.menu_book),
        ),
        BottomNavigationBarItem(
          label: "الرئيسية",
          icon: Icon(FontAwesomeIcons.house),
        ),
      ],
    );
  }
}
