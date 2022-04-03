import 'package:drift/drift.dart';

class Transactions extends Table {

  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text().withLength(max: 8)();
  DateTimeColumn get transactionDateTime => dateTime()();
  RealColumn get amount => real()();
  TextColumn get transactionMode => text()();
  BoolColumn get recurring => boolean()();
  TextColumn get category => text()();
  TextColumn get recurringDuration => text().nullable()();
  TextColumn get transactionNote => text().withDefault(const Constant('Un-Named'))();
  IntColumn get warranty => integer().nullable()();
  TextColumn get warrantyDurationType => text().nullable()();
  TextColumn get filePath => text().nullable()();

}