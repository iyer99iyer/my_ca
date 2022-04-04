import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:your_ca/app/app.locator.dart';
import 'package:your_ca/ui/add/add_view.dart';
import 'package:your_ca/ui/add_category/add_category_view.dart';
import 'package:your_ca/ui/add_transaction/add_transaction_view.dart';
import 'package:your_ca/ui/home/home_view.dart';
import 'package:your_ca/ui/reports/reports_view.dart';
import 'package:your_ca/ui/tax_saving/tax_saving_view.dart';
import 'package:your_ca/ui/transaction/transaction_view.dart';

import '../../app/app.router.dart';

class MainPageViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();
  late int currentIndex;

  final screen = [
    HomeView(),
    // TaxSavingView(),
    // AddView(),
    TransactionView(),
    // ReportsView()
  ];

  Future init(int? currentIndex) async{

    if (currentIndex != null) {
      this.currentIndex = currentIndex;
    }else {
      this.currentIndex = 0;
    }
    notifyListeners();
  }

  onNavigationButton(int value) {
    print(value);
    currentIndex = value;
    notifyListeners();
  }
  navigateToAddCategory() {
    _navigationService.navigateTo(Routes.addCategoryView);
  }

  navigateToAddTransaction() {
    _navigationService.navigateTo(Routes.addTransactionView);
  }
}