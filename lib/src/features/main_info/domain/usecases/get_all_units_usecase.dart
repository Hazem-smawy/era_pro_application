import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/unit_enitity.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/main_info_repository.dart';

class GetAllUnitsUsecase extends NoParamUseCase<List<UnitEnitity>> {
  MainInfoRepository mainInfoRepository;

  GetAllUnitsUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<UnitEnitity>>> call() {
    return mainInfoRepository.getUnits();
  }
}
