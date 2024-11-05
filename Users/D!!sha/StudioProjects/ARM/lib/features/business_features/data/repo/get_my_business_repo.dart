import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/api/dio_exception_handler.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/storage/secure_storage.dart';
import '../models/get_my_business_body.dart';
import '../models/get_my_business_model.dart';


class GetMyBusinessRepo {
  final ApiService apiService;

  GetMyBusinessRepo(this.apiService);


  Future<Either<Failure,GetMyBusinessModel>> getMyBusiness(GetMyBusinessBody body)async{
    try {
      String? token = await SecureStorage.read('token');
      Response response = await apiService.dio.post(
        ApiConstants.getMyBusiness,
        data:body.toJson() ,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      GetMyBusinessModel model = GetMyBusinessModel.fromJson(response.data);
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
