import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:your_ca/data/DAOs/transactionDAO/transaction_dao.dart';
import 'package:your_ca/data/drift_database.dart';
import 'package:your_ca/ui/add_category/add_category_view.dart';
import 'package:your_ca/ui/transaction/transaction_view.dart';

import '../ui/MainPage/main_page_view.dart';
import '../ui/add_transaction/add_transaction_view.dart';
import '../ui/home/home_view.dart';
import '../ui/startup/startup_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: MainPageView),
    MaterialRoute(page: HomeView),
    CupertinoRoute(page: AddTransactionView),
    CupertinoRoute(page: AddCategoryView),
    MaterialRoute(page: TransactionView)
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    Singleton(classType: MyDatabase)
  ]
)
class AppSetup{
  /**Serves no purpose besides having an annotation attached to it */
}