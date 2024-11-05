import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../controller/get_activation_offer_licence/get_activation_offer_licence_cubit.dart';
import '../controller/get_activation_offer_licence/get_activation_offer_licence_state.dart';
import '../widgets/get_activation_offer_card.dart';

class GetActivationOfferView extends StatefulWidget {
  const GetActivationOfferView({super.key, });
  @override
  State<GetActivationOfferView> createState() => _GetActivationOfferViewState();
}

class _GetActivationOfferViewState extends State<GetActivationOfferView> {
  @override
  void initState() {
    BlocProvider.of<GetActivationOfferLicencesCubit>(context)
        .getGetActivationOfferLicence();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("فتح جميع العروض"),
      body: BlocBuilder<GetActivationOfferLicencesCubit,
          GetActivationOfferLicenceState>(
        builder: (context, state) {
          if (state is GetActivationOfferLicenceSuccessState) {
            // List sortedItems = state.model.data .where((element) => element.offerBlocked == false).toList();

            return Padding(
              padding: const EdgeInsets.all(20),
              child: ListView.separated(
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    return GetActivationOfferCard(
                      model:state.model.data[index],
                      id: state.model.data[index].id,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20.h,
                    );
                  },
                  itemCount:state.model.data.length),
            );
          } else if (state is GetActivationOfferLicenceFailureState) {
            return FailureState(state.errorMessage);
          } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
