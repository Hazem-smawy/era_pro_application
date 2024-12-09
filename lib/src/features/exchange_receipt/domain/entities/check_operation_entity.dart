import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:era_pro_application/src/core/utils/date_time_converter.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/services/db/db.dart';

part 'check_operation_entity.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class CheckOperationEntity extends Equatable {
  int? id;
  int sandId;
  final String operationNumber;
  @DateTimeConverter()
  final DateTime operationDate;
  final int paymentMethed;
  final bool operationState;

  CheckOperationEntity({
    this.id,
    required this.sandId,
    required this.operationNumber,
    required this.operationDate,
    required this.paymentMethed,
    required this.operationState,
  });

  factory CheckOperationEntity.fromJson(Map<String, dynamic> json) =>
      _$CheckOperationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CheckOperationEntityToJson(this);

  @override
  List<Object?> get props => [
        id,
        sandId,
        operationNumber,
        operationDate,
        paymentMethed,
        operationState,
      ];

  CheckOperationsTableCompanion toCompanion() {
    return CheckOperationsTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      sandId: Value(sandId),
      operationNumber: Value(operationNumber),
      operationDate: Value(operationDate),
      paymentMethed: Value(paymentMethed),
      operationState: Value(operationState),
    );
  }
}
