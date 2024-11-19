import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/activate_drop_list_card.dart';

class ActivateCoursesBody extends StatelessWidget {
  const ActivateCoursesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .62,
      child: ListView.separated(shrinkWrap: true,physics: const BouncingScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return const ActivateDropListCard(
            title: "المواد المسجلة للتيرم الاول",
          );
        }, separatorBuilder: (BuildContext context, int index) { return SizedBox(height: 10.h); },
      ),
    );
  }
}
