import 'package:arm/core/models/get_pending_approval%20_body.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/dio_exception_handler.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/storage/secure_storage.dart';
import '../models/get_activation_announcement_licence_model.dart';

class GetActivationAnnouncementLicencesRepo {
  final ApiService apiService;

  GetActivationAnnouncementLicencesRepo(this.apiService);

  Future<Either<Failure, GetActivationAnnouncementLicencesModel>>
      getActivationAnnouncementLicences(GetPendingApprovalBody body) async {
    try {
      final String? token = await SecureStorage.read('token');
      Response response = await apiService.dio.post(
        ApiConstants.getActivationAnnouncementLicences,
        data: body.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(response.data);
      GetActivationAnnouncementLicencesModel model =
          GetActivationAnnouncementLicencesModel.fromJson(response.data);
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
