import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:your_ca/app/app.locator.dart';
import 'package:your_ca/app/app.router.dart';
// import 'package:wire_ropes/app/app.locator.dart';

class StartupViewModel extends BaseViewModel{

  final _navigationService = locator<NavigationService>();

  Future init() async{

  }

  void doSomething(){
    _navigationService.navigateTo(Routes.mainPageView);
  }
}