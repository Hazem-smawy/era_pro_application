import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import '../../../features/accounts/data/models/account_model.dart';
import './tables/db_tables.dart';
import 'package:era_pro_application/src/features/user/data/models/user_model.dart';

import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:drift_dev/api/migrations.dart';

import '../../../core/error/error.dart';
import '../../../features/main_info/data/models/main_info_model.dart';
import '../../../features/store/data/models/models.dart';

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

  // Future<void> saveImage(Uint8List imageData, int id) async {
  //   await into(imagesTable).insert(
  //     ImagesTableCompanion(
  //       id: const Value.absent(),
  //       imageData: Value(imageData),
  //       relatedRecordId: Value(id),
  //     ),
  //   );
  // }

  // Future<Uint8List?> getImage(int id) async {
  //   // Fetch the image record from the database
  //   final imageRecord = await (select(imagesTable)
  //         ..where((tbl) => tbl.relatedRecordId.equals(id)))
  //       .getSingleOrNull();

  //   // If the record exists, return the image data, otherwise return null
  //   return imageRecord?.imageData;
  // }

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
    try {
      final db = AppDatabase.instance();
      return await db.select(table).get();
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
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
    final file = File(p.join(dbFolder.path, 'db1.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
