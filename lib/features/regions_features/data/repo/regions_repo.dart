import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/api/api_constants.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/failure.dart';
import '../models/regions_model.dart';


class RegionRepo {
  ApiService apiService;

  RegionRepo(this.apiService);

  Future<Either<Failure, RegionsModel>> getRegions() async {
    try {
      Response response = await apiService.dio.get(ApiConstants.getRegions);
      RegionsModel model = RegionsModel.fromJson(response.data);
      return Right(model);
    } on DioException catch (ex) {
      return Left(Failure(dioExceptionHandler(ex)));
    } catch (ex) {
      return Left(
        Failure(
          ex.toString(),
        ),
      );
    }
  }


}
