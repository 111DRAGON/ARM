import 'package:flutter/material.dart';
import '../recourses/color_manager/color_manager.dart';

customBoxShadow(){
  return [
    const BoxShadow(color: ColorManager.secondaryColor,blurRadius: 10,offset: Offset(5, 5),),
  ];
}