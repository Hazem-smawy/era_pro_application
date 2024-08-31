/*
 required super.id,
    required super.docName,
    required super.docType,
*/

import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/system_doc_model.dart';

@UseRowClass(SystemDocModel)
class SystemDocTable extends Table {
  IntColumn get id => integer()();
  IntColumn get docType => integer()();
  TextColumn get docName => text()();

  @override
  Set<Column> get primaryKey => {id};
}
