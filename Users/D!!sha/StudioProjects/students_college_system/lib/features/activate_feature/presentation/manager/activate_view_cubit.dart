
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/features/activate_feature/presentation/pages/activate_courses_body.dart';
import 'package:students_college_system/features/activate_feature/presentation/pages/activate_exams_body.dart';
import 'package:students_college_system/features/activate_feature/presentation/pages/activate_payment_body.dart';

part 'activate_view_state.dart';

class ActivateViewCubit extends Cubit<ActivateViewState> {
  ActivateViewCubit() : super(ActivateViewInitial());
  List<Widget> activateViewBody=[
    const ActivateExamsBody(),
    const ActivateCoursesBody(),
    const ActivatePaymentBody()
  ];
  int pageNum=0;
  changePageNumIndex(index) {
    pageNum = index;
    emit(NavigationState());
  }
}
