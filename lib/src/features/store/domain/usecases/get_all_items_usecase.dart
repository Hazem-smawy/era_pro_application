import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/repositories.dart';

class GetAllItemsUsecase extends NoParamUseCase<List<ItemEntity>> {
  StoreRepository storeRepository;

  GetAllItemsUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<ItemEntity>>> call() {
    return storeRepository.getItems();
  }
}
