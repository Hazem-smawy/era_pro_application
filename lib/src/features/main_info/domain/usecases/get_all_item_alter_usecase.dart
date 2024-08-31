import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_alter_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class GetAllItemAlterUsecase extends NoParamUseCase<List<ItemAlterEntity>> {
  MainInfoRepository mainInfoRepository;

  GetAllItemAlterUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<ItemAlterEntity>>> call() {
    return mainInfoRepository.getItemAlter();
  }
}
