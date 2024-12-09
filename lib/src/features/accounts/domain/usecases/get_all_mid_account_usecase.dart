import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/mid_account_entity.dart';

import '../../../../core/error/error.dart';
import '../repositories/repositories.dart';

class GetAllMidAccountUsecase extends NoParamUseCase<List<MidAccountEntity>> {
  AccountsRepository accountsRepository;

  GetAllMidAccountUsecase({required this.accountsRepository});
  @override
  Future<Either<Failure, List<MidAccountEntity>>> call() {
    return accountsRepository.getAllMidAccount();
  }
}
