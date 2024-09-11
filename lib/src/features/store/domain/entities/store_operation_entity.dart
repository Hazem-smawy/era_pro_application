/*

        "id": 50171,
        "operationId": 3,
        "operationType": 13,
        "operationDate": "2024-08-27",
        "operationIn": true,
        "storeId": 4,
        "itemId": 5,
        "unitId": 2,
        "quantity": 10,
        "averageCost": 208.333,
        "unitCost": 208.333,
        "totalCost": 2083.33,
        "unitFactor": 1,
        "qtyConvert": 10,
        "expirDate": "2024-12",
        "addBranch": 1
        */

import 'package:equatable/equatable.dart';
import 'package:era_pro_application/src/core/utils/date_time_converter.dart';

// ignore: must_be_immutable
class StoreOperationEntity extends Equatable {
  int id;
  final int operationId;
  final int operationType;
  @DateTimeConverter()
  final DateTime operationDate;
  final bool operationIn;
  final int storeId;
  final int itemId;
  final int unitId;
  final int quantity;
  final double averageCost;
  final double unitCost;
  final double totalCost;
  final int unitFactor;
  final int qtyConvert;
  final String expirDate;
  final int addBranch;

  StoreOperationEntity({
    this.id = -1,
    required this.operationId,
    required this.operationType,
    required this.operationDate,
    required this.operationIn,
    required this.storeId,
    required this.itemId,
    required this.unitId,
    required this.quantity,
    required this.averageCost,
    required this.unitCost,
    required this.totalCost,
    required this.unitFactor,
    required this.qtyConvert,
    required this.expirDate,
    required this.addBranch,
  });

  @override
  List<Object?> get props => [
        id,
        operationId,
        operationType,
        operationDate,
        operationIn,
        storeId,
        itemId,
        unitId,
        quantity,
        averageCost,
        unitCost,
        totalCost,
        unitFactor,
        qtyConvert,
        expirDate,
        addBranch,
      ];
}
