import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/bills/data/models/bill_model.dart';
import 'package:sqlite3/common.dart';

import '../models/bill_details_model.dart';

abstract class BillLocalDatasource {
  Future<int> addNewBill(BillModel billModel);
  Future<void> addListofBillDetails(List<BillDetailsModel> billDetails);
  Future<int> getLastCategoryNumber(int id);
}

class BillLocalDatasourceImp implements BillLocalDatasource {
  @override
  Future<int> addNewBill(BillModel billModel) {
    try {
      final db = AppDatabase.instance();
      return db.saveSingle(db.billTable, billModel.toCompanion());
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  @override
  Future<int> getLastCategoryNumber(int type) async {
    print('type');
    final db = AppDatabase.instance();

    final lastNumber = await (db.select(db.billTable)
          ..where((tbl) => tbl.billType.equals(type))
          ..orderBy([
            (tbl) => OrderingTerm(
                expression: tbl.billNumber, mode: OrderingMode.desc)
          ])
          ..limit(1))
        .map((row) => row.billNumber)
        .getSingleOrNull();

    print('lastNumber: $lastNumber');

    return lastNumber ??
        0; // Returns null if no rows are found, otherwise the last number
  }

  @override
  Future<void> addListofBillDetails(List<BillDetailsModel> billDetails) async {
    try {
      final db = AppDatabase.instance();
      await db.saveAll(
        db.billDetailsTable,
        billDetails.map((item) => item.toCompanion()).toList(),
      );
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }
}
