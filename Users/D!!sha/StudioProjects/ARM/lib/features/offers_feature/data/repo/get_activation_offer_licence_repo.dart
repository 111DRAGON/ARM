import 'package:arm/core/models/get_pending_approval%20_body.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/dio_exception_handler.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/storage/secure_storage.dart';
import '../models/get_activation_offer_licence_model.dart';

class GetActivationOfferLicencesRepo {
  final ApiService apiService;

  GetActivationOfferLicencesRepo(this.apiService);

  Future<Either<Failure, GetActivationOfferLicencesModel>>
      getActivationOfferLicences(GetPendingApprovalBody  body) async {
    try {
      final String? token = await SecureStorage.read('token');
      Response response = await apiService.dio.post(
        ApiConstants.getActivationOfferLicences,
        data:  body.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      GetActivationOfferLicencesModel model =
          GetActivationOfferLicencesModel.fromJson(response.data);
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
