import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/storage/secure_storage.dart';
import '../../../../core/api/dio_exception_handler.dart';
import '../../../../core/api/failure.dart';

class ActiveBusinessRepo {
  final ApiService apiService;
  ActiveBusinessRepo(this.apiService);

  Future<Either<Failure,String>> activeBusiness(int id,) async {
    try{
      final String? token = await SecureStorage.read('token');

      await apiService.dio.put(
        ApiConstants.activeBusiness(id),

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
