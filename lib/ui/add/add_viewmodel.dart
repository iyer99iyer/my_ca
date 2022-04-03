import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:your_ca/app/app.locator.dart';
import 'package:your_ca/app/app.router.dart';

class AddViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  Future init() async{

  }

  navigateToAddCategory() {
    _navigationService.navigateTo(Routes.addCategoryView);
  }

  navigateToAddTransaction() {
    _navigationService.navigateTo(Routes.addTransactionView);
  }
}