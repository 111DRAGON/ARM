import 'package:flutter/material.dart';

import '../recourses/color_manager/color_manager.dart';

customBoxShadow() {
  return [
    const BoxShadow(
      color: ColorManager.shadowColor,
      blurRadius: 5,
      offset: Offset(2, 3),
    ),
  ];
}
