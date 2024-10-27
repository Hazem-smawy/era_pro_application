import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/usecases/usecases.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/repositories/repositories.dart';

class AddAccountUsecase extends ParamsUseCase<int, AccountEntity> {
  AccountsRepository accountsRepository;
  AddAccountUsecase({required this.accountsRepository});
  @override
  Future<Either<Failure, int>> call(AccountEntity params) {
    return accountsRepository.addAccount(params);
  }
}
