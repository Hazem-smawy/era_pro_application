import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/error/exception.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_details_entity.dart';

import '../../../../core/services/db/db.dart';
import '../models/models.dart';

abstract class StoreLocalDatasource {
  Future<void> saveAllItemGroups(List<ItemGroupModel> items);
  Future<List<ItemGroupModel>> getAllItemGroups();

  Future<void> saveAllUnits(List<UnitModel> items);
  Future<List<UnitModel>> getAllUnits();

  Future<void> saveAllItemUnits(List<ItemUnitsModel> items);
  Future<List<ItemUnitsModel>> getAllItemUnits();

  Future<void> saveAllItems(List<ItemModel> items);
  Future<List<ItemModel>> getAllItems();

  //item alter and barcode
  Future<void> saveAllItemBarcode(List<BarcodeModel> items);
  Future<List<BarcodeModel>> getAllItemBarcode();

  Future<void> saveAllItemAlter(List<ItemAlterModel> items);
  Future<List<ItemAlterModel>> getAllItemAlter();

  //store

  Future<int> saveUserStoreInfo(UserStoreModel userStoreInfo);
  Future<UserStoreModel?> getUserStoreInfo(int itemId);

  //store operation
  Future<void> saveAllStoreOperation(List<StoreOperationModel> items);
  Future<List<StoreOperationModel>> getAllStoreOperation();

  // Future<ItemDetailsModel> getItemDetails(int id);
  Future<List<StoreItemDetailsEntity>> getAllItemsWithDetails();
}

class StoreLocalDatasourceImpl implements StoreLocalDatasource {
  @override
  Future<List<ItemGroupModel>> getAllItemGroups() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.itemGroupTable);
  }

  @override
  Future<List<UnitModel>> getAllUnits() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.unitTable);
  }

  @override
  Future<void> saveAllUnits(List<UnitModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.unitTable,
      items.map((currency) => currency.toCompanion()).toList(),
    );
  }

  @override
  Future<List<ItemUnitsModel>> getAllItemUnits() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.itemUnitTable);
  }

  @override
  Future<void> saveAllItemUnits(List<ItemUnitsModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.itemUnitTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<List<ItemModel>> getAllItems() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.itemTable);
  }

  @override
  Future<void> saveAllItems(List<ItemModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.itemTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<List<ItemAlterModel>> getAllItemAlter() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.itemAlterTable);
  }

  @override
  Future<List<BarcodeModel>> getAllItemBarcode() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.barcodeTable);
  }

  @override
  Future<void> saveAllItemAlter(List<ItemAlterModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.itemAlterTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<void> saveAllItemBarcode(List<BarcodeModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.barcodeTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<void> saveAllItemGroups(List<ItemGroupModel> items) async {
    AppDatabase db = AppDatabase.instance();
    await db.saveAll(
      db.itemGroupTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  @override
  Future<UserStoreModel?> getUserStoreInfo(int id) async {
    AppDatabase db = AppDatabase.instance();
    return await db.getSingle(db.userStoreTable, (tbl) => tbl.id, id);
  }

  @override
  Future<int> saveUserStoreInfo(UserStoreModel userStoreInfo) async {
    AppDatabase db = AppDatabase.instance();
    var id =
        await db.saveSingle(db.userStoreTable, userStoreInfo.toCompanion());
    return id;
  }

  @override
  Future<List<StoreOperationModel>> getAllStoreOperation() async {
    AppDatabase db = AppDatabase.instance();

    return await db.getAll(db.storeOperationTable);
  }

  @override
  Future<void> saveAllStoreOperation(List<StoreOperationModel> items) async {
    AppDatabase db = AppDatabase.instance();

    await db.saveAll(
      db.storeOperationTable,
      items.map((item) => item.toCompanion()).toList(),
    );
  }

  // @override
  // Future<ItemDetailsModel> getItemDetails(int itemId) async {
  //   AppDatabase db = AppDatabase.instance();
  //   // First, get the main item and group
  //   final itemWithGroupQuery = db.select(db.itemTable).join([
  //     innerJoin(db.itemGroupTable,
  //         db.itemGroupTable.id.equalsExp(db.itemTable.itemGroupId)),
  //   ])
  //     ..where(db.itemTable.id.equals(itemId));

  //   final itemRow = await itemWithGroupQuery.getSingle();
  //   // Return null if no data found

  //   final item = itemRow.readTable(db.itemTable);
  //   final group = itemRow.readTable(db.itemGroupTable);

  //   // Fetch related store operations
  //   final storeOperations = await (db.select(db.storeOperationTable)
  //         ..where((op) => op.itemId.equals(itemId)))
  //       .get();

  //   // Fetch related item alters
  //   final itemAlters = await (db.select(db.itemAlterTable)
  //         ..where((alt) => alt.itemId.equals(itemId)))
  //       .get();

  //   // Fetch related item units
  //   final itemUnits = await (db.select(db.itemUnitTable)
  //         ..where((unit) => unit.itemId.equals(itemId)))
  //       .get();

  //   // Map the results into domain entities
  //   return ItemDetailsModel(
  //     item: item,
  //     group: group,
  //     storeOperation: storeOperations,
  //     itemAlter: itemAlters,
  //     itemUnits: itemUnits,
  //   );
  // }

  // @override
  // Future<List<StoreItemDetailsEntity>> getAllItemsWithDetails() async {
  //   AppDatabase db = AppDatabase.instance();
  //   // Step 1: Get all items and their groups
  //   final query = db.select(db.itemTable).join([
  //     leftOuterJoin(db.itemGroupTable,
  //         db.itemGroupTable.id.equalsExp(db.itemTable.itemGroupId)),
  //   ]);

  //   final itemRows = await query.get(); // Fetch all rows

  //   // Step 2: Map each row to an ItemDetailsEntity
  //   var itemsDetailsList = itemRows.map((row) async {
  //     final item = row.readTable(db.itemTable);
  //     final group = row.readTableOrNull(db.itemGroupTable);
  //     // Fetch related store operations for each item
  //     final storeOperations = await (db.select(db.storeOperationTable)
  //           ..where((op) => op.itemId.equals(item.id)))
  //         .get();

  //     // Fetch related item alters for each item
  //     final itemAlters = await (db.select(db.itemAlterTable)
  //           ..where((alt) => alt.itemId.equals(item.id)))
  //         .get();

  //     // Fetch related item units for each item
  //     final itemUnits = await (db.select(db.itemUnitTable)
  //           ..where((unit) => unit.itemId.equals(item.id)))
  //         .get();

  //     // Step 3: Map the results into an ItemDetailsEntity
  //     return StoreItemDetailsEntity(
  //       item: item,
  //       group: group,
  //       itemAlter: itemAlters,
  //       itemUnits: itemUnits,
  //     );
  //   }).toList();

  //   return Future.wait(itemsDetailsList);
  // }
  @override
  Future<List<StoreItemDetailsEntity>> getAllItemsWithDetails() async {
    try {
      AppDatabase db = AppDatabase.instance();
      // final query = db.select(db.itemTable).join([
      //   leftOuterJoin(db.itemGroupTable,
      //       db.itemGroupTable.id.equalsExp(db.itemTable.itemGroupId))
      // ]);

      final query = db.select(db.itemTable).join([
        leftOuterJoin(db.itemGroupTable,
            db.itemGroupTable.code.equalsExp(db.itemTable.itemGroupId)),
      ]);

      final itemDetailsList = <StoreItemDetailsEntity>[];

      final result = await query.get();

      for (final row in result) {
        final item = row.readTable(db.itemTable);
        // print("item $item");
        final group = row.readTableOrNull(db.itemGroupTable);

        // final storeOperations = await (db.select(db.storeOperationTable)
        //       ..where((op) => op.itemId.equals(item.id)))
        //     .get();

        // Fetch related item alters for each item
        final itemAlters = await (db.select(db.itemAlterTable)
              ..where((alt) => alt.itemId.equals(item.id)))
            .get();

        // Fetch related item units for each item
        final itemUnits = await (db.select(db.itemUnitTable)
              ..where((unit) => unit.itemId.equals(item.id)))
            .get();

        // Fetch related item unit details for the current item
        final itemUnitsQuery = db.select(db.itemUnitTable).join([
          leftOuterJoin(db.unitTable,
              db.unitTable.id.equalsExp(db.itemUnitTable.itemUnitId))
        ])
          ..where(db.itemUnitTable.itemId.equals(item.id));

        final itemUnitDetails = <ItemUnitDetailsEntity>[];

        final itemUnitsResult = await itemUnitsQuery.get();

        for (final itemUnitRow in itemUnitsResult) {
          final unit = itemUnitRow.readTable(db.unitTable);
          final itemUnit = itemUnitRow.readTable(db.itemUnitTable);

          // Fetch the total quantity for the current itemUnit

          final operationsQuery = db.select(db.storeOperationTable)
            ..where((table) =>
                table.unitId.equals(unit.id) & table.itemId.equals(item.id));

          int totalQuantity = 0;
          final operationsResult = await operationsQuery.get();

          for (final operation in operationsResult) {
            if (operation.operationIn) {
              totalQuantity += operation.quantity;
            } else {
              totalQuantity -= operation.quantity;
            }
          }

          itemUnitDetails.add(ItemUnitDetailsEntity(
            unitName: unit.name,
            unitFactor: itemUnit.unitFactor,
            quantity: totalQuantity,
            prices: [
              itemUnit.wholeSaleprice,
              itemUnit.retailPrice,
              itemUnit.spacialPrice
            ],
          ));
        }

        int totalQuantityInStore = 0;
        for (var i in itemUnitDetails) {
          totalQuantityInStore += i.quantity * i.unitFactor;
        }

        itemDetailsList.add(StoreItemDetailsEntity(
          totalQuantityInStore: totalQuantityInStore,
          item: item,
          group: group,
          itemAlter: itemAlters,
          itemUnits: itemUnits,
          itemUnitsDetails: itemUnitDetails,
        ));
      }

      return itemDetailsList;
    } catch (e) {
      throw LocalStorageException(message: e.toString());
    }
  }

  //
}
