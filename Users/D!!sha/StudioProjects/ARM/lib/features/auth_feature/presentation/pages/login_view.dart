import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/services/service_locator.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/loading_state.dart';
import '../controller/login_controller/login_cubit.dart';
import '../controller/login_controller/login_state.dart';
import '../widgets/auth_custom_appBar.dart';
import '../widgets/back_ground_image.dart';
import '../widgets/login_page_text_field_section.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  void dispose() {
    super.dispose();
    BlocProvider.of<LoginCubit>(context).dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => sl.get<LoginCubit>(),
  child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            const BackGroundImage(),
            Positioned(
              top: MediaQuery.of(context).size.height * .37,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const LoginPageTextFieldSection(),
                      BlocBuilder<LoginCubit,LoginState>(
                        builder: (context, state) {
                          if(state is LoginLoadingState){
                            return const LoadingState();
                          }
                          else{
                            return CustomButton(
                              text: "تسجيل دخول",
                              onPressed: () async{
                                if(BlocProvider.of<LoginCubit>(context).key.currentState!.validate()){
                                  await BlocProvider.of<LoginCubit>(context).login(context);
                                }

                              },);

                        }},),
                      SizedBox(
                        height: 10.h
                      ),

                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              child: const AuthCustomAppBar('تسجيل الدخول'),
            )
          ],
        ),
      ),
    ),
);
  }
}
