import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/dio_exception_handler.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/storage/secure_storage.dart';
import '../models/get_users_body.dart';
import '../models/get_users_model.dart';

class GetUsersRepo {
  final ApiService apiService;
  GetUsersRepo(this.apiService);

  Future<Either<Failure, GetUsersModel>> getUsers(GetUsersBody body) async {
   try {
      final String? token = await SecureStorage.read('token');

      Response response = await apiService.dio.post(
        ApiConstants.getUsers,
        data: body.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      GetUsersModel data = GetUsersModel.fromJson(response.data);
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
