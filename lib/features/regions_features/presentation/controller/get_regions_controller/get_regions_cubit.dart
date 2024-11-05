import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/widgets/custom_toast.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../data/models/region_data_model.dart';
import '../../../data/models/regions_model.dart';
import '../../../data/repo/regions_repo.dart';
import 'get_regions_state.dart';

class GetRegionsCubit extends Cubit<GetRegionsState> {
  final RegionRepo regionRepo;

  GetRegionsCubit(this.regionRepo) : super(GetRegionsInitialState());

  RegionDataModel? chosenRegion;

  List<RegionDataModel> regions = [];
  List<int> selectedRegions = [];

  Future<void> getRegions({int? chosenId}) async {
    emit(GetRegionsLoadingState());
    regions.clear();

    final Either<Failure, RegionsModel> data = await regionRepo.getRegions();

    data.fold(
      (l) async {
        await customToast(l.errorMessage, ToastStatus.error);
        emit(GetRegionsFailureState(l.errorMessage));
      },
      (r) async {
        //await customToast(r.message, ToastStatus.success);

        Iterable<RegionDataModel> allRegions = r.data;
        if (chosenId != null) {
          allRegions =
              allRegions.where((element) => element.cityId == chosenId);
        }

        regions.addAll(allRegions);
        emit(GetRegionsSuccessState(r));
      },
    );
  }

  void chooseRegion(RegionDataModel region) {
    chosenRegion = region;
    emit(GetRegionsSelectState());
  }

  addRegion(RegionDataModel chosenRegions) {
    selectedRegions.add(chosenRegions.id);
    emit(GetRegionsSelectState());

  }
  Future<void> saveDataToStorage(String name, int id) async {
    await SecureStorage.write('regionName', name);
    await SecureStorage.write('regionId', id.toString());
  }
  Future<void> selectRegion(BuildContext context,RegionDataModel model) async {

    chosenRegion = model;
    emit(GetRegionsSelectState());

    int? regionId = model.id;

    String? region = model.name;
    await saveDataToStorage(region, regionId);


  }

}
