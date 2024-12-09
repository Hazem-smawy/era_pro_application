import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/accounts_operations_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/repositories/repositories.dart';

class AddListAccountsOperationsUsecase
    extends ParamsUseCase<bool, Params<List<AccountsOperationsEntity>>> {
  AccountsRepository accountsRepository;
  AddListAccountsOperationsUsecase({required this.accountsRepository});
  @override
  Future<Either<Failure, bool>> call(
      Params<List<AccountsOperationsEntity>> params) async {
    return await accountsRepository.addListAccountOperation(params.data);
  }
}
