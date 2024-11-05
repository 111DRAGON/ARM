import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../data/models/cities_model.dart';
import '../../../data/models/city_data_model.dart';
import '../../../data/repo/city_repo.dart';
import 'get_cities_state.dart';

class GetCitiesCubit extends Cubit<GetCitiesState> {
  final CityRepo cityRepo;

  GetCitiesCubit(this.cityRepo) : super(GetCitiesInitialState());

  CityDataModel? chosenItem;

  List<CityDataModel> models = [];

  Future<void> getCities() async {
    emit(GetCitiesLoadingState());

    models.clear();

    final Either<Failure, CitiesModel> data = await cityRepo.getCities();

    data.fold(
          (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(
          GetCitiesFailureState(l.errorMessage),
        );
      },
          (r) async {
            models.addAll(r.data);
        //await customToast(r.message, ToastStatus.success);
        emit(
          GetCitiesSuccessState()
        );
      },
    );
  }

  void chooseCity(CityDataModel model){
    chosenItem  = model;
    emit(GetCitiesChangedState());
  }
}
