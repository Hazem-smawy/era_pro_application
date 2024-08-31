import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';

import '../../../../core/services/db/db.dart';

abstract class AccountsLocalDatasource {
  Future<List<AccountModel>> getAllAccounts();
  Future<void> saveAllAccounts(List<AccountModel> items);
}

class AccountsLocalDatasourceImpl implements AccountsLocalDatasource {
  @override
  Future<List<AccountModel>> getAllAccounts() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.accountTable);
  }

  @override
  Future<void> saveAllAccounts(List<AccountModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.accountTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }
}
