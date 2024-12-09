import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/accounts_operations_entity.dart';

import '../../../../core/error/error.dart';
import '../repositories/repositories.dart';

class GetAllAccountsOperationUsecase
    extends NoParamUseCase<List<AccountsOperationsEntity>> {
  AccountsRepository accountsRepository;

  GetAllAccountsOperationUsecase({required this.accountsRepository});
  @override
  Future<Either<Failure, List<AccountsOperationsEntity>>> call() {
    return accountsRepository.getAllAccountsOperation();
  }
}
