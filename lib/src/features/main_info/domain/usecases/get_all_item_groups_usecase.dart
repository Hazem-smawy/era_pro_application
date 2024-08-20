import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_group_entity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/main_info_repository.dart';

class GetAllItemGroupsUsecase extends NoParamUseCase<List<ItemGroupEntity>> {
  MainInfoRepository mainInfoRepository;

  GetAllItemGroupsUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<ItemGroupEntity>>> call() {
    return mainInfoRepository.getItemGroups();
  }
}
