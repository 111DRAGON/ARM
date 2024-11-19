import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/features/activate_feature/presentation/manager/activate_view_cubit.dart';
import 'package:students_college_system/features/activate_feature/presentation/widgets/acivate_vew/activate_button_card.dart';

class ActivateViewButtonRow extends StatelessWidget {
  const ActivateViewButtonRow({super.key});

  @override
  Widget build(BuildContext context) {
    ActivateViewCubit cubit = BlocProvider.of<ActivateViewCubit>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ActivateButtonCard(
          title: "المصروفات",
          onTap: () {
            cubit.changePageNumIndex(2);
          },
        ),
        ActivateButtonCard(
          title: "المقررات",
          onTap: () {
            cubit.changePageNumIndex(1);
          },
        ),
        ActivateButtonCard(
          title: "الامتحانات",
          onTap: () {
            cubit.changePageNumIndex(0);
          },
        ),
      ],
    );
  }
}
