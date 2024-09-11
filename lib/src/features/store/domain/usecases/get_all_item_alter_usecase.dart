import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_alter_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/repositories.dart';

class GetAllItemAlterUsecase extends NoParamUseCase<List<ItemAlterEntity>> {
  StoreRepository storeRepository;

  GetAllItemAlterUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<ItemAlterEntity>>> call() {
    return storeRepository.getItemAlter();
  }
}
