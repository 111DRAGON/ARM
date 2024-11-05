import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/api/dio_exception_handler.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../core/storage/secure_storage.dart';
import '../models/get_regions_month_accounts_body.dart';
import '../models/get_regions_month_accounts_model.dart';

class GetRegionsMonthAccountsRepo {
  final ApiService apiService;
  GetRegionsMonthAccountsRepo(this.apiService);

  Future<Either<Failure, GetRegionsMonthAccountsModel>> getRegionsMonthAccounts(
      GetRegionsMonthAccountsBody body) async {
    try {
      final String? token = await SecureStorage.read('token');

      Response response = await apiService.dio.post(
        ApiConstants.getRegionsMonthAccounts,
        data: body.toJson(),
        options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
      );

      GetRegionsMonthAccountsModel data =
          GetRegionsMonthAccountsModel.fromJson(response.data);
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
