// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BarcodeModel _$BarcodeModelFromJson(Map<String, dynamic> json) => BarcodeModel(
      id: (json['id'] as num).toInt(),
      itemId: (json['item_id'] as num).toInt(),
      itemBarcode: json['item_barcode'] as String,
    );

Map<String, dynamic> _$BarcodeModelToJson(BarcodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_id': instance.itemId,
      'item_barcode': instance.itemBarcode,
    };
