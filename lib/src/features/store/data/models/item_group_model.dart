import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/store/domain/entities/item_group_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'item_group_model.g.dart';

@JsonSerializable()
class ItemGroupModel extends ItemGroupEntity {
  const ItemGroupModel({
    required super.id,
    required super.code,
    required super.name,
    required super.type,
    required super.parent,
    required super.note,
    required super.newData,
  });
  factory ItemGroupModel.fromJson(Map<String, dynamic> json) =>
      _$ItemGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemGroupModelToJson(this);
  static List<ItemGroupModel> fromJsonArray(List jsonArray) {
    return jsonArray.map((value) => ItemGroupModel.fromJson(value)).toList();
  }

  ItemGroupTableCompanion toCompanion() {
    return ItemGroupTableCompanion(
      id: Value(id),
      code: Value(code),
      name: Value(name),
      type: Value(type),
      parent: Value(parent),
      note: Value(note),
      newData: Value(newData),
    );
  }

  ItemGroupEntity toEntity() {
    return ItemGroupEntity(
      id: id,
      code: code,
      name: name,
      type: type,
      parent: parent,
      note: note,
      newData: newData,
    );
  }
}
