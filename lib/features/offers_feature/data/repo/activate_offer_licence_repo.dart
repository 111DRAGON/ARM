import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/api/api_constants.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/api/dio_exception_handler.dart';
import '../../../../../core/api/failure.dart';
import '../../../../../core/storage/secure_storage.dart';
import '../models/activate_offer_licence_model.dart';


class ActivateOfferLicenceRepo {
  final ApiService apiService;
  ActivateOfferLicenceRepo(this.apiService);

  Future<Either<Failure, ActivateOfferLicenceModel>> activateOfferLicence(int id,) async {
    try {
      final String? token = await SecureStorage.read('token');

      Response response = await apiService.dio.put(
        ApiConstants.activateOfferLicence(id),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      ActivateOfferLicenceModel data =
      ActivateOfferLicenceModel.fromJson(response.data);

      return Right(data);
    } on DioException catch (ex) {
      return Left(
        Failure(
          dioExceptionHandler(ex),
        ),
      );
    } catch (ex) {
      return Left(
        Failure(
          ex.toString(),
        ),
      );
    }
  }
}
