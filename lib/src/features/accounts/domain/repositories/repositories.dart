import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/accounts_operations_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/mid_account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/ref_account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/delete_account_operation_usecase.dart';

abstract class AccountsRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, List<AccountEntity>>> getAllAccounts();
  Future<Either<Failure, List<AccountsOperationsEntity>>>
      getAllAccountsOperation();
  Future<Either<Failure, List<RefAccountEntity>>> getAllRefAccounts();
  Future<Either<Failure, List<MidAccountEntity>>> getAllMidAccount();

  Future<Either<Failure, int>> addAccount(AccountEntity account);
  Future<Either<Failure, bool>> addListAccountOperation(
      List<AccountsOperationsEntity> accountsOperation);

  Future<Either<Failure, int>> deleteAccountOperations(OperationType type);
  Future<Either<Failure, bool>> fetchAccounts();
  Future<Either<Failure, List<AccountsOperationsEntity>>>
      getAccountOperationForCustomer(int accNumber, int? refNumber);
}
