import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/store/data/models/unit_model.dart';

@UseRowClass(UnitModel)
class UnitTable extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text()();

  TextColumn get note => text()();
  BoolColumn get newData => boolean()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
