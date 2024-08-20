import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/curency_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class GetAllCurenciesUseCase extends NoParamUseCase<List<CurencyEntity>> {
  MainInfoRepository mainInfoRepository;

  GetAllCurenciesUseCase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<CurencyEntity>>> call() {
    return mainInfoRepository.getAllCurencies();
  }
}
