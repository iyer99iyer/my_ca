import 'package:drift/drift.dart' as drift;
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:your_ca/data/DAOs/categoryDAO/category_dao.dart';
import 'package:your_ca/data/drift_database.dart';
import 'package:your_ca/ui/shared/constant.dart';
import 'package:your_ca/ui/shared/styles.dart';
import 'package:flutter/material.dart';

import '../../app/app.locator.dart';

class AddCategoryViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  final _database = locator<MyDatabase>();

  late TextEditingController _categoryController;
  late TextEditingController _noteController;

  late Color currentPickerColor;

  late Color currentThemeColor;
  late int currentType;

  late List<int> colorList;

  late Color currentCircleThemeColor;

  bool categoryIfEmpty = true;

  List<Category> categoryList = [];

  Future init(
      void Function(FormViewModel model) listenToFormUpdated,
      TextEditingController categoryController,
      TextEditingController noteController,
      ) async{
    _categoryController = categoryController;
    _noteController = noteController;

    currentType = 0;
    currentThemeColor = kcExpenditureButtonColor;

    colorList = kvColorList;

    currentPickerColor = currentThemeColor;

    categoryList = await CategoriesDao(_database).getAllCategories(currentType == 0? 'expense':'income');

    if (categoryList.isEmpty) {
      categoryIfEmpty = true;
    }  else{
      categoryIfEmpty = false;
    }
    notifyListeners();

  }

  onChangedCategory(value){
    validateCategory();
    notifyListeners();
  }

  onTapColor(int index, BuildContext context) {
    currentPickerColor = Color(colorList[index]);
    notifyListeners();
    Navigator.pop(context);
  }

  onTapType(int index) {
    currentType = index;
    checkIfCategoryIsEmpty();
    if (currentType == 0) {
      currentThemeColor = kcExpenditureButtonColor;
      currentPickerColor = currentPickerColor == kcIncomeButtonColor ? kcExpenditureButtonColor : currentPickerColor;
    } else if (currentType == 1) {
      currentThemeColor = kcIncomeButtonColor;
      currentPickerColor = currentPickerColor == kcExpenditureButtonColor ? kcIncomeButtonColor : currentPickerColor;
    }
    notifyListeners();
  }

  validateCategory() {
    if (_categoryController.text == '')
      // return 'Please Enter a note';
      return 'Required';
    else
      return null;
  }

  onClickSaveButton() async {

    CategoriesCompanion categoriesCompanion = CategoriesCompanion(
      category: drift.Value(_categoryController.text),
      type: drift.Value(currentType == 0 ? 'expense':'income'),
      note: _noteController.text.removeAllWhitespace != ''? drift.Value(_noteController.text):const drift.Value.absent(),
    );

    if (validateCategory() == null) {
      await CategoriesDao(_database).insertCategory(categoriesCompanion);
    }

    List<Category> allCategoriesList = await CategoriesDao(_database).getAllCategories('income');
    print(allCategoriesList);
    _navigationService.popRepeated(1);
  }

  addDefaultCategories() async {
    if (currentType == 0) {
      for (CategoriesCompanion categoriesCompanion in kvExpenseCategoryList) {
        await CategoriesDao(_database).insertCategory(categoriesCompanion);
      }
    } else if (currentType == 1) {
      for (CategoriesCompanion categoriesCompanion in kvIncomeCategoryList) {
        await CategoriesDao(_database).insertCategory(categoriesCompanion);
      }
    }
    categoryIfEmpty = false;
    notifyListeners();
  }

  checkIfCategoryIsEmpty() async {
    categoryList = await CategoriesDao(_database).getAllCategories(currentType == 0? 'expense':'income');

    if (categoryList.isEmpty) {
      categoryIfEmpty = true;
    }  else{
      categoryIfEmpty = false;
    }
    notifyListeners();
  }


}