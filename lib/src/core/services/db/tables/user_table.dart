import 'package:drift/drift.dart';

// @UseRowClass()
class User extends Table {
  IntColumn get id => integer()();

  TextColumn get username => text()();

  TextColumn get musicStyle => text()();

  TextColumn get favoriteSongName => text()();

  ///Specifying which from the field above is the primary key
  @override
  Set<Column> get primaryKey => {id};
}
