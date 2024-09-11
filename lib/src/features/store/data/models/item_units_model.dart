import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_units_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item_units_model.g.dart';

@JsonSerializable()
class ItemUnitsModel extends ItemUnitsEntity {
  const ItemUnitsModel({
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
  });
  factory ItemUnitsModel.fromJson(Map<String, dynamic> json) =>
      _$ItemUnitsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemUnitsModelToJson(this);
  static List<ItemUnitsModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => ItemUnitsModel.fromJson(value)).toList();
  }

  ItemUnitTableCompanion toCompanion() {
    return ItemUnitTableCompanion(
      id: Value(id),
      itemId: Value(itemId),
      itemUnitId: Value(itemUnitId),
      unitFactor: Value(unitFactor),
      wholeSaleprice: Value(wholeSaleprice),
      retailPrice: Value(retailPrice),
      spacialPrice: Value(spacialPrice),
      intialCost: Value(intialCost),
      itemDiscount: Value(itemDiscount),
      unitBarcode: Value(unitBarcode),
      newData: Value(newData),
    );
  }
}
