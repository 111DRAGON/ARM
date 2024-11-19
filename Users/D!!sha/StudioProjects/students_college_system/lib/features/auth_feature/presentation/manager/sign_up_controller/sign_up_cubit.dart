import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/features/auth_feature/presentation/manager/sign_up_controller/sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  late TextEditingController emailController;

  SignUpCubit() : super(SignUpInitialState()) {
    emailController = TextEditingController();
  }

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> register(int regionId, BuildContext context) async {
    emit(SignUpLoadingState());
  }

  @override
  Future<void> close() {
    emailController.dispose();

    return super.close();
  }
}
