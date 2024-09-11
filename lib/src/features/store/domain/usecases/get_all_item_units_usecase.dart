import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/main_info_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/repositories.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetAllItemUnitsUsecase extends NoParamUseCase<List<ItemUnitsEntity>> {
  StoreRepository storeRepository;

  GetAllItemUnitsUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<ItemUnitsEntity>>> call() {
    return storeRepository.getItemUnits();
  }
}
