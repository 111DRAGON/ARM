import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountsDetailsSectionTitle extends StatelessWidget {
  const AccountsDetailsSectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            indent: 20.w,
            endIndent: 20.w,
          ),
        ),
        Text(title),
        Expanded(
          child: Divider(
            indent: 20.w,
            endIndent: 20.w,
          ),
        ),
      ],
    );
  }
}
