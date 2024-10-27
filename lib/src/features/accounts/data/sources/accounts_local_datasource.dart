import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/user/domain/entities/user_setting_entity.dart';

import '../../../../core/services/db/db.dart';

abstract class AccountsLocalDatasource {
  Future<List<AccountModel>> getAllAccounts();
  Future<void> saveAllAccounts(List<AccountModel> items);
  Future<int> addNewAccount(UserSettingEntity userSetting,
      AccountEntity account, int userId, int branchId);
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

  @override
  Future<int> addNewAccount(UserSettingEntity userSetting,
      AccountEntity account, int userId, int branchId) async {
    print("start");
    AppDatabase db = AppDatabase.instance();

    // Fetch the current maximum custom ID
    final lastAccount = await (db.select(db.accountTable)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.accNumber, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .getSingleOrNull();

    print(lastAccount);

    // Determine the next ID
    int accountNumber = lastAccount?.accNumber ??
        int.parse(
            '${userSetting.generateCode}001'); // Start at 5001 if no users exist
    accountNumber += 1;
    var newAccount = AccountTableCompanion(
      id: const Value.absent(),
      accCatId: const Value(0),
      branchId: Value(branchId),
      accNumber: Value(accountNumber),
      accName: Value(account.accName),
      accPhone: Value(account.accPhone),
      email: Value(account.email),
      address: Value(account.address),
      accCatagory: const Value(3),
      accType: const Value(1),
      accLimit: Value(account.accLimit),
      accParent: Value(userSetting.custParent),
      accStoped: const Value(false),
      newData: const Value(true),
      note: const Value(''),
      paymentType: const Value(0),
    );

    // Insert the new user with the incremented custom ID
    return await db.into(db.accountTable).insert(newAccount);
  }
}
