// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_alter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAlterModel _$ItemAlterModelFromJson(Map<String, dynamic> json) =>
    ItemAlterModel(
      id: (json['id'] as num).toInt(),
      itemId: (json['item_id'] as num).toInt(),
      itemAlterId: (json['item_alternative_id'] as num).toInt(),
      itemOrder: (json['item_order'] as num).toInt(),
    );

Map<String, dynamic> _$ItemAlterModelToJson(ItemAlterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'item_alternative_id': instance.itemAlterId,
      'item_order': instance.itemOrder,
    };
