import 'package:drift/drift.dart';
import 'package:your_ca/data/database_tables/transactions_table.dart';
import 'package:your_ca/data/drift_database.dart';


part 'transaction_dao.g.dart';

@DriftAccessor(tables: [Transactions])
class TransactionsDao extends DatabaseAccessor<MyDatabase> with _$TransactionsDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.

  // final MyDatabase db;

  TransactionsDao(MyDatabase db) : super(db);

  Future<List<Transaction>> getAllTransactions() => (select(transactions)
    ..orderBy([
          (t)=> OrderingTerm(expression: t.transactionDateTime, mode: OrderingMode.desc)
    ]))
      .get();
  // Stream<List<Transaction>> getTransactionsStream() => select(transactions).watch();
  Stream<List<Transaction>> getTransactionsStream(String parameter) {
    if (parameter == 'all') {
      return select(transactions).watch();
    } else if (parameter == 'income') {
      return (select(transactions)
          ..orderBy([
            (t)=> OrderingTerm(expression: t.transactionDateTime, mode: OrderingMode.desc)
          ])
          ..where((t) => t.type.equals(parameter)))
          .watch();
    }else if (parameter == 'expense') {
      return (select(transactions)
        ..orderBy([
              (t)=> OrderingTerm(expression: t.transactionDateTime, mode: OrderingMode.desc)
        ])
        ..where((t) => t.type.equals(parameter)))
          .watch();
    }else if (parameter == 'recurring') {
      return (select(transactions)
        ..orderBy([
              (t)=> OrderingTerm(expression: t.transactionDateTime, mode: OrderingMode.desc)
        ])
        ..where((t) => t.recurring.equals(true)))
          .watch();
    }else {
      return (select(transactions)
        ..orderBy([
              (t)=> OrderingTerm(expression: t.transactionDateTime, mode: OrderingMode.desc)
        ])).watch();
    }
  }
  Future insertTransaction(TransactionsCompanion transaction) => into(transactions).insert(transaction);
  Future deleteTransaction(Transaction transaction) => delete(transactions).delete(transaction);
  Future updateTransaction(TransactionsCompanion transaction) =>
      update(transactions).replace(transaction);
}