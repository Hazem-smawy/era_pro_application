// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bill_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BillDetailsModel _$BillDetailsModelFromJson(Map<String, dynamic> json) =>
    BillDetailsModel(
      id: (json['id'] as num?)?.toInt(),
      billID: (json['billID'] as num).toInt(),
      itemId: (json['itemId'] as num).toInt(),
      itemUnitID: (json['itemUnitID'] as num).toInt(),
      unitFactor: (json['unitFactor'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      freeQty: (json['freeQty'] as num).toInt(),
      avrageCost: (json['avrageCost'] as num).toDouble(),
      sellPrice: (json['sellPrice'] as num).toDouble(),
      totalSellPrice: (json['totalSellPrice'] as num).toDouble(),
      discountPre: (json['discountPre'] as num).toDouble(),
      netSellPrice: (json['netSellPrice'] as num).toDouble(),
      expirDate: json['expirDate'] as String?,
      taxRate: (json['taxRate'] as num).toDouble(),
      itemNote: json['itemNote'] as String,
      freeQtyCost: (json['freeQtyCost'] as num).toDouble(),
    );

Map<String, dynamic> _$BillDetailsModelToJson(BillDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'billID': instance.billID,
      'itemId': instance.itemId,
      'itemUnitID': instance.itemUnitID,
      'unitFactor': instance.unitFactor,
      'quantity': instance.quantity,
      'freeQty': instance.freeQty,
      'avrageCost': instance.avrageCost,
      'sellPrice': instance.sellPrice,
      'totalSellPrice': instance.totalSellPrice,
      'discountPre': instance.discountPre,
      'netSellPrice': instance.netSellPrice,
      'expirDate': instance.expirDate,
      'taxRate': instance.taxRate,
      'itemNote': instance.itemNote,
      'freeQtyCost': instance.freeQtyCost,
    };
