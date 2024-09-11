import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/store/data/models/barcode_model.dart';

@UseRowClass(BarcodeModel)
class BarcodeTable extends Table {
  IntColumn get id => integer()();
  IntColumn get itemId => integer()();
  TextColumn get itemBarcode => text()();

  @override
  Set<Column> get primaryKey => {id};
}
