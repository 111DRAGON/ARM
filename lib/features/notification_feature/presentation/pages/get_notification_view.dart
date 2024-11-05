import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../manager/get_activation_notification_licence/get_activation_notification_licence_cubit.dart';
import '../manager/get_activation_notification_licence/get_activation_notification_licence_state.dart';
import '../widgets/get_activation_notification_card.dart';

class GetActivationNotificationView extends StatefulWidget {
  const GetActivationNotificationView({super.key,});
  @override
  State<GetActivationNotificationView> createState() =>
      _GetActivationNotificationViewState();
}

class _GetActivationNotificationViewState
    extends State<GetActivationNotificationView> {
  @override
  void initState() {
    BlocProvider.of<GetActivationNotificationLicencesCubit>(context)
        .getGetActivationNotificationLicence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("فتح جميع الاشعارات"),
      body: BlocBuilder<GetActivationNotificationLicencesCubit,
          GetActivationNotificationLicenceState>(
        builder: (context, state) {
          if (state is GetActivationNotificationLicenceSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return GetActivationNotificationCard(
                      model: state.model.data[index],
                      id: state.model.data[index].id,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount: state.model.data.length),
            );
          } else if (state is GetActivationNotificationLicenceFailureState) {
            return FailureState(state.errorMessage);
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
