import 'package:flutter/material.dart';

import '../color_manager/color_manager.dart';
import '../styles_manger/styles_manager.dart';


ThemeData getAppTheme() {
  return ThemeData(
    drawerTheme: const DrawerThemeData(backgroundColor: ColorManager.white),
    primaryColor: ColorManager.primary,

    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      iconTheme: const IconThemeData(

        color: ColorManager.primary,

        size: 26,
      ),
      color: ColorManager.scaffoldBackgroundColor,
      shadowColor: ColorManager.shadowColor,
      elevation: 2,
      titleTextStyle: getRegularStyle(
        color: ColorManager.primary,
        fontSize: 16,
      ),
    ),
  );
}
