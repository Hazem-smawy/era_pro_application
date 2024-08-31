import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/company_model.dart';

@UseRowClass(CompanyModel)
class CompanyTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();
  TextColumn get enName => text()();
  TextColumn get shortName => text()();
  TextColumn get enShortName => text()();
  TextColumn get address => text()();
  TextColumn get website => text()();

  TextColumn get note => text()();
  BlobColumn get logo => blob()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
