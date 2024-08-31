import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/curency_model.dart';

@UseRowClass(CurencyModel)
class CurencyTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();
  TextColumn get symbol => text()();
  TextColumn get subName => text()();
  RealColumn get value => real()();
  RealColumn get equivelant => real()();
  BoolColumn get localCurrency => boolean()();
  BoolColumn get storeCurrency => boolean()();
  RealColumn get maxValue => real()();
  RealColumn get minValue => real()();
  TextColumn get note => text()();
  BoolColumn get newData => boolean()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
