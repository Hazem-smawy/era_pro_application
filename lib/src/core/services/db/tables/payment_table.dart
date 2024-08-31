import 'package:drift/drift.dart';
import 'package:era_pro_application/src/features/main_info/data/models/payment_model.dart';

/*

   required super.id,
    required super.userId,
    required super.methodName,
    required super.newData,
    required super.isDefault,
    required super.methodNote,
*/
@UseRowClass(PaymentModel)
class PaymentTable extends Table {
  IntColumn get id => integer()();
  IntColumn get userId => integer()();
  TextColumn get methodName => text()();

  TextColumn get methodNote => text()();
  BoolColumn get newData => boolean()();
  BoolColumn get isDefault => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
