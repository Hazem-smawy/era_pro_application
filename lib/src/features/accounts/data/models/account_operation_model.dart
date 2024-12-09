import 'package:drift/drift.dart';
import 'package:era_pro_application/src/core/services/db/db.dart';
import 'package:era_pro_application/src/features/accounts/domain/entities/accounts_operations_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/utils/date_time_converter.dart';

part 'account_operation_model.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class AccountOperationModel extends AccountsOperationsEntity {
  AccountOperationModel({
    super.id,
    required super.operationDate,
    required super.operationType,
    required super.operationId,
    required super.operationRef,
    required super.accountNumber,
    required super.operationDebit,
    required super.operationCredit,
    required super.currencyId,
    required super.currencyValue,
    required super.operationStatement,
  });
  factory AccountOperationModel.fromJson(Map<String, dynamic> json) =>
      _$AccountOperationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountOperationModelToJson(this);

  static List<AccountOperationModel> fromJsonArray(List jsonArray) {
    return jsonArray
        .map((value) => AccountOperationModel.fromJson(value))
        .toList();
  }

  AccountOperationTableCompanion toCompanion() {
    return AccountOperationTableCompanion(
      id: const Value.absent(),
      accountNumber: Value(accountNumber),
      currencyId: Value(currencyId),
      currencyValue: Value(currencyValue),
      operationCredit: Value(operationCredit),
      operationDate: Value(operationDate),
      operationDebit: Value(operationDebit),
      operationId: Value(operationId),
      operationRef: Value(operationRef),
      operationStatement: Value(operationStatement),
      operationType: Value(operationType),
    );
  }

  static AccountOperationModel fromEntity(AccountsOperationsEntity entity) {
    return AccountOperationModel(
      id: entity.id,
      accountNumber: entity.accountNumber,
      currencyId: entity.currencyId,
      currencyValue: entity.currencyValue,
      operationCredit: entity.operationCredit,
      operationDate: entity.operationDate,
      operationDebit: entity.operationDebit,
      operationId: entity.operationId,
      operationRef: entity.operationRef,
      operationStatement: entity.operationStatement,
      operationType: entity.operationType,
    );
  }

  static List<AccountOperationModel> fromEntityArray(List entities) {
    return entities
        .map((value) => AccountOperationModel.fromEntity(value))
        .toList();
  }
}
