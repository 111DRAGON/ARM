import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/storage/secure_storage.dart';
import '../../../../core/api/dio_exception_handler.dart';
import '../../../../core/api/failure.dart';

class ActiveBusinessLicenceRepo {
  final ApiService apiService;
  ActiveBusinessLicenceRepo(this.apiService);

  Future<Either<Failure, String>> activeBusinessLicence(
    int id,
  ) async {
    try {
      final String? token = await SecureStorage.read('token');

      Response response = await apiService.dio.put(
        ApiConstants.activeBusinessLicence(id),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return const Right('تم القبول بنجاح');
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
