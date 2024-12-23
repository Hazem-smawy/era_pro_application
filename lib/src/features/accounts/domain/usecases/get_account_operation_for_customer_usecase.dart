import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/accounts_operations_entity.dart';

import '../../../../core/error/error.dart';
import '../repositories/repositories.dart';

class GetAccountOperationForCustomerUsecase extends ParamsUseCase<
    List<AccountsOperationsEntity>, Params<Tuple2<int, int>>> {
  AccountsRepository accountsRepository;

  GetAccountOperationForCustomerUsecase({required this.accountsRepository});
  @override
  Future<Either<Failure, List<AccountsOperationsEntity>>> call(
      Params<Tuple2> params) {
    return accountsRepository.getAccountOperationForCustomer(
        params.data.value1, params.data.value2);
  }
}
