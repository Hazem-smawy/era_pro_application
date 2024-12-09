// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreOperationModel _$StoreOperationModelFromJson(Map<String, dynamic> json) =>
    StoreOperationModel(
      id: (json['id'] as num?)?.toInt() ?? 1,
      operationId: (json['operationId'] as num).toInt(),
      operationType: (json['operationType'] as num).toInt(),
      operationDate:
          const DateTimeConverter().fromJson(json['operationDate'] as String),
      operationIn: json['operationIn'] as bool,
      storeId: (json['storeId'] as num).toInt(),
      itemId: (json['itemId'] as num).toInt(),
      unitId: (json['unitId'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      averageCost: (json['averageCost'] as num).toDouble(),
      unitCost: (json['unitCost'] as num).toDouble(),
      totalCost: (json['totalCost'] as num).toDouble(),
      unitFactor: (json['unitFactor'] as num).toInt(),
      qtyConvert: (json['qtyConvert'] as num).toInt(),
      expirDate: json['expirDate'] as String,
      addBranch: (json['addBranch'] as num).toInt(),
    );

Map<String, dynamic> _$StoreOperationModelToJson(
        StoreOperationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operationId': instance.operationId,
      'operationType': instance.operationType,
      'operationDate': const DateTimeConverter().toJson(instance.operationDate),
      'operationIn': instance.operationIn,
      'storeId': instance.storeId,
      'itemId': instance.itemId,
      'unitId': instance.unitId,
      'quantity': instance.quantity,
      'averageCost': instance.averageCost,
      'unitCost': instance.unitCost,
      'totalCost': instance.totalCost,
      'unitFactor': instance.unitFactor,
      'qtyConvert': instance.qtyConvert,
      'expirDate': instance.expirDate,
      'addBranch': instance.addBranch,
    };
