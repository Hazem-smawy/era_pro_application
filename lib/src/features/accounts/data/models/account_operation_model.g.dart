// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_operation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountOperationModel _$AccountOperationModelFromJson(
        Map<String, dynamic> json) =>
    AccountOperationModel(
      id: (json['id'] as num?)?.toInt(),
      operationDate:
          const DateTimeConverter().fromJson(json['operationDate'] as String),
      operationType: (json['operationType'] as num).toInt(),
      operationId: (json['operationId'] as num).toInt(),
      operationRef: json['operationRef'] as String,
      accountNumber: (json['accountNumber'] as num).toInt(),
      operationDebit: (json['operationDebit'] as num).toDouble(),
      operationCredit: (json['operationCredit'] as num).toDouble(),
      currencyId: (json['currencyId'] as num).toInt(),
      currencyValue: (json['currencyValue'] as num).toDouble(),
      operationStatement: json['operationStatement'] as String,
    );

Map<String, dynamic> _$AccountOperationModelToJson(
        AccountOperationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'operationDate': const DateTimeConverter().toJson(instance.operationDate),
      'operationType': instance.operationType,
      'operationId': instance.operationId,
      'operationRef': instance.operationRef,
      'accountNumber': instance.accountNumber,
      'operationDebit': instance.operationDebit,
      'operationCredit': instance.operationCredit,
      'currencyId': instance.currencyId,
      'currencyValue': instance.currencyValue,
      'operationStatement': instance.operationStatement,
    };
