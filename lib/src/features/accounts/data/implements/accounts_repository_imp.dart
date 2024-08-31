// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/core/utils/repository_helper.dart';
import 'package:era_pro_application/src/features/accounts/data/sources/accounts_local_datasource.dart';
import 'package:era_pro_application/src/features/accounts/data/sources/accounts_remote_datasource.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';

import '../../domain/repositories/repositories.dart';

class AccountsRepositoryImp implements AccountsRepository {
  SharedPreferencesService sharedPreferencesService;
  AccountsLocalDatasource accountsLocalDatasource;
  AccountsRemoteDatasource accountsRemoteDatasource;
  AccountsRepositoryImp({
    required this.sharedPreferencesService,
    required this.accountsLocalDatasource,
    required this.accountsRemoteDatasource,
  });
  @override
  Future<Either<Failure, List<AccountModel>>> getAllAccounts() {
    return fetchArrayOfData<AccountModel>(
      cacheKey: 'accounts',
      sharedPreferencesService: sharedPreferencesService,
      fetchFromLocal: accountsLocalDatasource.getAllAccounts,
      fetchFromRemote: accountsRemoteDatasource.getAllAccounts,
      saveDataToLocal: accountsLocalDatasource.saveAllAccounts,
      localError: "can't get accounts info from local",
      remoteError: "can't get accounts info from server",
      genericError: "server failures to get accounts",
    );
  }
  // ...
}
