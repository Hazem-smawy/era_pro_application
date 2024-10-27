// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';

import 'package:era_pro_application/src/core/error/failures.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/core/utils/repository_helper.dart';
import 'package:era_pro_application/src/features/accounts/data/sources/accounts_local_datasource.dart';
import 'package:era_pro_application/src/features/accounts/data/sources/accounts_remote_datasource.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/user/domain/entities/user_setting_entity.dart';

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
      dateTimeSharePrefKey: SharedPrefKeys.DATETIME_ACCOUNTS_KEY,
      localError: "can't get accounts info from local",
      remoteError: "can't get accounts info from server",
      genericError: "server failures to get accounts",
    );
  }

  @override
  Future<Either<Failure, int>> addAccount(AccountEntity account) async {
    try {
      UserSettingEntity userSettings = UserSettingEntity(
        custParent: int.parse(sharedPreferencesService
                .getString(SharedPrefKeys.USERSETTING_PARENT_KEY) ??
            '0'),
        generateCode: sharedPreferencesService
                .getString(SharedPrefKeys.USERSETTING_PARENT_KEY) ??
            '0',
        custGroup: int.parse(sharedPreferencesService
                .getString(SharedPrefKeys.USERSETTING_GENERATED_KEY) ??
            '0'),
      );

      String userId =
          sharedPreferencesService.getString(SharedPrefKeys.USERID_KEY) ?? '0';
      String branchId =
          sharedPreferencesService.getString(SharedPrefKeys.BRANCHINFO_KEY) ??
              '0';

      int id = await accountsLocalDatasource.addNewAccount(
        userSettings,
        account,
        int.parse(userId),
        int.parse(branchId),
      );

      return Right(id);
    } catch (e) {
      throw Left(LocalStorageFailures(message: e.toString()));
    }
  }
  // ...
}
