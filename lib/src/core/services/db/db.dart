import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:era_pro_application/src/core/services/db/tables/branch_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/company_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/curency_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/item_group_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/item_unit_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/unit_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/user_store_table.dart';
import 'package:era_pro_application/src/core/services/db/tables/user_table.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift_dev/api/migrations.dart';

import '../../../features/main_info/data/models/branch_model.dart';
import '../../../features/main_info/data/models/company_model.dart';
import '../../../features/main_info/data/models/curency_model.dart';
import '../../../core/error/error.dart';
import '../../../features/main_info/data/models/item_group_model.dart';
import '../../../features/main_info/data/models/item_units_model.dart';
import '../../../features/main_info/data/models/unit_model.dart';
import '../../../features/main_info/data/models/user_store_model.dart';
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
    D? model = await (select(table)..where((tbl) => idSelector(tbl).equals(id)))
        .getSingleOrNull();
    return model;
  }

  Future<void> saveSingle<T extends Table, D>(
      TableInfo<T, D> table, Insertable<D> model) async {
    try {
      AppDatabase db = AppDatabase.instance();
      await db.into(table).insertOnConflictUpdate(model);
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

  Future<List<D>> getAll<T extends Table, D>(TableInfo<T, D> table) async {
    final db = AppDatabase.instance();
    return await db.select(table).get();
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
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
