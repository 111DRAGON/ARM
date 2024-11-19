import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/recourses/image_manager/image_manager.dart';
import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  late PageController pageController;

  OnBoardingCubit() : super(OnBoardingInitialState()) {
    pageController = PageController(initialPage: 0);
  }

  int index = 0;

  final List<Onboard> data = [
    Onboard(
      title: 'كل ما تحتاجه كطالب في مكان واحد',
      supTitle:
      'من الوصول للمحاضرات والمراجع إلى التقديم الإلكتروني للواجبات، نقدم لك كل الأدوات التي تدعم مسيرتك الأكاديمية بكل كفاءة وراحة.',
    ),
    Onboard(
      title: 'كن على اطلاع دائم بآخر المستجدات الأكاديمية',
      supTitle:
      "احصل على إشعارات فورية لأحدث المحاضرات والتحديثات الخاصة بكل مقرر، لتبقى دائمًا في المقدمة وفي توقيتك المناسب.",
    ),
    Onboard(
      title: 'كل شيء في متناول يدك، بسهولة',
      supTitle:
      "اكتشف تجربة جديدة حيث يمكنك تسجيل حضورك، متابعة درجاتك، واستعراض جداولك الدراسية بسلاسة من خلال منصتنا المتكاملة.",
    ), Onboard(
      title: 'كل شيء في متناول يدك، بسهولة',
      supTitle:
      "اكتشف تجربة جديدة حيث يمكنك تسجيل حضورك، متابعة درجاتك، واستعراض جداولك الدراسية بسلاسة من خلال منصتنا المتكاملة.",
    ),
  ];

  List<String> images = [
    ImageManager.onBoarding1Image,
    ImageManager.onBoarding3Image,
    ImageManager.onBoarding2Image,
    ImageManager.onBoarding4Image,
  ];

  void onPageChanged(int value) {
    index = value;
    emit(OnBoardingChangeState());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
class Onboard {
  final String  title, supTitle;

  Onboard({required this.title, required this.supTitle});
}