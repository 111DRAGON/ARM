import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../../core/api/api_constants.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/api/dio_exception_handler.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../../core/storage/secure_storage.dart';
import '../models/transfer_business_ownership_body.dart';
import '../models/transfer_business_ownership_model.dart';


class TransferBusinessOwnershipRepo {
  final ApiService apiService;
  TransferBusinessOwnershipRepo(this.apiService);

  Future<Either<Failure, TransferBusinessOwnershipModel>> transferBusinessOwnership(TransferBusinessOwnershipBody body) async {
    try {
      final String? token = await SecureStorage.read('token');

      Response response = await apiService.dio.put(
        ApiConstants.transferBusinessOwnership,data: body.toJson(),
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      print(body.toJson());
      TransferBusinessOwnershipModel data =
      TransferBusinessOwnershipModel.fromJson(response.data);
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
