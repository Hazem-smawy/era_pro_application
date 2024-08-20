// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/branch_entity.dart';
import 'package:era_pro_application/src/features/main_info/domain/repositories/main_info_repository.dart';

class GetBranchUsecase extends NoParamUseCase<BranchEntity> {
  MainInfoRepository mainInfoRepository;
  GetBranchUsecase({
    required this.mainInfoRepository,
  });
  @override
  Future<Either<Failure, BranchEntity>> call() {
    return mainInfoRepository.getBranchInfo();
  }
}
