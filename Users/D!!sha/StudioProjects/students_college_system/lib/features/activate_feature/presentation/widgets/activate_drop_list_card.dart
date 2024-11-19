import 'package:flutter/material.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';

class ActivateDropListCard extends StatelessWidget {
  const ActivateDropListCard({
    super.key,
    required this.title,
    this.titleColor,
    this.bodyColor,
    this.borderColor,
    this.leading,
    this.body,
    this.trailing,
  });
  final String title;
  final Color? titleColor;
  final Color? bodyColor;
  final Color? borderColor;
  final Widget? leading;
  final Widget? body;
  final Widget? trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: borderColor ?? ColorManager.lightGrey, width: 2.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
          backgroundColor: bodyColor ?? ColorManager.white,
          collapsedBackgroundColor: titleColor ?? ColorManager.white,
          title: Text(
            title,
            style: getMediumStyle(),
          ),
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: leading ?? const Icon(Icons.circle, size: 8),
                      title: body ?? const Text('C++ Fundamental'),
                      trailing: trailing ?? const Text('1SE14 / 3H'),
                    );
                  },
                  itemCount: 4,
                )),
          ],
        ),
      ),
    );
  }
}
