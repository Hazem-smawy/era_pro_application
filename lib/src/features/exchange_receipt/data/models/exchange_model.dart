import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/exchange_receipt/data/models/check_operation_model.dart';
import 'package:era_pro_application/src/features/exchange_receipt/data/models/sand_detail_model.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';
import '../../domain/entities/check_operation_entity.dart';
import '../../domain/entities/exchange_entity.dart';
import '../../domain/entities/sand_details_entity.dart';

part 'exchange_model.g.dart';

// ExchangeModel extending ExchangeEntity
@JsonSerializable(explicitToJson: true)
class ExchangeModel extends ExchangeEntity {
  ExchangeModel({
    super.id,
    required super.sandType,
    required super.isCash,
    required super.branchId,
    required super.sandNumber,
    required super.sandDate,
    required super.fundNumber,
    required super.currencyId,
    required super.currencyValue,
    required super.reciepentName,
    required super.totalAmount,
    required super.sandNote,
    required super.refNumber,
    super.sandDetails,
    super.checkOperations,
  });

  // JSON Serialization
  factory ExchangeModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExchangeModelToJson(this);

  ExchangesTableCompanion toCompanion() {
    return ExchangesTableCompanion(
      id: id == null ? const Value.absent() : Value(id!),
      sandType: Value(sandType),
      isCash: Value(isCash),
      branchId: Value(branchId),
      sandNumber: Value(sandNumber),
      sandDate: Value(sandDate),
      fundNumber: Value(fundNumber),
      currencyId: Value(currencyId),
      currencyValue: Value(currencyValue),
      reciepentName: Value(reciepentName),
      totalAmount: Value(totalAmount),
      sandNote: Value(sandNote),
      refNumber: Value(refNumber),
    );
  }

  static ExchangeModel fromEntity(ExchangeEntity entity) {
    return ExchangeModel(
      id: entity.id,
      sandType: entity.sandType,
      isCash: entity.isCash,
      branchId: entity.branchId,
      sandNumber: entity.sandNumber,
      sandDate: entity.sandDate,
      fundNumber: entity.fundNumber,
      currencyId: entity.currencyId,
      currencyValue: entity.currencyValue,
      reciepentName: entity.reciepentName,
      totalAmount: entity.totalAmount,
      sandNote: entity.sandNote,
      refNumber: entity.refNumber,
      sandDetails: entity.sandDetails
          ?.map((detail) => SandDetailModel.fromEntity(detail))
          .toList(),
      checkOperations: entity.checkOperations
          ?.map((operation) => CheckOperationModel.fromEntity(operation))
          .toList(),
    );
  }

  static List<ExchangeModel> fromEntityArray(List entities) {
    return entities.map((value) => ExchangeModel.fromEntity(value)).toList();
  }
}
