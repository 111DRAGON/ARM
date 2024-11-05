import 'package:flutter/material.dart';
import '../recourses/styles_manger/styles_manager.dart';

AppBar customAppBar(String text) {
  return AppBar(
    elevation: 0,
    title: Text(
      text,
      style: getRegularStyle(
        fontSize: 22,
      ),
    ),
  );
}
