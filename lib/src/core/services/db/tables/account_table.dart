/*
required super.id,
    required super.accNumber,
    required super.accName,
    required super.accParent,
    required super.accType,
    required super.accLevel,
    required super.note,
    required super.accCatagory,
    required super.accCatId,
    required super.accPhone,
    required super.address,
    required super.email,
    required super.accLimit,
    required super.paymentType,
    required super.branchId,
    required super.accStoped,
    required super.newData,
  */

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/accounts/data/models/account_model.dart';

@UseRowClass(AccountModel)
class AccountTable extends Table {
  IntColumn get id => integer()();
  IntColumn get accNumber => integer().unique()();
  TextColumn get accName => text()();
  IntColumn get accParent => integer()();
  IntColumn get accType => integer()();
  TextColumn get note => text()();
  IntColumn get accCatagory => integer()();
  IntColumn get accCatId => integer()();
  TextColumn get accPhone => text()();
  TextColumn get address => text()();
  TextColumn get email => text()();
  IntColumn get accLimit => integer()();
  IntColumn get paymentType => integer()();
  IntColumn get branchId => integer()();
  BoolColumn get accStoped => boolean()();
  BoolColumn get newData => boolean()();
  BlobColumn get image => blob().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
