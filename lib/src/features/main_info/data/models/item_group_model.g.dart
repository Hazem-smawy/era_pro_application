// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemGroupModel _$ItemGroupModelFromJson(Map<String, dynamic> json) =>
    ItemGroupModel(
      id: (json['id'] as num).toInt(),
      code: (json['code'] as num).toInt(),
      name: json['name'] as String,
      type: (json['type'] as num).toInt(),
      parent: (json['parent'] as num).toInt(),
      note: json['note'] as String,
      newData: json['newData'] as bool,
    );

Map<String, dynamic> _$ItemGroupModelToJson(ItemGroupModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'type': instance.type,
      'parent': instance.parent,
      'note': instance.note,
      'newData': instance.newData,
    };
