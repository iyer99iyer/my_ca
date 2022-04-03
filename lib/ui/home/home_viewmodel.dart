import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
// import 'package:wire_ropes/app/app.locator.dart';

class HomeViewModel extends BaseViewModel{

  // final _navigationService = locator<NavigationService>();

  late List<PieData> pieData;
  late String currentSelectChartDurationButton;

  Future init() async{

    currentSelectChartDurationButton = 'Monthly';

    pieData = [
      PieData('Bills', 35, 'Bills'),
      PieData('Rent', 28, 'Rent'),
      PieData('Recharge', 34, 'Recharge'),
      PieData('Tax', 32, 'Tax'),
      PieData('Grocery', 40, 'Grocery'),
      PieData('Gas', 35, 'Gas'),
      PieData('Milk', 28, 'Milk'),
      PieData('Loans/EMI', 34, 'Loans/EMI'),
      PieData('Home Loans', 32, 'Home Loans'),
      PieData('Insurance', 40, 'Insurance')
    ];
  }


  onChartDurationButton(String buttonTitle){
    if(buttonTitle!=currentSelectChartDurationButton){
      print(buttonTitle);
      currentSelectChartDurationButton = buttonTitle;
      notifyListeners();
    }
  }


  Map<String, double> dataMap = {
    "Fuel": 300,
    "Vegetable": 100,
    "Groceries": 60,
  };




}

class PieData {
  PieData(this.xData, this.yData, this.text);
  late final String xData;
  late final num yData;
  late final String text;
}