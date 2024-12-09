import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/delete_account_operation_usecase.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

class DeleteStoreOperationUsecase
    extends ParamsUseCase<void, Params<OperationType>> {
  StoreRepository storeRepository;

  DeleteStoreOperationUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, int>> call(Params params) {
    return storeRepository.deleteStoreOperations(params.data);
  }
}
