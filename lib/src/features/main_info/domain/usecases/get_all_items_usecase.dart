import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class GetAllItemsUsecase extends NoParamUseCase<List<ItemEntity>> {
  MainInfoRepository mainInfoRepository;

  GetAllItemsUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<ItemEntity>>> call() {
    return mainInfoRepository.getItems();
  }
}
