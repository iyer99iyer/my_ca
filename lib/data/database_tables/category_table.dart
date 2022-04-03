import 'package:drift/drift.dart';

@DataClassName("Category")
class Categories extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().withLength(max: 8)();
  TextColumn get category => text()();
  TextColumn get note => text().nullable()();

}