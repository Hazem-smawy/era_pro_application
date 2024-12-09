import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

class FetchAllStoreFromRemoteUsecase extends NoParamUseCase<bool> {
  StoreRepository storeRepository;

  FetchAllStoreFromRemoteUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, bool>> call() {
    return storeRepository.fetchAllStoreComponents();
  }
}
