// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/entities/user_store_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

class GetUserStoreInfoUsecase extends NoParamUseCase<UserStoreEntity> {
  StoreRepository storeRepository;
  GetUserStoreInfoUsecase({
    required this.storeRepository,
  });
  @override
  Future<Either<Failure, UserStoreEntity>> call() {
    return storeRepository.getUserStoreInfo();
  }
}
