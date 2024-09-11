import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/store/domain/entities/unit_enitity.dart';
import 'package:era_pro_application/src/features/store/domain/repositories/repositories.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class GetAllUnitsUsecase extends NoParamUseCase<List<UnitEnitity>> {
  StoreRepository storeRepository;

  GetAllUnitsUsecase({required this.storeRepository});
  @override
  Future<Either<Failure, List<UnitEnitity>>> call() {
    return storeRepository.getUnits();
  }
}
