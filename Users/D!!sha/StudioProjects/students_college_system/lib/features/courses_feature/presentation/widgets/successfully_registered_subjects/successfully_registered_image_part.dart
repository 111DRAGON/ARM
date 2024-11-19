import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/image_manager/image_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class SuccessfullyRegisteredImagePart extends StatelessWidget {
  const SuccessfullyRegisteredImagePart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        Image.asset(
          ImageManager.youngManImage,
          height: MediaQuery.of(context).size.height * .25,
        ),
        Text(
          "تم تسجيل المواد بنجاح",
          style: getBoldStyle(),
        ),
      ],
    );
  }
}
