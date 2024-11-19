import 'package:flutter/material.dart';
import 'package:students_college_system/core/utils/custom_navigation.dart';
import 'package:students_college_system/core/widgets/custom_app_bar.dart';
import 'package:students_college_system/features/courses_feature/presentation/pages/registration_courses_view.dart';
import 'package:students_college_system/features/courses_feature/presentation/pages/subjects_view.dart';
import '../widgets/courses/courses_info_card.dart';
import '../widgets/courses/courses_side_bar.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({super.key});
  @override
  Widget build(BuildContext context) {

    List<CoursesInfoCard> coursesInfoCards = [
      CoursesInfoCard(
        title: 'المواد الدراسية',
        color: Colors.amber,
        icon: Icons.book,
        items: const [
          'عدد ساعات المواد الدراسية',
          'اسماء الدكاتره والمحاضرين',
          'اسم المادة',
          'كود المادة',
        ],
        onTap: (){context.push(const SubjectsView());},
      ),
       CoursesInfoCard(
        title: 'الساعات المعتمدة',
        color:Colors.blueAccent,
        icon: Icons.hourglass_bottom,
        items: const [
          'الساعات المطلوبة للتخرج',
          'عدد الساعات التي تم اجتيازها',
          'عدد الساعات المتبقية',
          'قسم عدد الساعات على كل قسم',
        ], onTap: () {  },
      ),
      CoursesInfoCard(
        title: 'تسجيل المواد',
        color: Colors.green,
        icon: Icons.bookmarks_outlined,
        items: const [
          'المواد المتاحة للتسجيل',
          'المواد التي تم تسجيلها',
          'تأكيد التسجيل',
          'طباعة التسجيل',
        ], onTap: () { context.push(const RegistrationCoursesView()); },
      ),
    ];
    return Scaffold(appBar: customAppBar(text: "المقررات", context: context),
      body: Center(
        child: SingleChildScrollView(
          child: Column(

            children: [
              Row(
                children: [
                  Expanded(
                    child: ListView.builder(shrinkWrap: true,
                      itemCount: coursesInfoCards.length,
                      itemBuilder: (context, index) {
                        return CoursesInfoCard(
                          title: coursesInfoCards[index].title,
                          color: coursesInfoCards[index].color,
                          icon: coursesInfoCards[index].icon,
                          items:  coursesInfoCards[index].items, onTap: coursesInfoCards[index].onTap,
                        );
                      },
                    ),
                  ),
                  const Column(
                    children: [
                      SideBar(),
                      SideBar(),
                      SideBar(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
