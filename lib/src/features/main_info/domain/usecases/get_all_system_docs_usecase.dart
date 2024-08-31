import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/system_doc_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class GetAllSystemDocsUsecase extends NoParamUseCase<List<SystemDocEntity>> {
  MainInfoRepository mainInfoRepository;

  GetAllSystemDocsUsecase({required this.mainInfoRepository});
  @override
  Future<Either<Failure, List<SystemDocEntity>>> call() {
    return mainInfoRepository.getSystemDocs();
  }
}
