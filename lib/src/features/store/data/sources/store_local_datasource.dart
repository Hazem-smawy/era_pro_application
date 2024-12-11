import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/error/exception.dart';
import 'package:era_pro_application/src/features/accounts/domain/usecases/delete_account_operation_usecase.dart';
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
  Future<void> deleteStoreOperations(OperationType op);
  Future<Uint8List?> getItemImageById(int id);
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

  // // @override
  // @override
  // Future<List<ItemModel>> getAllItems2() async {
  //   AppDatabase db = AppDatabase.instance();

  //   final query = db.selectOnly(db.itemTable)
  //     ..addColumns([
  //       db.itemTable.id,
  //       db.itemTable.itemGroupId,
  //       db.itemTable.itemCode,
  //       db.itemTable.name,
  //       db.itemTable.enName,
  //       db.itemTable.type,
  //       db.itemTable.itemLimit,
  //       db.itemTable.isExpire,
  //       db.itemTable.notifyBefore,
  //       db.itemTable.freeQuantityAllow,
  //       db.itemTable.hasTax,
  //       db.itemTable.taxRate,
  //       db.itemTable.itemCompany,
  //       db.itemTable.orignalCountry,
  //       db.itemTable.itemDescription,
  //       db.itemTable.note,
  //       db.itemTable.hasAlternated,
  //       db.itemTable.newData
  //     ]);

  //   final result = await query.get();

  //   final itemList = result.map((row) {
  //     return ItemModel(
  //       id: row.read(db.itemTable.id)!,
  //       itemGroupId: row.read(db.itemTable.itemGroupId)!,
  //       itemCode: row.read(db.itemTable.itemCode)!,
  //       name: row.read(db.itemTable.name)!,
  //       enName: row.read(db.itemTable.enName)!,
  //       type: row.read(db.itemTable.type)!,
  //       itemLimit: row.read(db.itemTable.itemLimit)!,
  //       isExpire: row.read(db.itemTable.isExpire)!,
  //       notifyBefore: row.read(db.itemTable.notifyBefore)!,
  //       freeQuantityAllow: row.read(db.itemTable.freeQuantityAllow)!,
  //       hasTax: row.read(db.itemTable.hasTax)!,
  //       taxRate: row.read(db.itemTable.taxRate)!,
  //       itemCompany: row.read(db.itemTable.itemCompany)!,
  //       orignalCountry: row.read(db.itemTable.orignalCountry)!,
  //       itemDescription: row.read(db.itemTable.itemDescription)!,
  //       note: row.read(db.itemTable.note)!,
  //       hasAlternated: row.read(db.itemTable.hasAlternated)!,
  //       newData: row.read(db.itemTable.newData)!,
  //     );
  //   }).toList();

  //   return itemList;
  // }

  // Execute the query and process the results

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

  @override
  Future<List<StoreItemDetailsEntity>> getAllItemsWithDetails() async {
    try {
      AppDatabase db = AppDatabase.instance();

      final query = db.selectOnly(db.itemTable)
        ..addColumns([
          db.itemTable.id,
          db.itemTable.itemGroupId,
          db.itemTable.itemCode,
          db.itemTable.name,
          db.itemTable.enName,
          db.itemTable.type,
          db.itemTable.itemLimit,
          db.itemTable.isExpire,
          db.itemTable.notifyBefore,
          db.itemTable.freeQuantityAllow,
          db.itemTable.hasTax,
          db.itemTable.taxRate,
          db.itemTable.itemCompany,
          db.itemTable.orignalCountry,
          db.itemTable.itemDescription,
          db.itemTable.note,
          db.itemTable.hasAlternated,
          db.itemTable.newData
        ]);

      final joinQuery = query.join([
        leftOuterJoin(
          db.itemGroupTable,
          db.itemGroupTable.code.equalsExp(db.itemTable.itemGroupId),
        ),
      ]);

      final itemDetailsList = <StoreItemDetailsEntity>[];

      final result = await joinQuery.get();

      for (final row in result) {
        final item = ItemModel(
          id: row.read(db.itemTable.id)!,
          itemGroupId: row.read(db.itemTable.itemGroupId)!,
          itemCode: row.read(db.itemTable.itemCode)!,
          name: row.read(db.itemTable.name)!,
          enName: row.read(db.itemTable.enName)!,
          type: row.read(db.itemTable.type)!,
          itemLimit: row.read(db.itemTable.itemLimit)!,
          itemImage: null, // Image explicitly excluded
          isExpire: row.read(db.itemTable.isExpire)!,
          notifyBefore: row.read(db.itemTable.notifyBefore)!,
          freeQuantityAllow: row.read(db.itemTable.freeQuantityAllow)!,
          hasTax: row.read(db.itemTable.hasTax)!,
          taxRate: row.read(db.itemTable.taxRate)!,
          itemCompany: row.read(db.itemTable.itemCompany)!,
          orignalCountry: row.read(db.itemTable.orignalCountry)!,
          itemDescription: row.read(db.itemTable.itemDescription)!,
          note: row.read(db.itemTable.note)!,
          hasAlternated: row.read(db.itemTable.hasAlternated)!,
          newData: row.read(db.itemTable.newData)!,
        );

        final group = row.readTableOrNull(db.itemGroupTable);

        final itemAlters = await (db.select(db.itemAlterTable)
              ..where((alt) => alt.itemId.equals(item.id)))
            .get();

        final itemUnits = await (db.select(db.itemUnitTable)
              ..where((unit) => unit.itemId.equals(item.id)))
            .get();

        final itemUnitsQuery = db.select(db.itemUnitTable).join([
          leftOuterJoin(
            db.unitTable,
            db.unitTable.id.equalsExp(db.itemUnitTable.itemUnitId),
          ),
        ])
          ..where(db.itemUnitTable.itemId.equals(item.id));

        final itemUnitDetails = <ItemUnitDetailsEntity>[];
        final itemUnitsResult = await itemUnitsQuery.get();

        for (final itemUnitRow in itemUnitsResult) {
          final unit = itemUnitRow.readTable(db.unitTable);
          final itemUnit = itemUnitRow.readTable(db.itemUnitTable);

          final operationsQuery = db.select(db.storeOperationTable)
            ..where((table) =>
                table.unitId.equals(unit.id) & table.itemId.equals(item.id));

          int totalQuantity = 0;
          final operationsResult = await operationsQuery.get();

          for (final operation in operationsResult) {
            totalQuantity += operation.quantity;
          }

          itemUnitDetails.add(ItemUnitDetailsEntity(
            unitName: unit.name,
            unitFactor: itemUnit.unitFactor,
            quantity: totalQuantity,
            prices: [
              itemUnit.wholeSaleprice,
              itemUnit.spacialPrice,
              itemUnit.retailPrice,
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

  @override
  Future<void> deleteStoreOperations(OperationType op) async {
    final db = AppDatabase.instance();
    await (db.delete(db.storeOperationTable)
          ..where(
            (storeOperation) =>
                storeOperation.operationId.equals(op.id) &
                storeOperation.operationType.equals(op.type),
          ))
        .go();
  }

  @override
  Future<Uint8List?> getItemImageById(int id) async {
    final db = AppDatabase.instance();
    return await db.getItemImage(id);
  }

  // @override
  // Future<List<ItemModel>> getAllItems() async {
  //   final db = AppDatabase.instance();
  //   final query = await db.customSelect(
  //     '''
  //   SELECT
  //     item_table.id AS id,
  //     item_table.item_group_id AS itemGroupId, -- Use the actual column names
  //     item_table.item_code AS itemCode,
  //     item_table.name AS name,
  //     item_table.en_name AS enName,
  //     item_table.type AS type,
  //     item_table.item_limit AS itemLimit,
  //     item_table.is_expire AS isExpire,
  //     item_table.notify_before AS notifyBefore,
  //     item_table.free_quantity_allow AS freeQuantityAllow,
  //     item_table.has_tax AS hasTax,
  //     item_table.tax_rate AS taxRate,
  //     item_table.item_company AS itemCompany,
  //     item_table.orignal_country AS orignalCountry,
  //     item_table.item_description AS itemDescription,
  //     item_table.note AS note,
  //     item_table.has_alternated AS hasAlternated,
  //     item_table.new_data AS newData
  //   FROM item_table
  //   LEFT JOIN store_operation_table
  //     ON item_table.id = store_operation_table.item_id -- Use actual column names
  //   GROUP BY item_table.id
  //   HAVING IFNULL(SUM(store_operation_table.quantity), 0) > 1
  //   ''',
  //     readsFrom: {db.itemTable, db.storeOperationTable},
  //   ).get();

  //   return query.map((row) {
  //     final data = row.data;
  //     return ItemModel(
  //       id: data['id'] as int,
  //       itemGroupId: data['itemGroupId'],
  //       itemCode: data['itemCode'],
  //       name: data['name'],
  //       enName: data['enName'],
  //       type: data['type'],
  //       itemLimit: data['itemLimit'],
  //       itemImage: null, // Exclude itemImage
  //       isExpire: (data['isExpire'] as int?) == 1,
  //       notifyBefore: data['notifyBefore'],
  //       freeQuantityAllow: (data['freeQuantityAllow'] as int?) == 1,
  //       hasTax: (data['hasTax'] as int?) == 1,
  //       taxRate: data['taxRate'],
  //       itemCompany: data['itemCompany'],
  //       orignalCountry: data['orignalCountry'],
  //       itemDescription: data['itemDescription'],
  //       note: data['note'],
  //       hasAlternated: (data['hasAlternated'] as int?) == 1,
  //       newData: (data['newData'] as int?) == 1,
  //     );
  //   }).toList();
  // }
  @override
  Future<List<ItemModel>> getAllItems() async {
    final db = AppDatabase.instance();
    final query = await db.customSelect(
      '''
    SELECT DISTINCT
      item_table.id AS id,
      item_table.item_group_id AS itemGroupId,
      item_table.item_code AS itemCode,
      item_table.name AS name,
      item_table.en_name AS enName,
      item_table.type AS type,
      item_table.item_limit AS itemLimit,
      item_table.is_expire AS isExpire,
      item_table.notify_before AS notifyBefore,
      item_table.free_quantity_allow AS freeQuantityAllow,
      item_table.has_tax AS hasTax,
      item_table.tax_rate AS taxRate,
      item_table.item_company AS itemCompany,
      item_table.orignal_country AS orignalCountry,
      item_table.item_description AS itemDescription,
      item_table.note AS note,
      item_table.has_alternated AS hasAlternated,
      item_table.new_data AS newData
    FROM item_table
    INNER JOIN store_operation_table
      ON item_table.id = store_operation_table.item_id
    WHERE store_operation_table.item_id IS NOT NULL
    ''',
      readsFrom: {db.itemTable, db.storeOperationTable},
    ).get();

    return query.map((row) {
      final data = row.data;
      return ItemModel(
        id: data['id'] as int,
        itemGroupId: data['itemGroupId'],
        itemCode: data['itemCode'],
        name: data['name'],
        enName: data['enName'],
        type: data['type'],
        itemLimit: data['itemLimit'],
        itemImage: null, // Exclude itemImage
        isExpire: (data['isExpire'] as int?) == 1,
        notifyBefore: data['notifyBefore'],
        freeQuantityAllow: (data['freeQuantityAllow'] as int?) == 1,
        hasTax: (data['hasTax'] as int?) == 1,
        taxRate: data['taxRate'],
        itemCompany: data['itemCompany'],
        orignalCountry: data['orignalCountry'],
        itemDescription: data['itemDescription'],
        note: data['note'],
        hasAlternated: (data['hasAlternated'] as int?) == 1,
        newData: (data['newData'] as int?) == 1,
      );
    }).toList();
  }

  //
}
