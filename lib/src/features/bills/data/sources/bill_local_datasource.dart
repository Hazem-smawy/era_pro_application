import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/error/error.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/bills/data/models/bill_model.dart';
import 'package:era_pro_application/src/features/bills/domain/entities/bill_ui_entity.dart';
import 'package:era_pro_application/src/features/bills/domain/repositories/bill_repository.dart';

import '../models/bill_details_model.dart';

abstract class BillLocalDatasource {
  Future<int> addNewBill(BillModel billModel);
  Future<void> addListofBillDetails(List<BillDetailsModel> billDetails);
  Future<int> getLastCategoryNumber(int id);
  Future<List<BillModel>> getAllBills();
  Future<List<BillDetailsModel>> getBillDetails(int id);
  Future<List<BillDetailsUI>> getBillDetailsUI(int id);
  Future<void> deleteBillDetails(int id);
  Future<List<BillWithDetailsUI>> getRecentBillWithDetails();
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

  @override
  Future<List<BillModel>> getAllBills() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.billTable);
  }

  // @override
  // @override
  // Future<List<BillDetailsModel>> getBillDetails(int id) async {
  //   print(id);
  //   final db = AppDatabase.instance();

  //   return await (db.select(db.billDetailsTable)
  //         ..where((tbl) => tbl.billID.equals(id)))
  //       .get();
  // }

  // @override
  // Future<List<BillDetailsUI>> getBillDetailsUI(int billId) async {
  //   final db = AppDatabase.instance();

  //   final query = db.select(db.billDetailsTable).join([
  //     leftOuterJoin(
  //         db.itemTable, db.itemTable.id.equalsExp(db.billDetailsTable.itemId)),
  //     leftOuterJoin(db.unitTable,
  //         db.unitTable.id.equalsExp(db.billDetailsTable.itemUnitID)),
  //               leftOuterJoin(db.itemUnitTable,
  //         db.itemUnitTable.id.equalsExp(db.billDetailsTable.itemUnitID)),
  //   ])
  //     ..where(db.billDetailsTable.billID.equals(billId));

  //   // Execute the query and map the results to the `BillDetailsUI` model
  //   final results = await query.map((row) {
  //     final billDetails = row.readTable(db.billDetailsTable);
  //     final item = row.readTableOrNull(db.itemTable);
  //     final unit = row.readTableOrNull(db.unitTable);
  //     final itemUnit = row.readTableOrNull(db.itemUnitTable);

  //     return BillDetailsUI(
  //         id: billDetails.id ?? 0,
  //         billId: billDetails.billID,
  //         itemId: item?.id ?? 0,
  //         unitId: unit?.id ?? 0,
  //         itemName: item?.name ?? '',
  //         unitName: unit?.name ?? '',
  //         billDetailsEntity: billDetails);
  //   }).get();

  //   return results;
  // }
  @override
  Future<List<BillDetailsUI>> getBillDetailsUI(int billId) async {
    final db = AppDatabase.instance();

    final query = db.select(db.billDetailsTable).join([
      leftOuterJoin(
          db.itemTable, db.itemTable.id.equalsExp(db.billDetailsTable.itemId)),
      innerJoin(db.itemUnitTable,
          db.itemUnitTable.id.equalsExp(db.billDetailsTable.itemUnitID)),
      innerJoin(
          db.unitTable, db.unitTable.id.equalsExp(db.itemUnitTable.itemUnitId)),
    ])
      ..where(db.billDetailsTable.billID.equals(billId));

    // Execute the query and map the results to the `BillDetailsUI` model
    final results = await query.map((row) {
      final billDetails = row.readTable(db.billDetailsTable);
      final item = row.readTable(db.itemTable);
      final unit = row.readTable(db.unitTable);

      return BillDetailsUI(
        billDetailsEntity: billDetails,
        id: billDetails.id ?? 0,
        billId: billDetails.billID,
        itemId: item.id,
        unitId: unit.id,
        itemName: item.name,
        unitName: unit.name,
      );
    }).get();

    return results;
  }

  @override
  Future<List<BillDetailsModel>> getBillDetails(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteBillDetails(int id) async {
    final db = AppDatabase.instance();
    await (db.delete(db.billDetailsTable)
          ..where(
            (details) => details.billID.equals(id),
          ))
        .go();
  }

  @override
  Future<List<BillWithDetailsUI>> getRecentBillWithDetails() async {
    final db = AppDatabase.instance();

    final query = db.select(db.billTable).join([
      innerJoin(db.curencyTable,
          db.curencyTable.id.equalsExp(db.billTable.currencyId)),
      innerJoin(db.accountTable,
          db.accountTable.accNumber.equalsExp(db.billTable.customerNumber)),
    ]);
    final results = await query.map((row) {
      final bill = row.readTable(db.billTable);
      final account = row.readTable(db.accountTable);
      final currency = row.readTable(db.curencyTable);

      return BillWithDetailsUI(
        bill: bill,
        customer: account,
        curencyEntity: currency,
      );
    }).get();

    return results;
  }
}
