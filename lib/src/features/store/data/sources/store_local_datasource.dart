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
}
