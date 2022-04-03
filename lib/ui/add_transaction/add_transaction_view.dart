import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:your_ca/ui/add_transaction/add_transaction_view.dart';
import 'package:your_ca/ui/shared/styles.dart';
import 'package:your_ca/ui/shared/ui_helpers.dart';
import 'package:your_ca/ui/widgets/recurringButtons.dart';
import 'package:your_ca/ui/widgets/transferTypeButton.dart';
import 'package:your_ca/ui/widgets/typeButton.dart';

import '../../data/drift_database.dart';
import '../shared/constant.dart';
import 'add_transaction_view.form.dart';
import 'add_transaction_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'date'),
  FormTextField(name: 'amount'),
  FormTextField(name: 'note'),
  FormTextField(name: 'warranty'),
])
class AddTransactionView extends StatelessWidget with $AddTransactionView {

  final Transaction? transaction;

  AddTransactionView({Key? key, this.transaction}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<AddTransactionViewModel>.reactive(
        onModelReady: (model) => model.init(listenToFormUpdated,dateController,amountController,noteController,warrantyController, transaction: transaction),
        builder: (context, model, child) => Scaffold(
              body: SafeArea(
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.only(left: 20, top: 30, bottom: 15),
                      child: Text('Add Transaction',
                          style: GoogleFonts.roboto(
                              fontSize: 36, fontWeight: FontWeight.bold)),
                      decoration:
                          BoxDecoration(color:model.currentThemeColor),
                    ),
                    verticalSpaceMedium,
                    // Type
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text('Type :',style:GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                          horizontalSpaceMedium,
                          TypeButton(
                            buttonName: 'Expenses',
                            onTap: (value)=> model.onTapType(value),
                            color: model.currentType == 0 ? model.currentThemeColor : null,
                            position: 0,
                          ),
                          horizontalSpaceSmall,
                          TypeButton(
                            buttonName: 'Income',
                            onTap: (value)=> model.onTapType(value),
                            color: model.currentType == 1 ? model.currentThemeColor : null,
                            position: 1,
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    // Date
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20),
                      child: TextFormField(
                        // TODO: Add Datapicker
                        onTap: () async {
                          model.currentDateTime = (await showDatePicker(
                            context: context,
                            initialDate: model.currentDateTime,
                            firstDate: DateTime(1999),
                            lastDate: DateTime.now(),
                          ))!;
                          model.updateDateController();
                        },
                        controller: dateController,
                        focusNode: dateFocusNode,
                        readOnly: true,
                        style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          label: Text('Date'),
                          hintText: '03-March-2022',
                          suffixIcon: Container(child: Icon(Icons.calendar_today_sharp)),
                          // suffixIconConstraints:
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    verticalSpaceMedium,
                    // Amount
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          onChanged: (value)=>model.onChangedAmount(value),
                          keyboardType: TextInputType.number,
                          controller: amountController,
                          focusNode: amountFocusNode,
                          style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)
                            ),
                            label: Text('Amount'),
                            suffixIcon:

                            GestureDetector(
                              // TODO: Add Calculator
                                // onTap: (){},
                                child: Container(child: Icon(Icons.calculate_outlined)),
                            ),
                            errorText: model.validateAmount(),
                            // suffixIconConstraints:
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                    ),
                    verticalSpaceMedium,
                    // Mode
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mode :',style:GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                          horizontalSpaceSmall,
                          Container(
                            height: 100,
                            width: physicalWidth*.26,
                            child: Wrap(
                              // scrollDirection: Axis.horizontal,
                              children: [
                                // Cash
                                TransferTypeButton(
                                  svgPath: 'images/money_cash.svg',
                                  name: CASH,
                                  color: model.currentModeButton == CASH ? model.currentThemeColor : null,
                                  onTap: (value) => model.onTapMode(value)
                                ),
                                horizontalSpaceSmall,
                                // UPI
                                TransferTypeButton(
                                  svgPath: 'images/upi.svg',
                                    name: UPI,
                                    color: model.currentModeButton == UPI ? model.currentThemeColor : null,
                                    onTap: (value) => model.onTapMode(value)
                                ),
                                horizontalSpaceSmall,
                                // Net Banking
                                TransferTypeButton(
                                    svgPath: 'images/netbanking.svg',
                                    name: NETBANKING,
                                    color: model.currentModeButton == NETBANKING ? model.currentThemeColor : null,
                                    onTap: (value) => model.onTapMode(value)),
                                horizontalSpaceSmall,
                                // Google Pay
                                TransferTypeButton(
                                    svgPath: 'images/google_pay.svg',
                                    name: GOOGLEPAY,
                                    color: model.currentModeButton == GOOGLEPAY ? model.currentThemeColor : null,
                                    onTap: (value) => model.onTapMode(value)
                                ),
                                horizontalSpaceSmall,
                                // Phone Pe
                                TransferTypeButton(
                                    svgPath: 'images/phonepe_logo.svg',
                                    name: PHONEPE,
                                    color: model.currentModeButton == PHONEPE ? model.currentThemeColor : null,
                                    onTap: (value) => model.onTapMode(value)
                                ),
                                horizontalSpaceSmall,
                                // Amazon UPI
                                TransferTypeButton(
                                  svgPath: 'images/amazon.svg',
                                    name: AMAZONPAY,
                                    color: model.currentModeButton == AMAZONPAY ? model.currentThemeColor : null,
                                    onTap: (value) => model.onTapMode(value)
                                ),
                                horizontalSpaceSmall,
                                // Debit Card
                                TransferTypeButton(
                                    svgPath: 'images/debit_card.svg',
                                    name: DEBITCARD,
                                    color: model.currentModeButton == DEBITCARD ? model.currentThemeColor : null,
                                    onTap: (value) => model.onTapMode(value)
                                ),
                                horizontalSpaceSmall,
                                // Credit Card
                                TransferTypeButton(
                                    svgPath:
                                    'images/credit_card.svg',
                                    name: CREDITCARD,
                                    color: model.currentModeButton == CREDITCARD ? model.currentThemeColor : null,
                                    onTap: (value) => model.onTapMode(value)
                                ),
                                horizontalSpaceSmall,
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                    // Recurring
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RecurringButtons(
                            buttonTitle: 'Recurring',
                            onTap: (value)=>model.onTapRecurringButton(value),
                            color: model.recurring ? model.currentThemeColor:null,
                            circleColor: model.recurring ? model.currentCircleThemeColor:null,
                            index: 0,
                          ),
                          horizontalSpaceSmall,
                          RecurringButtons(
                            buttonTitle: 'Non-Recurring',
                            onTap: (value)=>model.onTapRecurringButton(value),
                            color: model.recurring ?null: model.currentThemeColor,
                            circleColor: model.recurring ?null: model.currentCircleThemeColor,
                            index: 1,
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    // Category
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Category :',style:GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: physicalWidth*.23,
                                child: DropdownButton<String>(
                                  hint: Text('Select Category'),
                                  icon: Icon(Icons.arrow_drop_down),
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                  iconSize: 36,
                                  isExpanded: true,
                                  borderRadius: BorderRadius.circular(12),
                                  value: model.currentCategory,
                                  onChanged: (value) => model.onChangedCategory(value!),
                                  items: model.currentCategoryList.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color:model.validateCategory() != null ?Colors.red:Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),
                          //error Text
                          model.validateCategory() != null ? Text(model.validateCategory(),style: TextStyle(color: Colors.red),) : Container(),
                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                    // Duration
                    model.recurring?
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Duration :',style:GoogleFonts.roboto(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                width: physicalWidth*.23,
                                child: DropdownButton<String>(
                                  hint: Text('Select Duration'),
                                  icon: Icon(Icons.arrow_drop_down),
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                  iconSize: 36,
                                  isExpanded: true,
                                  borderRadius: BorderRadius.circular(12),
                                  value: model.currentRecurringDuration,
                                  onChanged: (value) => model.onChangedDuration(value!),
                                  items: model.durationList.map((valueItem) {
                                    return DropdownMenuItem(
                                      value: valueItem,
                                      child: Text(valueItem),
                                    );
                                  }).toList(),
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(color:model.validateRecurringDuration() != null ?Colors.red:Colors.black),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //error Text
                        model.validateRecurringDuration() != null ? Text(model.validateRecurringDuration(),style: TextStyle(color: Colors.red),) : Container(),
                        verticalSpaceMedium,
                      ],
                    )
                        : Container(),
                    // Note
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            keyboardType: TextInputType.name,
                            controller: noteController,
                            focusNode: noteFocusNode,
                            onChanged: (value)=>model.onChangedNote(value),
                            style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0)
                              ),
                              label: Text('Note'),
                              errorText: model.validateNote(),
                            ),

                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        verticalSpaceMedium,
                      ],
                    ),
                    // Warranty
                    model.currentType==0?
                    !model.recurring?
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: physicalWidth*.19,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                controller: warrantyController,
                                focusNode: warrantyFocusNode,
                                style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0)
                                  ),
                                  label: Text('Warranty'),
                                ),
                                textInputAction: TextInputAction.next,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              width: physicalWidth*.15,
                              child: DropdownButton<String>(
                                hint: Text('Select Duration'),
                                icon: Icon(Icons.arrow_drop_down),
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
                                iconSize: 36,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(12),
                                value: model.currentWarrantyDurationType,
                                onChanged: (value) => model.onChangedDurationType(value!),
                                items: model.warrantyDurationTypeList.map((valueItem) {
                                  return DropdownMenuItem(
                                    value: valueItem,
                                    child: Text(valueItem),
                                  );
                                }).toList(),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                      ],
                    ):Container()
                        :Container(),
                    //Invoice
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(model.currentType == 1 ? 'Payslip/Receipt :':'Invoice/Receipt :',style:GoogleFonts.roboto(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                          GestureDetector(
                            onTap: (){},
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  width: physicalWidth*.13,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      FaIcon(FontAwesomeIcons.paperclip),
                                      Column(
                                        children: [
                                          Text('Attach File',style:GoogleFonts.roboto(
                                              fontSize: 18, fontWeight: FontWeight.bold)),
                                          Text('xyz.pdf',style:GoogleFonts.roboto(
                                              fontSize: 14, fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: model.currentThemeColor,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceLarge,
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => model.onClickSaveButton(),
                child: Icon(Icons.check,color: Colors.white, size: 35,),
                backgroundColor: model.currentCircleThemeColor,
              ),
            ),
        viewModelBuilder: () => AddTransactionViewModel());
  }
}