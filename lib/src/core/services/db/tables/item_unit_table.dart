import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/item_units_model.dart';

/*

  required super.id,
    required super.itemId,
    required super.itemUnitId,
    required super.unitFactor,
    required super.wholeSaleprice,
    required super.retailPrice,
    required super.spacialPrice,
    required super.intialCost,
    required super.itemDiscount,
    required super.unitBarcode,
    required super.newData,
*/
@UseRowClass(ItemUnitsModel)
class ItemUnitTable extends Table {
  IntColumn get id => integer()();
  IntColumn get itemId => integer()();
  IntColumn get itemUnitId => integer()();
  IntColumn get unitFactor => integer()();
  RealColumn get wholeSaleprice => real()();
  RealColumn get retailPrice => real()();
  RealColumn get spacialPrice => real()();
  RealColumn get intialCost => real()();
  RealColumn get itemDiscount => real()();
  TextColumn get unitBarcode => text()();
  BoolColumn get newData => boolean()();
}
