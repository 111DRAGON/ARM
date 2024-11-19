import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/features/courses_feature/presentation/widgets/successfully_registered_subjects/successfully_registered_card.dart';
import 'package:students_college_system/features/courses_feature/presentation/widgets/successfully_registered_subjects/successfully_registered_image_part.dart';


class SuccessfullyRegisteredSubjects extends StatelessWidget {
  const SuccessfullyRegisteredSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SuccessfullyRegisteredImagePart(),
              SizedBox(height: 40.h),
              const SuccessfullyRegisteredCard(),
            ],
          ),
        ),
      ),
    );
  }
}
