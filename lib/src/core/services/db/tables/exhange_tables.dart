import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/exchange_receipt/data/models/exchange_model.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/check_operation_entity.dart';
import 'package:era_pro_application/src/features/exchange_receipt/domain/entities/sand_details_entity.dart';

@UseRowClass(ExchangeModel)
class ExchangesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sandType => integer()();
  BoolColumn get isCash => boolean()();
  IntColumn get branchId => integer()();
  IntColumn get sandNumber => integer()();
  DateTimeColumn get sandDate => dateTime()();
  IntColumn get fundNumber => integer()();
  IntColumn get currencyId => integer()();
  RealColumn get currencyValue => real()();
  TextColumn get reciepentName => text()();
  RealColumn get totalAmount => real()();
  TextColumn get sandNote => text()();
  TextColumn get refNumber => text()();
}

@UseRowClass(SandDetailEntity)
class SandDetailsTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // Non-nullable primary key
  IntColumn get sandId =>
      integer().references(ExchangesTable, #id)(); // Foreign key
  IntColumn get accNumber => integer()(); // Non-nullable
  RealColumn get amount => real()(); // Non-nullable
  IntColumn get currencyId => integer()(); // Non-nullable
  RealColumn get currencyValue => real()(); // Non-nullable
}

@UseRowClass(CheckOperationEntity)
class CheckOperationsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get sandId => integer().references(ExchangesTable, #id)();
  TextColumn get operationNumber => text()();
  DateTimeColumn get operationDate => dateTime()();
  IntColumn get paymentMethed => integer()();
  BoolColumn get operationState => boolean()();
}
