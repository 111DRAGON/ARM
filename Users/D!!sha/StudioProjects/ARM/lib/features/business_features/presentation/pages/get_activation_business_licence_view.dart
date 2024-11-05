import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/failure_state.dart';
import '../../../../../core/widgets/loading_state.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../manager/get_active_business_licence_controller/get_active_business_licence_cubit.dart';
import '../manager/get_active_business_licence_controller/get_active_business_licence_state.dart';
import '../widgets/get_activation_business_licence_card.dart';

class GetActivationBusinessLicenceView extends StatefulWidget {
  const GetActivationBusinessLicenceView({super.key, });
  @override
  State<GetActivationBusinessLicenceView> createState() =>
      _GetActivationBusinessLicenceViewState();
}

class _GetActivationBusinessLicenceViewState
    extends State<GetActivationBusinessLicenceView> {
  @override
  void initState() {
    BlocProvider.of<GetActivationBusinessLicenceCubit>(context)
        .getActivationBusinessLicence();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("الاماكن الجديدة"),
      body: BlocBuilder<GetActivationBusinessLicenceCubit,
          GetActivationBusinessLicenceState>(
        builder: (context, state) {
          if (state is GetActivationBusinessLicenceSuccessState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  return GetActivationBusinessLicenceCard(
                    name: state.model.data[index].business.name,
                    description: state.model.data[index].business.description,
                    address: state.model.data[index].business.address,
                    cost: state.model.data[index].plan.cost,
                    days: state.model.data[index].plan.days,
                    id: state.model.data[index].id,
                    image: state.model.data[index].business.logo,

                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: state.model.data.length,
              ),
            );
          } else if (state is GetActivationBusinessLicenceFailureState) {
            return FailureState(state.errorMessage);
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
