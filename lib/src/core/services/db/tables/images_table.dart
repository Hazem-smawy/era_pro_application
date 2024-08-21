import 'package:drift/drift.dart';

class Images extends Table {
  IntColumn get id => integer().autoIncrement()();
  BlobColumn get imageData => blob()(); // Storing image as binary data
  IntColumn get relatedRecordId => integer()(); // Foreign key to Users table
  TextColumn get relatedTable => text().withLength(
      min: 1,
      max: 50)(); // The name of the related table, e.g., 'users', 'products'
}
