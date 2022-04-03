import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:your_ca/app/app.locator.dart';
import 'package:your_ca/data/DAOs/transactionDAO/transaction_dao.dart';
import 'package:your_ca/data/database_tables/transactions_table.dart';
import 'package:your_ca/ui/add_transaction/add_transaction_view.dart';

import '../../data/drift_database.dart';

class TransactionViewModel extends BaseViewModel{

  final DateFormat formatter = DateFormat('dd-MMMM-yyyy');
  final DateFormat formatterDateTime = DateFormat('dd-MM-yyyy').add_jm();
  final NumberFormat currencyFormatter =
  NumberFormat('##,##,##,###.##', "en_IN");

  final _navigationService = locator<NavigationService>();
  final _database = locator<MyDatabase>();



  List elements = [
    {'name': 'Petrol', 'group': '15-March-2022', 'type':'expense', 'category':'Fuel','amount':'350'},
    {'name': 'AC EMI', 'group': '14-March-2022','type':'expense', 'category':'Electronic','amount':'2,900'},
    {'name': 'Lemon', 'group': '15-March-2022','type':'expense', 'category':'Vegetables','amount':'100'},
    {'name': 'Vegetable-weekly', 'group': '14-March-2022','type':'expense', 'category':'Fuel','amount':'1,000'},
    {'name': 'Internet-Bill', 'group': '24-March-2022','type':'expense', 'category':'Bill','amount':'1,179'},
    {'name': 'Gas', 'group': '08-March-2022','type':'expense', 'category':'Gas','amount':'950'},
    {'name': 'Mutual Fund Elss', 'group': '02-March-2022','type':'expense', 'category':'Investment','amount':'5,000'},
    {'name': 'Salary-March-22', 'group': '01-March-2022','type':'income', 'category':'Salary','amount':'48,000'},
    {'name': 'Salary-March-22', 'group': '02-March-2022','type':'income', 'category':'Salary','amount':'48,000'},
    {'name': 'Salary-March-22', 'group': '02-March-2022','type':'income', 'category':'Salary','amount':'48,000'},
  ];
  List<Transaction> transactionList = [];
  Stream<List<Transaction>>? stream;

  String currentFilterButtonName = 'all';

  Future init() async{
    await getAllTransactions();
    notifyListeners();
  }

  onTap() async {

    stream = TransactionsDao(_database).getTransactionsStream('all');
    transactionList = await TransactionsDao(_database).getAllTransactions();

    List<Transaction>data = await stream!.first;
    // print(await stream!.first);
      for(Transaction transaction in data){
      print('Stream :'+transaction.transactionDateTime.toString());
     }
      print('-------------------------------------------------------------');
    // print(await stream!.first);
    for(Transaction transaction in transactionList){
      print('Normal :'+transaction.transactionDateTime.toString());
    }
  }

  String formatDate(DateTime currentDateTime) => formatter.format(currentDateTime);

  String formatDateTime(DateTime currentDateTime) => formatterDateTime.format(currentDateTime);

  String formatAmount(double amount) => currencyFormatter.format(amount);

  onTapEditTransaction(Transaction transaction) async {
    await _navigationService.navigateToView(AddTransactionView(transaction: transaction,));
    await getAllTransactions();
    notifyListeners();
  }

  getAllTransactions() async {
    transactionList = await TransactionsDao(_database).getAllTransactions();
  }

  onTapDeleteTransaction(transaction) {
    // print(transaction.transactionNote+transaction.);
    TransactionsDao(_database).deleteTransaction(transaction);
  }

  onTapTransactionFilterButton(String buttonName) async {
    currentFilterButtonName = buttonName;
    transactionList = await TransactionsDao(_database).getAllTransactions();
    notifyListeners();
  }


}