import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/constants/share_pref_keys.dart';
import 'package:era_pro_application/src/core/services/shared_preferences.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_operation_model.dart';
import 'package:era_pro_application/src/features/accounts/data/models/mid_account_model.dart';
import 'package:era_pro_application/src/features/accounts/data/models/ref_account_model.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/account_entity.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/delete_account_operation_usecase.dart';
import 'package:era_pro_application/src/features/user/domain/entities/user_setting_entity.dart';
import 'package:get/get.dart' as getx;

import '../../../../core/services/db/db.dart';

abstract class AccountsLocalDatasource {
  Future<List<AccountModel>> getAllAccounts();
  Future<List<RefAccountModel>> getAllRefAccounts();
  Future<List<MidAccountModel>> getAllMidAccounts();
  Future<List<AccountOperationModel>> getAllAccountsOperation();
  Future<void> saveAllAccounts(List<AccountModel> items);
  Future<void> saveAllRefAccount(List<RefAccountModel> items);
  Future<void> saveAllMidAccount(List<MidAccountModel> items);
  Future<void> saveAllAccountOperation(List<AccountOperationModel> items);
  Future<int> addNewAccount(AccountEntity account, int userId, int branchId);
  // Future<void> addListAccountsOperation(List<AccountOperationModel> item);
  Future<void> deleteAccountOperations(OperationType op);
  Future<List<AccountOperationModel>> getAccountOperationById(
      int accNumber, int? refNumber);
}

class AccountsLocalDatasourceImpl implements AccountsLocalDatasource {
  @override
  Future<List<AccountModel>> getAllAccounts() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.accountTable);
  }

  @override
  Future<int> addNewAccount(
      AccountEntity account, int userId, int branchId) async {
    AppDatabase db = AppDatabase.instance();

    final userSetting = await db.select(db.userSettingTable).getSingleOrNull();
    if (userSetting == null) {
      throw Exception("User settings not configured.");
    }

    // Check if the account already exists by a unique identifier (e.g., account number or email)
    final existingAccount = await (db.select(db.accountTable)
          ..where((t) => t.accNumber.equals(account.accNumber)))
        .getSingleOrNull();

    if (existingAccount != null) {
      // Update the existing account
      final updatedAccount = AccountTableCompanion(
        id: Value(existingAccount.id ?? 0),
        accCatId: Value(existingAccount.accCatId),
        branchId: Value(branchId),
        accNumber: Value(existingAccount.accNumber),
        accName: Value(account.accName),
        accPhone: Value(account.accPhone),
        email: Value(account.email),
        address: Value(account.address),
        accCatagory: Value(existingAccount.accCatagory),
        accType: Value(existingAccount.accType),
        accLimit: Value(account.accLimit),
        accParent: Value(existingAccount.accParent),
        accStoped: Value(existingAccount.accStoped),
        newData: Value(existingAccount.newData),
        note: Value(account.note),
        paymentType: Value(existingAccount.paymentType),
        image: Value(account.image),
        refNumber: Value(account.refNumber),
      );

      // Perform the update
      await (db.update(db.accountTable)
            ..where((t) => t.accNumber.equals(existingAccount.accNumber)))
          .write(updatedAccount);

      return existingAccount.id ?? 0;
    } else {
      final lastAccount = await (db.select(db.accountTable)
            ..orderBy([
              (t) => OrderingTerm(
                    expression: t.accNumber,
                    mode: OrderingMode.desc,
                  )
            ])
            ..limit(1))
          .getSingleOrNull();

      int accountNumber =
          lastAccount?.accNumber ?? int.parse('${userSetting.generateCode}001');
      accountNumber += 1;

      // Create a new account
      final newAccount = AccountTableCompanion(
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
        refNumber: Value(account.refNumber),
        image: Value(
          account.image,
        ),
      );

      // Insert the new account
      return await db.into(db.accountTable).insert(newAccount);
    }
  }

  @override
  Future<void> saveAllAccounts(List<AccountModel> accounts) async {
    SharedPreferencesService sharedPreferencesService = getx.Get.find();
    String? stringId =
        sharedPreferencesService.getString(SharedPrefKeys.USERSETTING_KEY);

    int id = int.parse(stringId ?? '0');

    try {
      final db = AppDatabase.instance();
      final userSettings =
          await db.getSingle(db.userSettingTable, (tbl) => tbl.id, id);

      if (userSettings == null) {
        throw Exception("User settings not configured.");
      }

      final custParent = userSettings.custParent;
      final startCode = userSettings.generateCode;

      final lastAccount = await (db.select(db.accountTable)
            ..orderBy([
              (t) =>
                  OrderingTerm(expression: t.accNumber, mode: OrderingMode.desc)
            ])
            ..limit(1))
          .getSingleOrNull();

      // Determine the next ID
      int accountNumber =
          lastAccount?.accNumber ?? int.parse('${startCode}001');
      await db.batch((batch) {
        for (final account in accounts) {
          accountNumber += 1;
          final newAccount = account.copyWith(
            accParent: custParent,
            accNumber: accountNumber,
          );

          batch.insert(
            db.accountTable,
            newAccount.toCompanion(),
            mode: InsertMode.insertOrReplace,
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<MidAccountModel>> getAllMidAccounts() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.midAccountTable);
  }

  @override
  Future<List<RefAccountModel>> getAllRefAccounts() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.refAccountTable);
  }

  @override
  Future<void> saveAllMidAccount(List<MidAccountModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.midAccountTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<void> saveAllRefAccount(List<RefAccountModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.refAccountTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<List<AccountOperationModel>> getAllAccountsOperation() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.accountOperationTable);
  }

  @override
  Future<void> saveAllAccountOperation(
      List<AccountOperationModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.accountOperationTable,
      items.map((item) => item.toCompanion()).toList(),
    );

    final numberOfoperations = await db.select(db.accountOperationTable).get();
    print("number of operations in the database: ${numberOfoperations.length}");
  }

  @override
  Future<void> deleteAccountOperations(OperationType op) async {
    final db = AppDatabase.instance();

    try {
      await (db.delete(db.accountOperationTable)
            ..where(
              (operation) =>
                  operation.operationId.equals(op.id) &
                  operation.operationType.equals(op.type),
            ))
          .go();
    } catch (e) {
      throw Exception('Failed to delete account operation: $e');
    }
  }

  @override
  Future<List<AccountOperationModel>> getAccountOperationById(
      int accNumber, int? refNumber) {
    final db = AppDatabase.instance();
    return (db.select(db.accountOperationTable)
          ..where((operation) {
            final accountCondition = operation.accountNumber.equals(accNumber);
            if (refNumber != null) {
              return accountCondition |
                  operation.accountNumber.equals(refNumber);
            }
            return accountCondition;
          }))
        .get();
  }
}
