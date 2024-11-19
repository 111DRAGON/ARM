import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/features/books_feature/presentation/widgets/choosing_year/choosing_year_details_part.dart';
import '../widgets/choosing_year/choosing_year_buttons_part.dart';

class ChoosingYearView extends StatelessWidget {
  const ChoosingYearView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(text: "الكتب الدراسية", context: context),
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: const Column(
          children: [
            ChoosingYearDetailsPart(),
            ChoosingYearButtonsPart(),
          ],
        ),
      ),
    );
  }
}
