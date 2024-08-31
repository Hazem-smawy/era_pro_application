import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/main_info/domain/entities/item_alter_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_alter_model.g.dart';

@JsonSerializable()
class ItemAlterModel extends ItemAlterEntity {
  const ItemAlterModel({
    required super.id,
    required super.itemId,
    required super.itemAlterId,
    required super.itemOrder,
  });

  factory ItemAlterModel.formJson(Map<String, dynamic> json) =>
      _$ItemAlterModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemAlterModelToJson(this);
  static List<ItemAlterModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => ItemAlterModel.formJson(value)).toList();
  }

  ItemAlterTableCompanion toCompanion() {
    return ItemAlterTableCompanion(
      id: Value(id),
      itemId: Value(itemId),
      itemAlterId: Value(itemAlterId),
      itemOrder: Value(itemOrder),
    );
  }
}
