import 'dart:ui';

import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:stacked/stacked.dart';
import 'package:your_ca/data/DAOs/transactionDAO/transaction_dao.dart';
import 'package:your_ca/ui/shared/constant.dart';
import 'package:your_ca/ui/shared/styles.dart';
import 'package:your_ca/ui/shared/ui_helpers.dart';

import '../../app/app.locator.dart';
import '../../data/drift_database.dart';
import 'transaction_viewmodel.dart';

class TransactionView extends StatelessWidget {
  final _database = locator<MyDatabase>();

  TransactionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TransactionViewModel>.reactive(
        onModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    // Title
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          right: 20, left: 20, top: 30, bottom: 10),
                      child: Text('Transactions',
                          style: GoogleFonts.roboto(
                              fontSize: 36, fontWeight: FontWeight.bold)),
                      decoration: BoxDecoration(),
                    ),
                    // Filtering Options
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 28,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          // TypeButton(
                          //   buttonName: 'Expenses',
                          //   onTap: (value)=> model.onTapType(value),
                          //   color: model.currentType == 0 ? model.currentThemeColor : null,
                          //   position: 0,
                          // ),
                          // horizontalSpaceTiny,
                          TransactionFilterButton(
                            onTapTransactionFilterButton: (String buttonName) =>
                                model.onTapTransactionFilterButton(buttonName),
                            buttonName: 'all',
                            currentButtonName: model.currentFilterButtonName,
                          ),
                          horizontalSpaceTiny,
                          TransactionFilterButton(
                            onTapTransactionFilterButton: (String buttonName) =>
                                model.onTapTransactionFilterButton(buttonName),
                            buttonName: 'income',
                            currentButtonName: model.currentFilterButtonName,
                          ),
                          horizontalSpaceTiny,
                          TransactionFilterButton(
                            onTapTransactionFilterButton: (String buttonName) =>
                                model.onTapTransactionFilterButton(buttonName),
                            buttonName: 'expense',
                            currentButtonName: model.currentFilterButtonName,
                          ),
                          horizontalSpaceTiny,
                          TransactionFilterButton(
                            onTapTransactionFilterButton: (String buttonName) =>
                                model.onTapTransactionFilterButton(buttonName),
                            buttonName: 'recurring',
                            currentButtonName: model.currentFilterButtonName,
                          ),
                          horizontalSpaceTiny,
                          Container(
                            height: 30,
                            child: VerticalDivider(
                              color: Colors.grey,
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: Center(
                              child: Text('Filter',
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold)),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all()),
                          ),
                          Container(
                              // child: ,
                              ),
                        ],
                      ),
                    ),
                    // Divider
                    Container(
                      width: physicalWidth,
                      height: 8,
                      child: Divider(
                        color: Colors.grey,
                        thickness: 2,
                      ),
                    ),
                    // Grouped List
                    Expanded(
                      child: StreamBuilder(
                        initialData: [],
                        stream: TransactionsDao(_database)
                            .getTransactionsStream(
                                model.currentFilterButtonName),
                        builder: (BuildContext context,
                                AsyncSnapshot<dynamic> snapshot) =>
                            GroupedListView<dynamic, String>(
                          shrinkWrap: true,
                          elements: snapshot.data,
                          groupBy: (element) =>
                              model.formatDate(element.transactionDateTime),
                          groupComparator: (value1, value2) =>
                               model.formatter.parse(value2).compareTo(model.formatter.parse(value1)),
                          // itemComparator: (item1, item2) =>
                          // (item1.transactionDateTime as DateTime)
                          //     .compareTo(item2.transactionDateTime as DateTime),
                          // order: GroupedListOrder.ASC,
                          useStickyGroupSeparators: true,
                          groupSeparatorBuilder: (String value) => Container(
                            height: 35,
                            color: kcPrimaryBackgroudColor,
                            child: Container(
                              margin: EdgeInsets.only(
                                  left: 8.0,
                                  right: 220.0,
                                  top: 4,
                                  bottom: 4),
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 4, top: 4, bottom: 4),
                              child: Text(
                                value,
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                    fontSize: 14, fontWeight: FontWeight.w900),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          itemBuilder: (c, transaction) {
                            return // margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                GestureDetector(
                              onTap: () {
                                // model.onTapTransaction(transaction)
                                model.onTap();
                              },
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      backgroundColor: Colors.yellow,
                                      // LinearGradient(colors: [Colors.yellow,Colors.amber],),
                                      child:
                                      Container(
                                        padding: EdgeInsets.all(32),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          gradient: LinearGradient(
                                          colors: [Colors.yellow,Colors.amber],
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('What do you want to do?',
                                                style: GoogleFonts.roboto(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600)),
                                            verticalSpaceSmall,
                                            Text('Transaction : ${transaction.transactionNote.toString()}'),
                                            verticalSpaceMedium,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                MaterialButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      model.onTapEditTransaction(
                                                          transaction);
                                                    },
                                                    color: Colors.green,
                                                    child: Text(
                                                      'Edit✏️',
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w600),
                                                    )),
                                                horizontalSpaceLarge,
                                                MaterialButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      model.onTapDeleteTransaction(
                                                          transaction);
                                                    },
                                                    color: Colors.redAccent,
                                                    child: Text(
                                                      'Delete 🗑️',
                                                      style: GoogleFonts.roboto(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w600),
                                                    ))
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),





                                    );
                                  },
                                );
                                // model.onLongPressTransaction(transaction);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    bottom: 0.5, top: 0.5),
                                child: ListTile(
                                    // contentPadding:
                                    // EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                                    leading: CircleAvatar(
                                      child: CircleAvatar(
                                        child: SvgPicture.asset(
                                          allPaymentModesSVGPath[
                                              transaction.transactionMode]!,
                                          height: 25,
                                          allowDrawingOutsideViewBox: true,
                                        ),
                                        backgroundColor: Colors.white,
                                        maxRadius: 20,
                                      ),
                                      backgroundColor: Colors.black,
                                      maxRadius: 21.5,
                                    ),
                                    title: Text(transaction.transactionNote,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500)),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(transaction.category,
                                            style: GoogleFonts.roboto(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                        Text(
                                            model.formatDateTime(transaction
                                                .transactionDateTime),
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                            ))
                                      ],
                                    ),
                                    trailing: Text(
                                      transaction.type == 'income'
                                          ? '+' +
                                              model.formatAmount(
                                                  transaction.amount)
                                          : '-' +
                                              model.formatAmount(
                                                  transaction.amount),
                                      style: GoogleFonts.roboto(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: transaction.type == 'income'
                                              ? kcIncomeColor
                                              : kcExpenditureColor),
                                    )),
                                color: transaction.type == 'income'
                                    ? kcIncomeTileColor
                                    : kcExpenseTileColor,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
        viewModelBuilder: () => TransactionViewModel());
  }
}

class TransactionFilterButton extends StatelessWidget {
  final Function(String buttonName) onTapTransactionFilterButton;
  final String buttonName;
  final String currentButtonName;

  const TransactionFilterButton({
    Key? key,
    required this.onTapTransactionFilterButton,
    required this.buttonName,
    required this.currentButtonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapTransactionFilterButton(buttonName),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6),
        height: 30,
        child: Center(
          child: Text(buttonName.toUpperCase(),
              style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: currentButtonName == buttonName
                      ? Colors.white
                      : Colors.black)),
        ),
        decoration: BoxDecoration(
          color:
              currentButtonName == buttonName ? kcPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

// showFlash(
// context: context,
// duration: const Duration(seconds: 120),
// persistent: false,
// builder: (context,controller){
// return Flash.dialog(
// controller: controller,
// borderRadius: BorderRadius.circular(8),
// backgroundGradient: LinearGradient(
// colors: [Colors.yellow,Colors.amber],
// ),
// margin: const EdgeInsets.all(8),
// child: FlashBar(
// title: Text('What do you want to do?',style:GoogleFonts.roboto(fontSize: 19,fontWeight: FontWeight.w600)),
// content: Text('Transaction : ${transaction.transactionNote.toString()}'),
// actions: [
// MaterialButton(
// onPressed:(){
// controller.dismiss();
// model.onTapTransaction(transaction);
// },
// color: Colors.green,
//
// child: Text('Edit✏️',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),)),
// horizontalSpaceLarge,
// MaterialButton(
// onPressed:(){
// controller.dismiss();
// model.onLongPressTransaction(transaction);
// },
// color: Colors.redAccent,
// child: Text('Delete 🗑️',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.w600),)
// )],
//
// ),
// );
// });
