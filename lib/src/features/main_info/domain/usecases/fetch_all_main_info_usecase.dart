import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecases.dart';

class FetchAllMainInfoUsecase extends NoParamUseCase<bool> {
  MainInfoRepository mainInfoRepository;

  FetchAllMainInfoUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, bool>> call() {
    return mainInfoRepository.fetchAllMainInfo();
  }
}
