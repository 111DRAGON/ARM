import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/api/dio_exception_handler.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/storage/secure_storage.dart';
import '../models/get_activation_business_model.dart';
import '../models/get_my_business_model.dart';
import '../../../../core/models/get_pending_approval _body.dart';


class GetActivationBusinessRepo {
  final ApiService apiService;

  GetActivationBusinessRepo(this.apiService);


  Future<Either<Failure,GetActivationBusinessModel>> getActivationBusiness(GetPendingApprovalBody body )async{
    try {
      String? token = await SecureStorage.read('token');
      Response response = await apiService.dio.post(
        ApiConstants.getActivationBusiness,
        data: body.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      GetActivationBusinessModel model = GetActivationBusinessModel.fromJson(response.data);
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
