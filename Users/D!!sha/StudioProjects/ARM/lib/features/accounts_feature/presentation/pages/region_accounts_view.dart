import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/recourses/color_manager/color_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_toast.dart';
import '../../../../core/widgets/loading_state.dart';
import 'package:intl/intl.dart';
import '../manager/get_regions_month_accounts_controller/get_regions_month_accounts_cubit.dart';
import '../manager/get_regions_month_accounts_controller/get_regions_month_accounts_state.dart';

class RegionAccountsView extends StatelessWidget {
  const RegionAccountsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("حسابات المحافظات الشهريه"),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                  text: "إختر التاريخ",
                  backgroundColor: ColorManager.primary,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.parse("2020-11-11"),
                      lastDate: DateTime.parse("9999-11-11"),
                    ).then((value) {
                      BlocProvider.of<GetRegionsMonthAccountsCubit>(context).date =
                          DateFormat("yyyy-MM-dd").format(value!);
          
                    });
                  }),
              SizedBox(
                height: 20.h,
              ), BlocBuilder<GetRegionsMonthAccountsCubit, GetRegionsMonthAccountsState>(
                builder: (context, state) {
                  if (state is  GetRegionsMonthAccountsLoadingState) {
                    return const LoadingState();
                  } else {
                    return CustomButton(
                        text: " حسابات للمحافظه",
                        backgroundColor: Colors.red,
                        onPressed: () async {
                          String?date=BlocProvider.of<GetRegionsMonthAccountsCubit>(context).date;
                          if ( date ==null ) {
                            await customToast('برجاء إختيار تريخ',
                                ToastStatus.warning);
                          } else {
                            BlocProvider.of<GetRegionsMonthAccountsCubit>(context)
                                .getRegionsMonthAccounts(context, );
                          }
                        });
                  }
                },
              )
          
              ,
            ],
          ),
        ),
      ),
    );
  }
}
