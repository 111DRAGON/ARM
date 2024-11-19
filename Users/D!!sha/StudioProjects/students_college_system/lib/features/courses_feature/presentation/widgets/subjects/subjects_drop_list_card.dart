import 'package:flutter/material.dart';
import 'package:students_college_system/core/recourses/color_manager/color_manager.dart';
import 'package:students_college_system/core/recourses/styles_manger/styles_manager.dart';
import 'package:students_college_system/features/courses_feature/presentation/widgets/subjects/subjects_custom_row.dart';


class SubjectsDropListCard extends StatelessWidget {
  const SubjectsDropListCard({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color:  ColorManager.lightGrey, width: 2.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ExpansionTile(
            backgroundColor: ColorManager.primary,
            collapsedBackgroundColor: ColorManager.white,iconColor: ColorManager.black,
            title: Text(
              "Web information systems",
              style: getMediumStyle(),
            ),
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SubjectsCustomRow(
                      body: "Code",
                      title: "Is413",
                    ),
                    SubjectsCustomRow(
                      body: "Hours",
                      title: "3 hours",
                    ),
                    SubjectsCustomRow(
                      body: "Specialization",
                      title: "Medical information",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
