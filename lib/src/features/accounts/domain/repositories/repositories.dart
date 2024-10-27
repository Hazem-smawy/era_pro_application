import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';

abstract class AccountsRepository {
  // Future<User> getUser(String userId);
  Future<Either<Failure, List<AccountEntity>>> getAllAccounts();
  Future<Either<Failure, int>> addAccount(AccountEntity account);
}
