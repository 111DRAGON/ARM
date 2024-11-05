import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/api/dio_exception_handler.dart';
import '../../../../../../core/api/failure.dart';
import '../model/login_body.dart';
import '../model/login_model.dart';

class LoginAdminRepo {
  final ApiService apiService;
  LoginAdminRepo(this.apiService);

  Future<Either<Failure, LoginModel>> login(LoginBody loginBody) async {


try {

      Response response = await apiService.dio.post(
        ApiConstants.login,
        queryParameters: loginBody.toJson(),



      );



      LoginModel data = LoginModel.fromJson(response.data);
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
