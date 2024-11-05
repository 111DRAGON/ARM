import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../manager/get_activation_announcement_licence/get_activation_announcement_licence_cubit.dart';
import '../manager/get_activation_announcement_licence/get_activation_announcement_licence_state.dart';
import '../widgets/get_activation_announcements_card.dart';

class GetActivationAnnouncementsView extends StatefulWidget {
  const GetActivationAnnouncementsView({super.key,});
  @override
  State<GetActivationAnnouncementsView> createState() =>
      _GetActivationAnnouncementsViewState();
}

class _GetActivationAnnouncementsViewState
    extends State<GetActivationAnnouncementsView> {
  @override
  void initState() {
    BlocProvider.of<GetActivationAnnouncementLicencesCubit>(context)
        .getGetActivationAnnouncementLicence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("فتح جميع الاعلانات"),
      body: BlocBuilder<GetActivationAnnouncementLicencesCubit,
          GetActivationAnnouncementLicenceState>(
        builder: (context, state) {
          if (state is GetActivationAnnouncementLicenceSuccessState) {
          //  List sortedItems = state.model.data .where((element) => element.announcementBlocked == false).toList();
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return GetActivationAnnouncementCard(
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
          } else if (state is GetActivationAnnouncementLicenceFailureState) {
            return FailureState(state.errorMessage);
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
