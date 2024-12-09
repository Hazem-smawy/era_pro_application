import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:era_pro_application/src/core/services/db/tables/account_operation_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/bill_details_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/bill_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/exhange_tables.dart';
import 'package:era_pro_application/src/core/services/db/tables/mid_account_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/ref_account_table.dart';
import '../../../features/accounts/data/models/account_model.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';
import '../../../features/accounts/data/models/account_operation_model.dart';
import '../../../features/accounts/data/models/mid_account_model.dart';
import '../../../features/accounts/data/models/ref_account_model.dart';
import '../../../features/bills/data/models/bill_details_model.dart';
import '../../../features/bills/data/models/bill_model.dart';
import '../../../features/exchange_receipt/data/models/exchange_model.dart';
import '../../../features/exchange_receipt/domain/entities/check_operation_entity.dart';
import '../../../features/exchange_receipt/domain/entities/sand_details_entity.dart';
import '../../../features/main_info/data/models/main_info_model.dart';
import '../../../features/store/data/models/models.dart';

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:drift_dev/api/migrations.dart';

import '../../../core/error/error.dart';
import './tables/db_tables.dart';
part 'db.g.dart';

@DriftDatabase(
  tables: [
    UserTable,
    CompanyTable,
    BranchTable,
    CurencyTable,
    UserStoreTable,
    UnitTable,
    ItemGroupTable,
    ItemUnitTable,
    ItemTable,
    PaymentTable,
    SystemDocTable,
    UserSettingTable,
    ItemAlterTable,
    BarcodeTable,
    AccountTable,
    StoreOperationTable,
    BillTable,
    BillDetailsTable,
    AccountOperationTable,
    RefAccountTable,
    MidAccountTable,
    ExchangesTable,
    SandDetailsTable,
    CheckOperationsTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase();

  static AppDatabase instance() => _instance;

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2;

  Future<D?> getSingle<T extends Table, D>(TableInfo<T, D> table,
      Expression<int> Function(T) idSelector, int id) async {
    try {
      D? model = await (select(table)
            ..where((tbl) => idSelector(tbl).equals(id)))
          .getSingleOrNull();

      return model;
    } catch (e) {
      throw LocalStorageException();
    }
  }

  Future<int> saveSingle<T extends Table, D>(
      TableInfo<T, D> table, Insertable<D> model) async {
    try {
      AppDatabase db = AppDatabase.instance();
      var id = await db.into(table).insertOnConflictUpdate(model);
      return id;
    } catch (e) {
      throw LocalStorageException();
    }
  }

  Future<void> saveAll<T extends Table, D>(
    TableInfo<T, D> table,
    List<Insertable<D>> models,
  ) async {
    try {
      final db = AppDatabase.instance();
      await db.batch((batch) {
        batch.insertAllOnConflictUpdate(table, models);
      });
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  Future<void> saveAllWithNoConflict<T extends Table, D>(
    TableInfo<T, D> table,
    List<Insertable<D>> models,
  ) async {
    try {
      final db = AppDatabase.instance();
      await db.batch((batch) {
        // Use `insertAll` to strictly insert new rows without updates
        batch.insertAll(table, models, mode: InsertMode.insert);
      });
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  Future<List<D>> getAll<T extends Table, D>(TableInfo<T, D> table) async {
    try {
      final db = AppDatabase.instance();
      return await db.select(table).get();
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  //item

  // Get all item information without the image
  Future<List<ItemModel>> getAllItemsWithoutImages() async {
    final query = select(itemTable)
      ..addColumns([
        itemTable.id,
        itemTable.itemGroupId,
        itemTable.itemCode,
        itemTable.name,
        itemTable.enName,
        itemTable.type,
        itemTable.itemLimit,
        itemTable.isExpire,
        itemTable.notifyBefore,
        itemTable.freeQuantityAllow,
        itemTable.hasTax,
        itemTable.taxRate,
        itemTable.itemCompany,
        itemTable.orignalCountry,
        itemTable.itemDescription,
        itemTable.note,
        itemTable.hasAlternated,
        itemTable.newData,
      ]);
    final result = await query.get();
    return result.toList();
  }

  Future<Uint8List?> getItemImage(int itemId) async {
    final query = selectOnly(itemTable)
      ..addColumns([itemTable.itemImage])
      ..where(itemTable.id.equals(itemId));

    final result = await query.getSingleOrNull();
    return result?.read(itemTable.itemImage);
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      ///This method is executed only the first time when database is created
      onCreate: (Migrator m) async {
        await m.createAll();
      },

      ///This method is executed every time we increase the schemaVersion number
      ///In this method is where we are handling our migration
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          //await m.addColumn(artist, artist.isActive);
          ///The code line below is when you need to migrate newly added table
          //await m.create(newTable);
        }
      },

      ///This method is helpful as it help us during development phase to check if we did migration correctly
      beforeOpen: (details) async {
        if (kDebugMode) {
          await validateDatabaseSchema();
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
