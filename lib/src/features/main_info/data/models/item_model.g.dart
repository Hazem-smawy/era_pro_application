// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      id: (json['id'] as num).toInt(),
      itemGroupId: (json['item_group_id'] as num).toInt(),
      itemCode: (json['item_code'] as num).toInt(),
      name: json['name'] as String,
      enName: json['en_name'] as String,
      type: (json['type'] as num).toInt(),
      itemLimit: (json['item_limit'] as num).toInt(),
      itemImage: _$JsonConverterFromJson<String, Uint8List>(
          json['item_image'], const Uint8ListConverter().fromJson),
      isExpire: json['is_expire'] as bool? ?? false,
      notifyBefore: (json['notify_before'] as num).toInt(),
      freeQuantityAllow: json['free_quantity_allow'] as bool,
      hasTax: json['has_tax'] as bool? ?? false,
      taxRate: (json['tax_rate'] as num).toInt(),
      itemCompany: json['item_company'] as String,
      orignalCountry: json['orignal_country'] as String,
      itemDescription: json['item_description'] as String,
      note: json['note'] as String,
      hasAlternated: json['hase_alternated'] as bool,
      newData: json['newData'] as bool,
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'item_group_id': instance.itemGroupId,
      'item_code': instance.itemCode,
      'name': instance.name,
      'en_name': instance.enName,
      'type': instance.type,
      'item_limit': instance.itemLimit,
      'item_image': _$JsonConverterToJson<String, Uint8List>(
          instance.itemImage, const Uint8ListConverter().toJson),
      'is_expire': instance.isExpire,
      'notify_before': instance.notifyBefore,
      'free_quantity_allow': instance.freeQuantityAllow,
      'has_tax': instance.hasTax,
      'tax_rate': instance.taxRate,
      'item_company': instance.itemCompany,
      'orignal_country': instance.orignalCountry,
      'item_description': instance.itemDescription,
      'note': instance.note,
      'hase_alternated': instance.hasAlternated,
      'newData': instance.newData,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
