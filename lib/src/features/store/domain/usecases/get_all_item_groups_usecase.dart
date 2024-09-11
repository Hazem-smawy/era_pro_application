import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_group_entity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/store_repositories.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetAllItemGroupsUsecase extends NoParamUseCase<List<ItemGroupEntity>> {
  StoreRepository storeRepository;

  GetAllItemGroupsUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<ItemGroupEntity>>> call() {
    return storeRepository.getItemGroups();
  }
}
