import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students_college_system/features/courses_feature/presentation/pages/courses_view.dart';
import 'package:students_college_system/features/home_feature/presentation/pages/home_view.dart';

import '../../../activate_feature/presentation/pages/activate_view.dart';
import '../../../results_feature/presentation/pages/results_view.dart';
part 'home_service_state.dart';

class HomeServiceCubit extends Cubit<HomeServiceState> {
  HomeServiceCubit() : super(HomeServiceInitial());
  var currentIndex = 3;
  changeCurrentIndex(index) {
    currentIndex = index;
    emit(NavigationState());
  }

  List screens = [
    const ActivateView(),
    const ResultsView(),
    const CoursesView(),
    const HomeView(),
  ];
}
