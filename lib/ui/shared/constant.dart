
import 'package:drift/drift.dart';
import 'package:flutter/cupertino.dart';
import 'package:your_ca/data/drift_database.dart';

String CASH = 'Cash';
String UPI = 'UPI';
String NETBANKING = 'Net Banking';
String GOOGLEPAY = 'Google Pay';
String PHONEPE = 'Phone Pe';
String AMAZONPAY = 'Amazon Pay';
String DEBITCARD = 'Debit Card';
String CREDITCARD = 'Credit Card';

Map<String,String> allPaymentModesSVGPath =
{
  CASH:'images/money_cash.svg',
  UPI:'images/upi.svg',
  NETBANKING: 'images/netbanking.svg',
  GOOGLEPAY: 'images/google_pay.svg',
  PHONEPE: 'images/phonepe_logo.svg',
  AMAZONPAY: 'images/amazon.svg',
  DEBITCARD: 'images/debit_card.svg',
  CREDITCARD: 'images/credit_card.svg'
};

const List<CategoriesCompanion> kvExpenseCategoryList = [
  CategoriesCompanion(category: Value('Bills'),type: Value('expense')),
  CategoriesCompanion(category: Value('Rents'),type: Value('expense')),
  CategoriesCompanion(category: Value('Recharge'),type: Value('expense')),
  CategoriesCompanion(category: Value('Tax'),type: Value('expense')),
  CategoriesCompanion(category: Value('Electronics'),type: Value('expense')),
  CategoriesCompanion(category: Value('Grocery'),type: Value('expense')),
  CategoriesCompanion(category: Value('Gas'),type: Value('expense')),
  CategoriesCompanion(category: Value('Loans/EMI'),type: Value('expense')),
  CategoriesCompanion(category: Value('Home Loans'),type: Value('expense')),
  CategoriesCompanion(category: Value('Insurance'),type: Value('expense')),
  CategoriesCompanion(category: Value('Fees'),type: Value('expense')),
  CategoriesCompanion(category: Value('Premium'),type: Value('expense')),
  CategoriesCompanion(category: Value('Subscriptions'),type: Value('expense')),
  CategoriesCompanion(category: Value('Medical'),type: Value('expense')),
  CategoriesCompanion(category: Value('Maintenance'),type: Value('expense')),
  CategoriesCompanion(category: Value('Food and Restaurant'),type: Value('expense')),
  CategoriesCompanion(category: Value('Entertainment'),type: Value('expense')),
  CategoriesCompanion(category: Value('Others'),type: Value('expense')),
];

List<String> kvDurationList = ['Monthly', 'Quarterly', 'Yearly'];
List<String> kvWarrantyDurationTypeList = ['Years', 'Months', 'Days'];

List<CategoriesCompanion> kvIncomeCategoryList = [
  CategoriesCompanion(category: Value('Salary'),type: Value('income')),
  CategoriesCompanion(category: Value('Farming'),type: Value('income')),
  CategoriesCompanion(category: Value('Investment Returns'),type: Value('income')),
  CategoriesCompanion(category: Value('Business'),type: Value('income')),
  CategoriesCompanion(category: Value('Others'),type: Value('income')),
];

List<int> kvColorList = [
  0xFFE3A0A0,
  0xFFE3B4A0,
  0xFFE3D0A0,
  0xFFDAE3A0,
  0xFFB5E3A0,
  0xFFA0E3D3,
  0xFFA0CFE3,
  0xFFA0ABE3,
  0xFFBDA0E3,
  0xFFE3A0DC,
  0xFFC68484,
  0xFFC69C84,
  0xFFC6B084,
  0xFFC6BB84,
  0xFFBDC684,
  0xFFA5C684,
  0xFF84C68B,
  0xFF84C6BE,
  0xFF84A6C6,
  0xFF84A6C6,
  0xFF848BC6,
  0xFF9D84C6,
  0xFFB984C6,
  0xFFC6848C,
  0xFFF16A6A,
  0xFFF19B6A,
  0xFFF1CB6A,
  0xFFF1EC6A,
  0xFFBEF16A,
  0xFF6AF188,
  0xFF6AF1D9,
  0xFF6AB9F1,
  0xFF6A80F1,
  0xFF7D6AF1,
  0xFFAD6AF1,
  0xFFF16AEC,
  0xFFF16A9B,
  0xFFFF1818,
  0xFFFF6B18,
  0xFFFFA318,
  0xFFFFDA18,
  0xFFD1FF18,
  0xFF62FF18,
  0xFF18FFC8,
  0xFF18D5FF,
  0xFF1882FF,
  0xFF184BFF,
  0xFF5418FF,
  0xFFDF18FF
];