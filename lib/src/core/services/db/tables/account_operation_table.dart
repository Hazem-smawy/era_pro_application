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

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_operation_model.dart';

@UseRowClass(AccountOperationModel)
class AccountOperationTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get operationDate => dateTime()();
  IntColumn get operationType => integer()();
  IntColumn get operationId => integer()();
  TextColumn get operationRef => text()();
  IntColumn get accountNumber => integer()();
  RealColumn get operationDebit => real()();
  RealColumn get operationCredit => real()();
  IntColumn get currencyId => integer()();
  RealColumn get currencyValue => real()();
  TextColumn get operationStatement => text()();

  // @override
  // Set<Column> get primaryKey => {id};
}
