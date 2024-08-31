import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/branch_model.dart';

@UseRowClass(BranchModel)
class BranchTable extends Table {
  IntColumn get id => integer()();
  IntColumn get companyId => integer()();

  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get phone => text()();
  TextColumn get email => text()();
  TextColumn get arReportHeader => text()();
  TextColumn get enReportHeader => text()();
  BlobColumn get logo => blob()();

  TextColumn get note => text()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
