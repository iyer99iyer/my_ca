// These imports are only needed to open the database
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:your_ca/data/DAOs/transactionDAO/transaction_dao.dart';
import 'package:your_ca/data/database_tables/category_table.dart';
import 'package:your_ca/data/database_tables/transactions_table.dart';
import 'package:your_ca/data/drift_database.dart';


part 'drift_database.g.dart';

@DriftDatabase(tables: [Transactions,Categories], daos: [TransactionsDao])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file,logStatements: true);
  });
}