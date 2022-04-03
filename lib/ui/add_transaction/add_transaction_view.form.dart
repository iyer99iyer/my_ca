// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String DateValueKey = 'date';
const String AmountValueKey = 'amount';
const String NoteValueKey = 'note';
const String WarrantyValueKey = 'warranty';

mixin $AddTransactionView on StatelessWidget {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController warrantyController = TextEditingController();
  final FocusNode dateFocusNode = FocusNode();
  final FocusNode amountFocusNode = FocusNode();
  final FocusNode noteFocusNode = FocusNode();
  final FocusNode warrantyFocusNode = FocusNode();

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    dateController.addListener(() => _updateFormData(model));
    amountController.addListener(() => _updateFormData(model));
    noteController.addListener(() => _updateFormData(model));
    warrantyController.addListener(() => _updateFormData(model));
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(
        model.formValueMap
          ..addAll({
            DateValueKey: dateController.text,
            AmountValueKey: amountController.text,
            NoteValueKey: noteController.text,
            WarrantyValueKey: warrantyController.text,
          }),
      );

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    dateController.dispose();
    dateFocusNode.dispose();
    amountController.dispose();
    amountFocusNode.dispose();
    noteController.dispose();
    noteFocusNode.dispose();
    warrantyController.dispose();
    warrantyFocusNode.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get dateValue => this.formValueMap[DateValueKey] as String?;
  String? get amountValue => this.formValueMap[AmountValueKey] as String?;
  String? get noteValue => this.formValueMap[NoteValueKey] as String?;
  String? get warrantyValue => this.formValueMap[WarrantyValueKey] as String?;

  bool get hasDate => this.formValueMap.containsKey(DateValueKey);
  bool get hasAmount => this.formValueMap.containsKey(AmountValueKey);
  bool get hasNote => this.formValueMap.containsKey(NoteValueKey);
  bool get hasWarranty => this.formValueMap.containsKey(WarrantyValueKey);

  bool get hasDateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey]?.isNotEmpty ?? false;
  bool get hasAmountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey]?.isNotEmpty ?? false;
  bool get hasNoteValidationMessage =>
      this.fieldsValidationMessages[NoteValueKey]?.isNotEmpty ?? false;
  bool get hasWarrantyValidationMessage =>
      this.fieldsValidationMessages[WarrantyValueKey]?.isNotEmpty ?? false;

  String? get dateValidationMessage =>
      this.fieldsValidationMessages[DateValueKey];
  String? get amountValidationMessage =>
      this.fieldsValidationMessages[AmountValueKey];
  String? get noteValidationMessage =>
      this.fieldsValidationMessages[NoteValueKey];
  String? get warrantyValidationMessage =>
      this.fieldsValidationMessages[WarrantyValueKey];
}

extension Methods on FormViewModel {
  setDateValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DateValueKey] = validationMessage;
  setAmountValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AmountValueKey] = validationMessage;
  setNoteValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NoteValueKey] = validationMessage;
  setWarrantyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[WarrantyValueKey] = validationMessage;
}
