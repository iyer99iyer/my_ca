import 'dart:ui';

import 'package:drift/drift.dart' as drift;
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/editable_text.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:your_ca/app/app.locator.dart';
import 'package:your_ca/app/app.router.dart';
import 'package:your_ca/data/DAOs/categoryDAO/category_dao.dart';
import 'package:your_ca/data/DAOs/transactionDAO/transaction_dao.dart';
import 'package:your_ca/data/drift_database.dart';
import 'package:your_ca/ui/MainPage/main_page_view.dart';
import 'package:your_ca/ui/shared/styles.dart';
import 'package:your_ca/ui/transaction/transaction_view.dart';

import '../shared/constant.dart';

class AddTransactionViewModel extends FormViewModel {
  final DateFormat formatter = DateFormat('dd-MMMM-yyyy');
  final NumberFormat currencyFormatter =
      NumberFormat('##,##,##,###.##', "en_IN");

  Transaction? currentTransaction;

  final _navigationService = locator<NavigationService>();
  final _database = locator<MyDatabase>();

  // Controller Variables
  late TextEditingController _dateController;
  late TextEditingController _amountController;
  late TextEditingController _noteController;
  late TextEditingController _warrantyController;

  late String currentModeButton;
  late int currentType;
  late Color currentThemeColor;
  late Color currentCircleThemeColor;
  String? currentCategory;
  String? currentRecurringDuration;
  late String currentWarrantyDurationType;
  late bool recurring = false;
  late DateTime currentDateTime;

  // List<String> expenseRecurringCategoryList = kvExpenseRecurringCategoryList;

  List<String> durationList = kvDurationList;
  List<String> warrantyDurationTypeList = kvWarrantyDurationTypeList;

  // List<String> incomeRecurringCategoryList = kvIncomeRecurringCategoryList;

  List<String> currentCategoryList = [];

  Future init(
      void Function(FormViewModel model) listenToFormUpdated,
      TextEditingController dateController,
      TextEditingController amountController,
      TextEditingController noteController,
      TextEditingController warrantyController,
      {Transaction? transaction}) async {
    // Getting All Controllers
    _dateController = dateController;
    _amountController = amountController;
    _noteController = noteController;
    _warrantyController = warrantyController;

    currentTransaction = transaction;

    // Initializing the variables
    currentType = 0;
    currentWarrantyDurationType = warrantyDurationTypeList[0];
    currentModeButton = CASH;
    currentThemeColor = kcExpenditureButtonColor;
    currentCircleThemeColor = kcExpenditureColor;

    // currentCategoryList = expenseRecurringCategoryList;

    currentCategoryList = await getExpenseCategoryList();

    recurring = false;
    currentDateTime = DateTime.now();
    updateDateController();
    // currentCategory = recurringCategoryList[0];

    // Initializing Values When Editing Transaction
    if (transaction != null) {
      await initialiseValuesIfEditing(transaction);
    }

    notifyListeners();
  }

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  Future<void> initialiseValuesIfEditing(Transaction transaction) async {
    print(transaction);
    _dateController.text = formatter.format(transaction.transactionDateTime);
    currentDateTime = transaction.transactionDateTime;
    if (transaction.type == 'income') {
      currentCategoryList = await getIncomeCategoryList();
      currentType = 1;
      currentThemeColor = kcIncomeButtonColor;
      currentCircleThemeColor = kcIncomeColor;
    } else {
      currentCategoryList = await getExpenseCategoryList();
      currentType = 0;
      currentThemeColor = kcExpenditureButtonColor;
      currentCircleThemeColor = kcExpenditureColor;
    }
    _amountController.text = currencyFormatter.format(transaction.amount);
    currentModeButton = transaction.transactionMode;
    recurring = transaction.recurring;
    // might have to edit
    currentCategory = transaction.category;
    _noteController.text = transaction.transactionNote;
    if (transaction.recurring) {
      // might have to edit
      currentRecurringDuration = transaction.recurringDuration;
    } else if (!transaction.recurring && transaction.type != 'income') {
      _warrantyController.text = transaction.warranty == null ? '': transaction.warranty.toString();
      currentWarrantyDurationType = transaction.warrantyDurationType!;
    }
  }

  onTapType(int index) async {
    currentType = index;
    if (currentType == 0) {
      currentCategoryList = await getExpenseCategoryList();
      currentCategory = null;
      currentThemeColor = kcExpenditureButtonColor;
      currentCircleThemeColor = kcExpenditureColor;
    } else if (currentType == 1) {
      currentCategoryList = await getIncomeCategoryList();
      currentCategory = null;
      currentThemeColor = kcIncomeButtonColor;
      currentCircleThemeColor = kcIncomeColor;
    }
    notifyListeners();
  }

  onTapMode(String tappedModeButtonName) {
    currentModeButton = tappedModeButtonName;
    notifyListeners();
  }

  onChangedCategory(String categoryName) {
    currentCategory = categoryName;
    if(validateNote() != null) {
      _noteController.text = categoryName;
    }
    notifyListeners();
  }

  onTapRecurringButton(int tappedRecurringButton) {
    if (tappedRecurringButton == 0)
      recurring = true;
    else
      recurring = false;
    notifyListeners();
  }

  onChangedDuration(String durationName) {
    currentRecurringDuration = durationName;
    notifyListeners();
  }

  onChangedDurationType(String durationTypeName) {
    currentWarrantyDurationType = durationTypeName;
    notifyListeners();
  }

  void updateDateController() {
    currentDateTime = DateTime(
        currentDateTime.year,
        currentDateTime.month,
        currentDateTime.day,
        DateTime.now().hour,
        DateTime.now().minute,
        DateTime.now().second,
        DateTime.now().millisecond);
    _dateController.text = formatter.format(currentDateTime);
  }

  onChangedAmount(String value) {
    if (value.removeAllWhitespace.replaceAll(',', '') != '') {
      double number = double.parse(
          value.removeAllWhitespace.replaceAll(",", "").replaceAll(".", ".0"));
      // .replaceAll("..", "."));
      // print(currencyFormatter.format(number));
      _amountController.text = currencyFormatter.format(number);
      _amountController.selection = TextSelection.fromPosition(
          TextPosition(offset: _amountController.text.length));
    }
    validateAmount();
    notifyListeners();
  }

  onChangedNote(String value) {
    validateNote();
    notifyListeners();
  }

  onClickSaveButton() {
    // print('''
    // id : {AutoGenerated}
    // Type : ${currentType == 0 ? 'expense' : 'income'},
    // Date : $currentDateTime,
    // Amount : ${_amountController.text}
    // Mode : $currentModeButton,
    // Recurring : ${recurring ? 'recurring' : 'non-recurring'},
    // Category : $currentCategory,
    // Vendor/Note : ${_noteController.text}
    // Path : "c:/folder/userFiles/abc.pdf"
    // Duration : $currentRecurringDuration
    // ''');

    // double amount = double.parse(
    //     _amountController.text.removeAllWhitespace.replaceAll(",", "").replaceAll(".", ".0"));
    if (validateCategory() == null &&
        validateNote() == null &&
        validateAmount() == null &&
        validateRecurringDuration() == null) {
      TransactionsCompanion updatedTransaction = TransactionsCompanion(
        type: drift.Value(currentType == 0 ? 'expense' : 'income'),
        transactionDateTime: drift.Value(currentDateTime),
        amount: drift.Value(double.parse(
            _amountController.text.removeAllWhitespace.replaceAll(",", ""))),
        transactionMode: drift.Value(currentModeButton),
        recurring: drift.Value(recurring),
        recurringDuration: drift.Value(currentRecurringDuration),
        category: drift.Value(currentCategory!),
        transactionNote: drift.Value(_noteController.text),
        warranty: drift.Value(_warrantyController.text != ''
            ? int.parse(_warrantyController.text)
            : null),
        warrantyDurationType: drift.Value(_warrantyController.text != ''
            ? currentWarrantyDurationType
            : null),
      );
      // print(updatedTransaction);

      if (currentTransaction != null) {
        TransactionsDao(_database).updateTransaction(updatedTransaction
            .copyWith(id: drift.Value(currentTransaction!.id)));
      } else {
        TransactionsDao(_database).insertTransaction(updatedTransaction);
      }

      // Clearing the Stack of Navigation and Navigating to Main Page View with Index 3 to go to transaction screen
      _navigationService
          .clearTillFirstAndShowView(const MainPageView(currentIndex: 3));
      reset();
    } else {
      //TODO: Add SnackBar
      print('Enter the values that are highlighted!');
    }
    // _navigationService.clearStackAndShow(Routes.mainPageView,parameters: {} );
  }

  reset() async {
    // Resetting All Controllers
    // _dateController.text = '';
    _amountController.text = '';
    _noteController.text = '';
    _warrantyController.text = '';

    // Initializing the variables
    currentType = 0;
    currentWarrantyDurationType = warrantyDurationTypeList[0];
    currentModeButton = CASH;
    currentThemeColor = kcExpenditureButtonColor;
    currentCircleThemeColor = kcExpenditureColor;
    currentCategoryList = await getExpenseCategoryList();
    recurring = false;
    // currentDateTime = DateTime.now();
    // updateDateController();
  }

  // Validators

  validateAmount() {
    // print(_amountController.text);
    if (_amountController.text == '')
      // return 'Amount can\'t be empty';
      return 'Required';
    else
      return null;
    notifyListeners();
  }

  validateNote() {
    if (_noteController.text == '')
      // return 'Please Enter a note';
      return 'Required';
    else
      return null;
  }

  validateCategory() {
    if (currentCategory != null)
      return null;
    else
      // return 'Please select a Category';
      return 'Required';
  }

  validateRecurringDuration() {
    if (!recurring) return null;
    if (currentRecurringDuration != null)
      return null;
    else
      // return 'Please select a Category';
      return 'Required';
  }

  Future<List<String>> getExpenseCategoryList() async {
    List<String> categoryList = [];
    List<Category> expenseCategoryList = await CategoriesDao(_database).getAllCategories('expense');
    for(Category category in expenseCategoryList){
      categoryList.add(category.category);
    }
    return categoryList;
  }

  Future<List<String>> getIncomeCategoryList() async {
    List<String> categoryList = [];
    List<Category> expenseCategoryList = await CategoriesDao(_database).getAllCategories('income');
    for(Category category in expenseCategoryList){
      categoryList.add(category.category);
    }
    return categoryList;
  }
}
