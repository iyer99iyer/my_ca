import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:your_ca/ui/shared/styles.dart';
import 'package:your_ca/ui/shared/ui_helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_ca/ui/widgets/chartAnalysisDurationButton.dart';
import 'package:your_ca/ui/widgets/homeMainButton.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(right: 18.0, left: 18.0, top: 42.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Hello Name, Profile Image
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello,',
                                style: GoogleFonts.roboto(fontSize: 18)),
                            verticalSpaceSmall,
                            Text('Vivek',
                                style: GoogleFonts.roboto(
                                    fontSize: 36, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const CircleAvatar(
                          child: FaIcon(FontAwesomeIcons.user),
                          radius: 30,
                        )
                      ],
                    ),
                    verticalSpaceLarge,
                    // Button Emergency Fund, Income, Expenses, In-Hand
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 110,
                          height: 35,
                          child: Center(
                              child: Text(
                            'Emergency Fund',
                            style: GoogleFonts.roboto(
                                fontSize: 13, fontWeight: FontWeight.w800),
                          )),
                          decoration: BoxDecoration(
                            color: kcEmergencyFund,
                            borderRadius: BorderRadius.circular(16.0),
                            border: Border.all(width: 1.0),
                          ),
                        ),
                        verticalSpaceSmall,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            HomeMainButton(
                              buttonTypeName: 'Income',
                              amount: '30,000',
                              color: kcIncomeButtonColor,
                            ),
                            HomeMainButton(
                              buttonTypeName: 'Expenses',
                              amount: '20,000',
                              color: kcExpenditureButtonColor,
                            ),
                            HomeMainButton(
                              buttonTypeName: 'Cash In-Hand',
                              amount: '10,000',
                              color: kcSelectColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                    verticalSpaceLarge,
                    // Button Monthly, Quarterly, Yearly and Projected
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ChartAnalysisDurationButton(
                                buttonTitle: 'Monthly', selected: model.currentSelectChartDurationButton == 'Monthly', onTap:()=> model.onChartDurationButton('Monthly'),),
                            ChartAnalysisDurationButton(
                                buttonTitle: 'Quarterly', selected: model.currentSelectChartDurationButton == 'Quarterly', onTap:()=> model.onChartDurationButton('Quarterly'),),
                            ChartAnalysisDurationButton(
                                buttonTitle: 'Yearly', selected: model.currentSelectChartDurationButton == 'Yearly', onTap:()=> model.onChartDurationButton('Yearly'),),
                          ],
                        ),
                        ChartAnalysisDurationButton(
                            buttonTitle: 'Projected', selected: model.currentSelectChartDurationButton == 'Projected', onTap:()=> model.onChartDurationButton('Projected'),),
                      ],
                    ),
                    verticalSpaceSmall,
                    Container(
                      child: SfCircularChart(
                          title: ChartTitle(
                              text: 'Expenses for the current '+model.currentSelectChartDurationButton,
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w800)),
                          legend: Legend(
                            isVisible: true,
                          ),
                          series: <PieSeries<PieData, String>>[
                            PieSeries<PieData, String>(
                              explode: true,
                              explodeIndex: 0,
                              dataSource: model.pieData,
                              xValueMapper: (PieData data, _) => data.xData,
                              yValueMapper: (PieData data, _) => data.yData,
                              dataLabelMapper: (PieData data, _) => data.text,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true),
                            ),
                          ]),
                      decoration: BoxDecoration(
                          color: kcSelectColor,
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    verticalSpaceMedium,
                    Text(
                      'Expenses',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    verticalSpaceSmall,
                    Container(
                      width: double.infinity,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ExpenseListTile(),
                          ExpenseListTile(),
                          ExpenseListTile(),

                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    Text(
                      'Income',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    verticalSpaceSmall,
                    Container(
                      width: double.infinity,
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          ExpenseListTile(),
                          ExpenseListTile(),
                          ExpenseListTile(),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class ExpenseListTile extends StatelessWidget {
  const ExpenseListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListTile(
        leading: CircleAvatar(
          child: FaIcon(
            FontAwesomeIcons.moneyBill,
            color: Colors.green,
          ),
          backgroundColor: Colors.white,
        ),
        title: Text(
          'Bills',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800),
        ),
        trailing: Text(
          '₹300',
          style: TextStyle(
              color: kcExpenditureColor, fontSize: 18),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 5),
    );
  }
}
