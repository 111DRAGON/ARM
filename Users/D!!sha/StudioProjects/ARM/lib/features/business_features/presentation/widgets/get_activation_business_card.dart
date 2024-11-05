import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/widgets/custom_box_shadow.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';

class GetActivationBusinessCard extends StatelessWidget {
  const GetActivationBusinessCard(
      {super.key,
      required this.image,
      required this.id,
      required this.onTap,
      required this.name,
      required this.phone, required this.regionName,});
  final String? image;
  final String phone;
  final String name;
  final String regionName;
  final int id;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * .40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: customBoxShadow(),
          color: ColorManager.white,
        ),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * .25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r)),
                  boxShadow: customBoxShadow(),
                  color: ColorManager.white,
                  image: DecorationImage(
                      image: NetworkImage(image!), fit: BoxFit.fill),
                )),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: getMediumStyle(),
                ),
                Text(
                  "إسم المكان",
                  style: getMediumStyle(),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  phone,
                  style: getMediumStyle(),
                ),
                Text(
                  "رقم هاتف صاحب المكان",
                  style: getMediumStyle(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  regionName,
                  style: getMediumStyle(),
                ),
                Text(
                  "المنطقه",
                  style: getMediumStyle(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
