import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/loading_state.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/failure_state.dart';
import '../manager/get_users_cubit.dart';
import '../manager/get_users_state.dart';
import '../widgets/get_users_card.dart';

class GetUsersView extends StatefulWidget {
  const GetUsersView({super.key, required this.businessId});
  final String businessId;
  @override
  State<GetUsersView> createState() => _GetUsersViewState();
}

class _GetUsersViewState extends State<GetUsersView> {
  @override
  void initState() {
    BlocProvider.of<GetUsersCubit>(context).getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("المستخدمين"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
                hintText: "الاسم أو رقم الهاتف",
                prefixIcon: const Icon(Icons.home),
                textInputType: TextInputType.text,
                controller:
                    BlocProvider.of<GetUsersCubit>(context).searchKeyword, onChanged: (p0) async{
              await   BlocProvider.of<GetUsersCubit>(context).getUsers();
              return null;
            },),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<GetUsersCubit, GetUsersState>(
              builder: (context, state) {
                if (state is GetUsersSuccessState) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GetUsersCard(
                        model: state.model.data[index],
                        userId: state.model.data[index].id.toString(),
                        businessId: widget.businessId,
                      );
                    },
                    itemCount: state.model.data.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10.h);
                    },
                  );
                } else if (state is GetUsersFailureState) {
                  return FailureState(state.errorMessage);
                } else {
                  return const LoadingState();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
