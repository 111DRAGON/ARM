import 'package:arm/core/utils/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/failure_state.dart';
import '../../../../../core/widgets/loading_state.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../data/models/get_activation_business_data_model.dart';
import '../manager/get_activation_business_controller/get_activation_business_cubit.dart';
import '../manager/get_activation_business_controller/get_activation_business_state.dart';
import '../widgets/get_activation_business_card.dart';
import 'active_business_view.dart';

class GetActivationBusinessView extends StatefulWidget {
  const GetActivationBusinessView({super.key, });
  @override
  State<GetActivationBusinessView> createState() =>
      _GetActivationBusinessViewState();
}

class _GetActivationBusinessViewState extends State<GetActivationBusinessView> {
  @override
  void initState() {
    BlocProvider.of<GetActivationBusinessCubit>(context)
        .getActivationBusiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("الاماكن الجديدة"),
      body: BlocBuilder<GetActivationBusinessCubit, GetActivationBusinessState>(
        builder: (context, state) {
          if (state is GetActivationBusinessSuccessState) {

            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {

                    return GetActivationBusinessCard(
                      image: state.model.data[index].logo ,
                      name: state.model.data[index].name,
                      phone: state.model.data[index].owner.phoneNumber,
                      regionName: state.model.data[index].regionName,
                      id: state.model.data[index].id,
                      onTap: () {
                        context.push(ActiveBusinessView(
                          model: state.model.data[index],
                          id: state.model.data[index].id,
                          index: index,
                        ));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20.h);
                  },
                  itemCount: state.model.data.length,),
            );
          } else if (state is GetActivationBusinessFailureState) {
            return FailureState(state.errorMessage);
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
