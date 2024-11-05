import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../../../core/api/failure.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_service.dart';
import '../models/cities_model.dart';

class CityRepo {
  final ApiService apiService;

  CityRepo(this.apiService);

  Future<Either<Failure, CitiesModel>> getCities() async {
    try {
      Response response =
      await apiService.dio.get(ApiConstants.getCities);
      CitiesModel model = CitiesModel.fromJson(response.data);
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
