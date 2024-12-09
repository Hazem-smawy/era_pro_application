/*
"id":1
"operationDate": "2024-08-27",
"operationType": 13,
"operationId": 3,
"operationRef": "",
"accountNumber": 10204010002,
"operationDebit": 2083.33,
"operationCredit": 0,
"currencyId": 1,
"currencyValue": 1,
"operationStatement": ""
*/
import 'package:equatable/equatable.dart';
import 'package:era_pro_application/src/core/utils/date_time_converter.dart';

class AccountsOperationsEntity extends Equatable {
  int? id;
  @DateTimeConverter()
  final DateTime operationDate;
  final int operationType;
  final int operationId;
  final String operationRef;
  final int accountNumber;
  final double operationDebit;
  final double operationCredit;
  final int currencyId;
  final double currencyValue;
  final String operationStatement;

  AccountsOperationsEntity(
      {this.id,
      required this.operationDate,
      required this.operationType,
      required this.operationId,
      required this.operationRef,
      required this.accountNumber,
      required this.operationDebit,
      required this.operationCredit,
      required this.currencyId,
      required this.currencyValue,
      required this.operationStatement});

  @override
  List<Object?> get props => [
        id,
        operationDate,
        operationType,
        operationId,
        operationRef,
        accountNumber,
        operationDebit,
        operationCredit,
        currencyId,
        currencyValue,
        operationStatement,
      ];
}
