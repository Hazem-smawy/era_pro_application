import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/store/domain/entities/store_operation_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';

part 'store_operation_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class StoreOperationModel extends StoreOperationEntity {
  StoreOperationModel({
    super.id,
    required super.operationId,
    required super.operationType,
    required super.operationDate,
    required super.operationIn,
    required super.storeId,
    required super.itemId,
    required super.unitId,
    required super.quantity,
    required super.averageCost,
    required super.unitCost,
    required super.totalCost,
    required super.unitFactor,
    required super.qtyConvert,
    required super.expirDate,
    required super.addBranch,
  });

  factory StoreOperationModel.fromJson(Map<String, dynamic> json) =>
      _$StoreOperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$StoreOperationModelToJson(this);

  static List<StoreOperationModel> fromJsonArray(List jsonArray) {
    return jsonArray
        .map((value) => StoreOperationModel.fromJson(value))
        .toList();
  }

  StoreOperationTableCompanion toCompanion() {
    return StoreOperationTableCompanion(
      id: Value(id),
      operationId: Value(operationId),
      operationType: Value(operationType),
      operationDate: Value(operationDate),
      operationIn: Value(operationIn),
      storeId: Value(storeId),
      itemId: Value(itemId),
      unitId: Value(unitId),
      quantity: Value(quantity),
      averageCost: Value(averageCost),
      unitCost: Value(unitCost),
      totalCost: Value(totalCost),
      unitFactor: Value(unitFactor),
      qtyConvert: Value(qtyConvert),
      expirDate: Value(expirDate),
      addBranch: Value(addBranch),
    );
  }

  StoreOperationEntity toEntity() {
    return StoreOperationEntity(
      operationId: operationId,
      operationType: operationType,
      operationDate: operationDate,
      operationIn: operationIn,
      storeId: storeId,
      itemId: itemId,
      unitId: unitId,
      quantity: quantity,
      averageCost: averageCost,
      unitCost: unitCost,
      totalCost: totalCost,
      unitFactor: unitFactor,
      qtyConvert: qtyConvert,
      expirDate: expirDate,
      addBranch: addBranch,
    );
  }
}
