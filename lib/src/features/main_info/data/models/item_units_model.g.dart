// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_units_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemUnitsModel _$ItemUnitsModelFromJson(Map<String, dynamic> json) =>
    ItemUnitsModel(
      id: (json['id'] as num).toInt(),
      itemId: (json['item_id'] as num).toInt(),
      itemUnitId: (json['item_unit_id'] as num).toInt(),
      unitFactor: (json['unit_factor'] as num).toInt(),
      wholeSaleprice: (json['whole_saleprice'] as num).toDouble(),
      retailPrice: (json['retail_price'] as num).toDouble(),
      spacialPrice: (json['spacial_price'] as num).toDouble(),
      intialCost: (json['intial_cost'] as num).toDouble(),
      itemDiscount: (json['item_discount'] as num).toDouble(),
      unitBarcode: json['unit_barcode'] as String,
      newData: json['newData'] as bool,
    );

Map<String, dynamic> _$ItemUnitsModelToJson(ItemUnitsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'item_unit_id': instance.itemUnitId,
      'unit_factor': instance.unitFactor,
      'whole_saleprice': instance.wholeSaleprice,
      'retail_price': instance.retailPrice,
      'spacial_price': instance.spacialPrice,
      'intial_cost': instance.intialCost,
      'item_discount': instance.itemDiscount,
      'unit_barcode': instance.unitBarcode,
      'newData': instance.newData,
    };
