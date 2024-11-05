import 'package:arm/core/utils/custom_navigation.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../../../users_ feature/presentation/pages/get_users_view.dart';
import '../../data/models/get_my_business_data_model.dart';
import '../manager/delete_business_controller/delete_business_cubit.dart';
import '../manager/get_my_business_controller/get_my_business_cubit.dart';
import '../manager/get_my_business_controller/get_my_business_state.dart';

class MyPlacesView extends StatefulWidget {
  const MyPlacesView({
    super.key,
  });
  @override
  State<MyPlacesView> createState() => _MyPlacesViewState();
}

class _MyPlacesViewState extends State<MyPlacesView> {
  @override
  void initState() {
    BlocProvider.of<GetMyBusinessCubit>(context).getMyBusiness();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('اماكني'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: "اسم المكان",
              prefixIcon: const Icon(Icons.home),
              textInputType: TextInputType.text,
              controller:
                  BlocProvider.of<GetMyBusinessCubit>(context).searchKeyword,
              onChanged: (p0) async{
                await   BlocProvider.of<GetMyBusinessCubit>(context).getMyBusiness();
                return null;
              },
            ),
            BlocBuilder<GetMyBusinessCubit, GetMyBusinessState>(
              builder: (context, state) {
                if (state is GetMyBusinessSuccessState) {
                  List<GetMyBusinessDataModel> items = (state.model.data)
                      .where((element) => element.deleted == false)
                      .toList();
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: SizedBox(
                          height: 80.h,
                          width: 70.w,
                          child: customCachedImage(items[index].logo),
                        ),
                        title: Text(
                          items[index].name,
                          style: getMediumStyle(fontSize: 16),
                          textAlign: TextAlign.right,
                        ),
                        subtitle: Text(
                          items[index].description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        leading: PopupMenuButton(
                          itemBuilder: (context) => [
                            PopupMenuItem(
                                child: const Text('نقل الملكية'),
                                onTap: () {
                                  context.push(GetUsersView(
                                    businessId: items[index].id.toString(),
                                  ));
                                }),
                            PopupMenuItem(
                              child: const Text('حذف'),
                              onTap: () {
                                customDialog(
                                  context: context,
                                  title: 'تحذير',
                                  btnOkOnPress: () async {
                                    context.pop();
                                    await BlocProvider.of<DeleteBusinessCubit>(
                                            context)
                                        .deleteBusiness(
                                      context,
                                      items[index].id,
                                    );
                                  },
                                  dialogType: DialogType.warning,
                                  description: 'هل تريد حذف هذا المكان؟',
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 15.h),
                  );
                } else if (state is GetMyBusinessFailureState) {
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
