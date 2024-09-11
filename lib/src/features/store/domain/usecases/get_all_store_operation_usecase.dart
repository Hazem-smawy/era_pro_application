import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/entities/store_operation_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

class GetAllStoreOperationUsecase
    extends NoParamUseCase<List<StoreOperationEntity>> {
  StoreRepository storeRepository;

  GetAllStoreOperationUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<StoreOperationEntity>>> call() {
    return storeRepository.getStoreOperations();
  }
}
