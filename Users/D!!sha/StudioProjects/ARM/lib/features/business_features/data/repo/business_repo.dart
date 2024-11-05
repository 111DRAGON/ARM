import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/api/dio_exception_handler.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/storage/secure_storage.dart';

class BusinessRepo {
  final ApiService apiService;
  BusinessRepo(this.apiService);


  Future<Either<Failure, String>> deleteBusiness(int id) async {
    try {
      final String? token = await SecureStorage.read('token');

      await apiService.dio.delete(
        ApiConstants.deleteBusiness(id),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      return Right('تم الحذف بنجاح');
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
