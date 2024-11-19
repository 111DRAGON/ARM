import 'package:flutter/cupertino.dart';

import '../../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';

class ActivatePaymentRow extends StatelessWidget {
  const ActivatePaymentRow({super.key, required this.icon, required this.title, required this.value});
  final IconData icon;
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorManager.primary,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: getMediumStyle(fontSize: 12),
          ),
          const Spacer(),
          Text(
            value,
            style: getRegularStyle(color: ColorManager.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
