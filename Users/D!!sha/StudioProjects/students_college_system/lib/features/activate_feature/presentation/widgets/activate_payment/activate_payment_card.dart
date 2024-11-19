import 'package:flutter/cupertino.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class ActivatePaymentCard extends StatelessWidget {
  const ActivatePaymentCard({super.key, required this.icon, required this.title, required this.value, this.iconColor});
  final IconData icon;
  final String title;
  final String value;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(padding: const EdgeInsetsDirectional.all(10),
        decoration: BoxDecoration(color: ColorManager.white,borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              value,
              style: getRegularStyle(color: ColorManager.grey, fontSize: 12),
            ),
            const Spacer(),
            Text(
              title,
              style: getMediumStyle(fontSize: 12),
            ),
        
            const SizedBox(
              width: 10,
            ),
            Icon(
              icon,
              color: iconColor??ColorManager.primary,
            ),
        
          ],
        ),
      ),
    );
  }
}
